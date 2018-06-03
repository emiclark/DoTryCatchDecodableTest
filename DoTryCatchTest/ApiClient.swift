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
    
    static func getAddressCoordinates( completion: @escaping(Coordinates)->())  {
        let urlString = Constants.urlString
        guard let url = URL(string: urlString) else {print("url failed"); return}
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {print("data nil"); return}
            
            do {
                let mainJson = try JSONDecoder().decode(MainJson.self, from: data)

                ApiClient.coordinates = Coordinates(lat: (mainJson.results![0].geometry?.location?.lat)!, long: (mainJson.results![0].geometry?.location?.lng)!, address: mainJson.results![0].formatted_address!)
                completion(ApiClient.coordinates!)
            }catch let error {
                print(error)
            }
        }.resume()
        
    }
}
