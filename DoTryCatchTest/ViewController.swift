//
//  ViewController.swift
//  DoTryCatchTest
//
//  Created by Emiko Clark on 3/22/18.
//  Copyright © 2018 Emiko Clark. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lat: UILabel!
    @IBOutlet weak var long: UILabel!
    @IBOutlet weak var address: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ApiClient.getAddressCoordinates(completion:  { (coordinateInfo) in
            
            DispatchQueue.main.async {
                self.lat.text = "Latitude: \(String(describing: coordinateInfo.lat))"
                self.long.text = "Longitude: \(String(describing: coordinateInfo.long))"
                self.address.text = "Address: \(coordinateInfo.address)"
            }
        })
    }
}

