//
//  OwnerModel.swift
//  TestProject
//
//  Created by Ivan Apet on 7/20/20.
//  Copyright © 2020 Ivan Apet. All rights reserved.
//

import UIKit

class OwnerModel: Codable {
    
    var id: String?
    var firstName: String?
    var lastName: String?
    var photoURL: String?
    var email: String?
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case first_name
        case last_name
        case photo_url
        case email
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        firstName = try values.decodeIfPresent(String.self, forKey: .first_name)
        lastName = try values.decodeIfPresent(String.self, forKey: .last_name)
        photoURL = try values.decodeIfPresent(String.self, forKey: .photo_url)
        email = try values.decodeIfPresent(String.self, forKey: .email)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
    }
}
