//
//  ImageModel.swift
//  TestProject
//
//  Created by Ivan Apet on 7/20/20.
//  Copyright © 2020 Ivan Apet. All rights reserved.
//

import UIKit
import RealmSwift

class ImageModel: Object, Codable {

    @objc dynamic var id: String?
    @objc dynamic var urlString: String?
    
    var image: UIImage?
    
    @objc dynamic var imageData: NSData?
    
    override class func primaryKey() -> String? {
        return "urlString"
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case uri
        case url
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        if let urlValue = try values.decodeIfPresent(String.self, forKey: .url) {
            urlString = urlValue
        }
        if let uriValue = try values.decodeIfPresent(String.self, forKey: .uri) {
            urlString = uriValue
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
    }
}
