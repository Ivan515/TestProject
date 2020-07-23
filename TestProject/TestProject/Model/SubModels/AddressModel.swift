//
//  AddressModel.swift
//  TestProject
//
//  Created by Ivan Apet on 7/20/20.
//  Copyright © 2020 Ivan Apet. All rights reserved.
//

import UIKit

class AddressModel: Codable {
    
    var id: String?
    var city: String?
    var state: String?
    var zipcode: String?
    var latitude: String?
    var longitude: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case city
        case state
        case zipcode
        case latitude
        case longitude
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        state = try values.decodeIfPresent(String.self, forKey: .state)
        zipcode = try values.decodeIfPresent(String.self, forKey: .zipcode)
        latitude = try values.decodeIfPresent(String.self, forKey: .latitude)
        longitude = try values.decodeIfPresent(String.self, forKey: .longitude)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
    }
}
