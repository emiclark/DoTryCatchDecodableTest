//
//  Model.swift
//  DoTryCatchDecodableTest
//
//  Created by Emiko Clark on 6/1/18.
//  Copyright © 2018 Emiko Clark. All rights reserved.
//

import Foundation

struct MainJson: Decodable {
    var results: [Results]?
}

struct Location: Decodable {
    var lat : Float?
    var lng : Float?
}

struct Geometry: Decodable {
    var location: Location?
}

struct Results: Decodable {
    var formatted_address: String?
    var geometry : Geometry?
}

class Coordinates: Decodable {
     var lat: Float
     var long: Float
     var address: String
    
    init(lat: Float, long: Float, address: String) {
        self.lat = lat
        self.long = long
        self.address = address
    }
}
