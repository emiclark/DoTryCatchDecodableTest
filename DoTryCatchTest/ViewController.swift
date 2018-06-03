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
        ApiClient.getCoordinateData { (coordinates) in
            
            // update UI on main thread
            DispatchQueue.main.async {
                self.lat.text = String(coordinates.lat)
                self.long.text = String(coordinates.long)
                self.address.text = coordinates.address
            }
        }
        
    }
}
