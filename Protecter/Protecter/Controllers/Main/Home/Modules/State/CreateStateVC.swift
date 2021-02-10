//
//  CreateStateVC.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 2/10/21.
//

import UIKit

class CreateStateVC: BaseVC {

    
    private var areas = ["Chung cư Khang Điền - Lô A - Lầu 1",
                         "Chung cư Khang Điền - Lô A - Lầu 2",
                         "Chung cư Khang Điền - Lô A - Lầu 3",
                         "Chung cư Khang Điền - Lô A - Lầu 4",
                         "Chung cư Khang Điền - Lô A - Lầu 5",
                         "Chung cư Khang Điền - Lô A - Lầu 6",
                         "Chung cư Khang Điền - Lô A - Lầu 7"
    ]
    
    private var states = ["Thiết bị PCCC", "Cửa sổ vỡ", "Bơm hư", "Máy lạnh hư"]
    
    @IBOutlet weak var lblSelectArea: UILabel!
    @IBOutlet weak var lblSelectState: UILabel!
    
    @IBOutlet weak var areaView: UIView!
    @IBOutlet weak var stateView: UIView!
    
    private var selectedIndexArea = 0;
    private var selectedIndexState = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.config()
    }
    
    @IBAction func actionBack(_ sender: Any) {
        self.pop()
    }
    
    //MARK: Private
    private func config() {
        let tapArea = UITapGestureRecognizer(target: self, action: #selector(onTapArea))
        self.areaView.addGestureRecognizer(tapArea)
        
        let tapState = UITapGestureRecognizer(target: self, action: #selector(onTapState))
        self.stateView.addGestureRecognizer(tapState)
        
        let area = self.areas[selectedIndexArea]
        self.lblSelectArea.text = area
        
        let state = self.states[selectedIndexState]
        self.lblSelectState.text = state
    }
    
    @objc func onTapArea() {
        let selectAreaProtectVC = SelectAreaProtectVC()
        selectAreaProtectVC.areas = self.areas
        selectAreaProtectVC.selectedIndex = self.selectedIndexArea
        selectAreaProtectVC.delegate = self
        self.push(selectAreaProtectVC)
    }
    
    @objc func onTapState() {
        let floatingStateVC = FloatingStateVC()
        floatingStateVC.selectedIndex = selectedIndexState
        floatingStateVC.states = states
        floatingStateVC.delegate = self
        self.presentNoneAnimation(floatingStateVC)
    }
}

extension CreateStateVC: SelectedAreaProtectDelegate {
    func didSelectArea(index: Int) {
        let area = self.areas[index]
        self.lblSelectArea.text = area
        self.selectedIndexArea = index
    }
}

extension CreateStateVC: FloatingStateDelegate {
    func didSelectState(index: Int) {
        let state = self.states[index]
        self.lblSelectState.text = state
        self.selectedIndexState = index
    }
    
    
}

