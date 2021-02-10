//
//  HomeVC.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 1/23/21.
//

import Foundation
import UIKit
import CoreLocation

class HomeVC: BaseVC {
    
    @IBOutlet weak var clvMoudle: UICollectionView!
    private let locationManager = CLLocationManager()
    private var currentLocation: CLLocationCoordinate2D?
    
    @IBOutlet weak var lblSheet: UILabel!
    @IBOutlet weak var imvSheet: UIImageView!
    @IBOutlet weak var lblWelcome: UILabel!
    
    //Logic
    private let viewModel = HomeVM()
    private var user: UserModel!
    private var modules: [ModuleModel]! {
        didSet {
            self.clvMoudle.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.congig()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barTintColor = Constants.Color.main
        
        self.user = Constants.global.user
        self.modules = Constants.global.user.role.getModule()
        
        self.lblWelcome.text = "Welcome! \(user.userName!)"
    }
    // MARK: Private
    private func congig() {
        self.clvMoudle.register(UINib(nibName: ModuleCell.identifier, bundle: nil), forCellWithReuseIdentifier: ModuleCell.identifier)
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    private func reloadSheet() {
        if(self.viewModel.isInSheet == true) {
            self.lblSheet.text = "Ra ca"
            self.imvSheet.image = UIImage(named: "sheetRight")
        } else {
            self.lblSheet.text = "Vào ca"
            self.imvSheet.image = UIImage(named: "sheetLeft")
        }
    }
    
    // MARK: Action
    @IBAction func actionMenu(_ sender: Any) {
        let menuVC = Utils.storyboary(screen: .menu, asClass: MenuVC.self)
        self.push(menuVC)
    }
    
    @IBAction func actionCheckIn(_ sender: Any) {
        if let currentLocation = self.currentLocation {
            self.viewModel.validateCheckIn(current: currentLocation) { (allow, location) in
                if allow {
                    
                    self.viewModel.isInSheet = true
                    self.reloadSheet()
                } else {
                    self.showToast("Vị trí của bạn đang cách xa khu vực làm việc")
                }
            }
        } else {
            self.showToast("Vui lòng mở gps")
        }
    }
    
    @IBAction func actionReportProblem(_ sender: Any) {
        let reportProblemVC = Utils.storyboary(screen: .reportProblem, asClass: ReportProblemVC.self)
        self.push(reportProblemVC)
    }
}

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modules.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ModuleCell.identifier, for: indexPath) as! ModuleCell
        let module = modules[indexPath.row]
        cell.setUp(module)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width / 2 - 10
        return CGSize(width: width, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let module = self.modules[indexPath.row]
        self.push(module.vc)
    }
}

extension HomeVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            manager.stopUpdatingLocation()
            self.render(location)
        }
    }
    
    private func render(_ location: CLLocation) {
        self.currentLocation = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
    }
}
