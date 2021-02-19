//
//  StateView.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 2/19/21.
//

import UIKit

@objc protocol StateViewDelegate {
    func didSelectState()
    @objc optional func didSelectArea(_ vc: UIViewController)
}

class StateView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var tbvState: UITableView!
    
    @IBOutlet weak var heightConstraintArea: NSLayoutConstraint!
    
    @IBOutlet weak var heightConstraintDate: NSLayoutConstraint!
    
    @IBOutlet weak var areaView: UIView!
    
    @IBOutlet weak var lblSelectArea: UILabel!
    
    let isProtecter = Constants.global.user.role == .protecter
    
    private var selectedIndex = 0;

    //Properties
    public var items = ["Vỡ cửa"] {
        didSet {
            self.tbvState.reloadData()
        }
    }
    
    public var delegate: StateViewDelegate?
    
    public var areas = ["Chung cư Khang Điền - Lô A - Lầu 1",
                         "Chung cư Khang Điền - Lô A - Lầu 2",
                         "Chung cư Khang Điền - Lô A - Lầu 3",
                         "Chung cư Khang Điền - Lô A - Lầu 4",
                         "Chung cư Khang Điền - Lô A - Lầu 5",
                         "Chung cư Khang Điền - Lô A - Lầu 6",
                         "Chung cư Khang Điền - Lô A - Lầu 7"
    ]
    
    public var vc: BaseVC!
    
    public var isHistory: Bool = false {
        didSet {
            self.setHistory()
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    public func commonInit() {
        Bundle.main.loadNibNamed("StateView", owner: self, options: nil)
        self.addSubview(contentView)
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        Utils.setConstraintFull(with: contentView, parent: self)
        
        self.tbvState.register(UINib(nibName: StateCell.identifier, bundle: nil), forCellReuseIdentifier: StateCell.identifier)
        
        self.setProtecter()
        
        self.setHistory()
        
        let tapAreaView = UITapGestureRecognizer(target: self, action: #selector(tapArea))
        
        self.areaView.addGestureRecognizer(tapAreaView)
        self.lblSelectArea.text = areas[selectedIndex]
    }
    
    @IBAction func actionCreateState(_ sender: Any) {
        let createStateVC = CreateStateVC()
        self.vc.push(createStateVC)
    }
    
    //Private
    private func setProtecter() {
        self.heightConstraintArea.constant = self.isProtecter ? 0 : 114
    }
    
    @objc func tapArea() {
        let selectAreaProtectVC = SelectAreaProtectVC()
        selectAreaProtectVC.areas = self.areas
        selectAreaProtectVC.selectedIndex = self.selectedIndex
        selectAreaProtectVC.delegate = self
        self.delegate?.didSelectArea!(selectAreaProtectVC)
    }
    
    private func setHistory() {
        self.heightConstraintDate.constant = isHistory ? 88 : 0
    }
}

extension StateView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StateCell.identifier) as! StateCell
        if(isHistory) {
            cell.setUpOfHistory()
        } else {
            cell.setUp()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return isHistory ? 155 : 133
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.didSelectState()
    }
}

extension StateView: SelectedAreaProtectDelegate {
    func didSelectArea(index: Int) {
        let area = self.areas[index]
        self.lblSelectArea.text = area
        self.selectedIndex = index
    }
}
