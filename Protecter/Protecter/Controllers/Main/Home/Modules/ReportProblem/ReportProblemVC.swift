//
//  ReportProblemVC.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 2/8/21.
//

import UIKit
import iOSDropDown
import AVFoundation

class ReportProblemVC: BaseVC, UINavigationControllerDelegate {
    
    @IBOutlet weak var clvProblem: UICollectionView!
    @IBOutlet weak var clvMedia: UICollectionView!
    
    
    @IBOutlet weak var selectAreaView: UIView!
    @IBOutlet weak var lblSelectArea: UILabel!
    @IBOutlet weak var btnRecord: UIButton!
    @IBOutlet weak var btnCapture: UIButton!
    @IBOutlet weak var mediaView: UIView!
    @IBOutlet weak var lblMedia: LabelMediumSysPro!
    @IBOutlet weak var groupControlMedia: UIStackView!
    @IBOutlet weak var groupMedia: UIView!
    @IBOutlet weak var bottomConstraintMedia: NSLayoutConstraint!
    @IBOutlet weak var heightClvReport: NSLayoutConstraint!
    
    private let spaceItem: CGFloat = 5.0
    private let numberItemOnColumn = 3
    private let categoriesReportProblem = Contants.categoriesReportProblem
    
    //Public
    private var areas: [String]!
    
    private var medias: [MediaModel] = [MediaModel]() {
        didSet {
            self.reloadMedia()
        }
    }
    
    private var currentAudio = ""
    
    // Audio
    private var recordingSession: AVAudioSession!
    private var audioRecorder: AVAudioRecorder!
    private let audioExtension: String = "m4a"
    private var vModel: ReportProblemVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.config()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.clvProblem.addObserver(self, forKeyPath: "contentSize", options: [.new, .old, .prior], context: nil)
        setHiddenMedia(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.clvProblem.removeObserver(self, forKeyPath: "contentSize")
    }
    
    @IBAction func captureImage(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        self.presentAnimate(picker)
    }
    
    @IBAction func actionRecord(_ sender: Any) {
        if audioRecorder == nil {
            startRecording()
        } else {
            finishRecording(success: true)
        }
    }
    
    @IBAction func actionSend(_ sender: Any) {
        
        if let reportProblem = vModel.convertReportProblem(areas: self.areas, categoriesReportProblem: categoriesReportProblem, medias: medias) {
            self.vModel.sendSOS(reportProblem: reportProblem) {
                self.removeAllFileAudio()
                self.medias = []
                let alertReportVC = AlertProblemVC()
                self.presentNoneAnimation(alertReportVC)
            }
        } else {
            self.showToast(ErrorApp.error10001.rawValue)
        }
    }
    
    @IBAction func actionBack(_ sender: Any) {
        self.pop()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let collectonView = object as? UICollectionView, collectonView == clvProblem, let keyPath = keyPath, keyPath == "contentSize"{
            heightClvReport.constant = collectonView.contentSize.height
        }
    }
    
    //MARK: Private
    private func config() {
        self.clvProblem.register(UINib(nibName: ReportProblemCell.identifier, bundle: nil), forCellWithReuseIdentifier: ReportProblemCell.identifier)
        
        self.clvMedia.register(UINib(nibName: MediaCell.identifier, bundle: nil), forCellWithReuseIdentifier: MediaCell.identifier)
        
        self.vModel = ReportProblemVM(controller: self)
        
        vModel.getAreas { [weak self](areas) in
            self?.areas = areas
            self?.lblSelectArea.text = self?.areas.first
        }
        
        self.mediaView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        let tab = UITapGestureRecognizer(target: self, action: #selector(tapArea))
        self.selectAreaView.addGestureRecognizer(tab)
        
        self.configRecordAudio()
        
        self.btnCapture.layer.cornerRadius = 30
        
        self.btnRecord.layer.cornerRadius = 30
    }
    
    private func configRecordAudio() {
        recordingSession = AVAudioSession.sharedInstance()
        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
            recordingSession.requestRecordPermission() { [unowned self] allowed in
                DispatchQueue.main.async {
                    if allowed {
                        self.btnRecord.isHidden = false
                    } else {
                        self.btnRecord.isHidden = true
                    }
                }
            }
        } catch {
            self.btnRecord.isHidden = true
        }
    }
    
    private func startRecording() {
        
        let milisecond = Date().getMiliseconds()
        let audioFilename = getDocumentsDirectory().appendingPathComponent("\(milisecond).\(audioExtension)")
        self.currentAudio = "\(milisecond).\(audioExtension)"
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.delegate = self as? AVAudioRecorderDelegate
            audioRecorder.record()
            self.btnRecord.setImage(UIImage(systemName: "record.circle"), for: .normal)
        } catch {
            self.currentAudio = ""
            finishRecording(success: false)
        }
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func finishRecording(success: Bool) {
        audioRecorder.stop()
        audioRecorder = nil
        
        if success {
            self.btnRecord.setImage(#imageLiteral(resourceName: "microphone"), for: .normal)
            let audioMedia = MediaAudioModel(audioName: self.currentAudio)
            medias.append(audioMedia)
            // refresh
            self.currentAudio = ""
        } else {
            self.currentAudio = ""
        }
    }
    
    private func removeAllFileAudio() {
        let documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        do {
            let fileURLs = try FileManager.default.contentsOfDirectory(at: documentsUrl,
                                                                       includingPropertiesForKeys: nil,
                                                                       options: .skipsHiddenFiles)
            for fileURL in fileURLs {
                if fileURL.pathExtension == audioExtension {
                    try FileManager.default.removeItem(at: fileURL)
                }
            }
        } catch  { print(error) }
    }
    
    @objc func tapArea() {
        let selectAreaProtectVC = SelectAreaProtectVC()
        selectAreaProtectVC.areas = self.areas
        selectAreaProtectVC.selectedIndex = self.vModel.selectedAreaIndex
        selectAreaProtectVC.delegate = self
        self.push(selectAreaProtectVC)
    }
    
    private func calculateBotomMedia() {
        let screenSize = UIScreen.main.bounds.size
        let heightIP11: CGFloat = 896
        if screenSize.height >= heightIP11 || medias.count == 0 {
            //IP big screen: Plus, Pro,...
            self.bottomConstraintMedia.constant = 0
        } else {
            //IP small
            self.bottomConstraintMedia.constant = -120
        }
    }
    
    private func reloadMedia() {
        if medias.count == 0 {
            setHiddenMedia(true)
        } else {
            setHiddenMedia(false)
        }
        self.calculateBotomMedia()
        self.clvMedia.reloadData()
    }
    
    private func setHiddenMedia(_ hidden: Bool) {
        self.lblMedia.isHidden = hidden
        self.groupMedia.isHidden = hidden
    }
}

extension ReportProblemVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == clvProblem {
            return categoriesReportProblem.count
        } else {
            return medias.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.row
        if collectionView == clvProblem {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReportProblemCell.identifier, for: indexPath) as! ReportProblemCell
            cell.setUp(categoryProblem: categoriesReportProblem[index])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MediaCell.identifier, for: indexPath) as! MediaCell
            cell.setUp(media: medias[index], indexPath: indexPath)
            cell.delegate = self
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == clvProblem {
            let width: CGFloat = (collectionView.frame.width - CGFloat((self.numberItemOnColumn - 1)) * self.spaceItem) / CGFloat(self.numberItemOnColumn)
            let height: CGFloat = 101
            return CGSize(width: width, height: height)
        } else {
            let height = collectionView.frame.height;
            return CGSize(width: height, height: height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == clvProblem {
            return spaceItem
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == clvProblem {
            return spaceItem
        } else  {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == clvProblem {
            self.didSelectCell(current: indexPath)
            self.vModel.selectedCategoryProblemIndex = indexPath.row
        }
    }
    
    private func didSelectCell(current: IndexPath) {
        for i in 0..<self.categoriesReportProblem.count {
            let indexPath = IndexPath(row: i, section: 0)
            let cell = clvProblem.cellForItem(at: indexPath) as! ReportProblemCell
            if current == indexPath {
                cell.vBackground.backgroundColor = UIColor(hexString: "DAEBF7")
            } else {
                cell.vBackground.backgroundColor = .white
            }
        }
    }
}

extension ReportProblemVC: SelectedAreaProtectDelegate {
    func didSelectArea(index: Int) {
        let area = self.areas[index]
        self.lblSelectArea.text = area
        self.vModel.selectedAreaIndex = index
    }
}

extension ReportProblemVC: UIImagePickerControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else {
            return
        }
        let imageMedia = MediaImageModel(image: image)
        self.medias.append(imageMedia)
        self.dismissAnimate()
    }
}

extension ReportProblemVC: MediaCellDelegate {
    func removeMedia(indexPath: IndexPath) {
        self.medias.remove(at: indexPath.row);
    }
}
