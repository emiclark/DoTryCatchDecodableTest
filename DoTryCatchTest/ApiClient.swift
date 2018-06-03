//
//  ApiClient.swift
//  DoTryCatchDecodableTest
//
//  Created by Emiko Clark on 6/1/18.
//  Copyright © 2018 Emiko Clark. All rights reserved.
//

import Foundation
import UIKit

class ApiClient {
    
    static var coordinates: Coordinates?
    
    static func getCoordinateData( completion: @escaping(Coordinates)->()) {
        guard let url = URL(string: Constants.baseUrlString) else {return}
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            
            guard let data = data else {print("data nil"); return}
            
            do {
                let mainJson = try JSONDecoder().decode(MainJson.self, from: data)
                
                // create Coordinate object to pass to ViewController
                ApiClient.coordinates = Coordinates(lat: (mainJson.results![0].geometry?.location?.lat)!, long: (mainJson.results![0].geometry?.location?.lng)!, address: mainJson.results![0].formatted_address!)
                completion(ApiClient.coordinates!)
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
