//
//  DetailListProblemVC.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 2/8/21.
//

import UIKit
import GoogleMaps
import GooglePlaces

class DetailListProblemVC: BaseVC {

    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var btnHandle: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    
    private var isDidHandle: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.config()
    }
    
    // MARK: Private
    private func config() {
        self.mapView.settings.compassButton = true
         
        self.mapView.isMyLocationEnabled = true
        self.mapView.settings.myLocationButton = true
        
        self.setLocation(coordinate: CLLocationCoordinate2D(latitude: 10.892791969607861, longitude: 106.60913298851986))
        
        if Constants.global.user.role == .protecter {
            self.btnHandle.isHidden = true
        } else if Constants.global.user.role == .lead_protecter {
            self.btnHandle.isHidden = false
        }
        //
        self.isDidHandle = true
        if self.isDidHandle {
            self.btnHandle.backgroundColor = UIColor(hexString: "23874B")
            self.btnHandle.setTitle("Đã xử lý", for: .normal)
            self.btnHandle.setTitleColor(.white, for: .normal)
        } else {
            self.btnHandle.backgroundColor = UIColor(hexString: "FCF89F")
            self.btnHandle.setTitle("Xác nhận", for: .normal)
            self.btnHandle.setTitleColor(.black, for: .normal)
        }
    }
    
    private func setLocation(coordinate: CLLocationCoordinate2D) {
        let marker = GMSMarker()
        marker.position = coordinate
        marker.title = "Location"
        marker.snippet = "Snippet demo"
        
        let markerImage = #imageLiteral(resourceName: "icons8-user-location-96")
        let markerView = UIImageView(image: markerImage)
        marker.iconView = markerView
        marker.map = self.mapView
        
        self.mapView.camera = GMSCameraPosition.camera(withTarget: coordinate, zoom: 15)
    }
    
    
    @IBAction func actionCancel(_ sender: Any) {
        let alertCancelProblemVC = AlertCancelProblemVC()
        self.presentNoneAnimation(alertCancelProblemVC)
    }
    
    @IBAction func actionHandle(_ sender: Any) {
        if self.isDidHandle {
            
        } else {
            
        }
    }
    
    @IBAction func actionBack(_ sender: Any) {
        self.pop()
    }
}
