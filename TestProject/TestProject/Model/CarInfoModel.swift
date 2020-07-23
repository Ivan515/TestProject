//
//  CarInfoModel.swift
//  TestProject
//
//  Created by Ivan Apet on 7/20/20.
//  Copyright © 2020 Ivan Apet. All rights reserved.
//

import UIKit

class CarInfoModel: Codable {

    var id: String?
    var vin: String?
    var licensePlate: String?
    var licensePlateState: String?
    var millage: Int = 0
    var phone: String?
    var price: Int = 0
    var shortURL: String?
    var createdAt: String?
    var updatedAt: String?
    var transmission: String?
    var title: String?
    var progress: ProgressModel?
    var images: [ImageModel] = []
    var owner: OwnerModel?
    var addresses: [AddressModel] = []
    var make: String?
    var model: String?
    var year: Int = 0
    var trim: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case vin
        case license_plate
        case license_plate_state
        case mileage
        case phone
        case price
        case short_url
        case created_at
        case updated_at
        case transmission
        case title
        case progress
        case images
        case owner
        case addresses
        case make
        case model
        case year
        case trim
        
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        vin = try values.decodeIfPresent(String.self, forKey: .vin)
        licensePlate = try values.decodeIfPresent(String.self, forKey: .license_plate)
        licensePlateState = try values.decodeIfPresent(String.self, forKey: .license_plate_state)
        millage = try values.decodeIfPresent(Int.self, forKey: .mileage) ?? 0
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        price = try values.decodeIfPresent(Int.self, forKey: .price) ?? 0
        shortURL = try values.decodeIfPresent(String.self, forKey: .short_url)
        createdAt = try values.decodeIfPresent(String.self, forKey: .created_at)
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updated_at)
        transmission = try values.decodeIfPresent(String.self, forKey: .transmission)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        progress = try values.decodeIfPresent(ProgressModel.self, forKey: .progress) 
        if let images = try values.decodeIfPresent([ImageModel].self, forKey: .images) {
            self.images.append(contentsOf: images)
        }
        
        owner = try values.decodeIfPresent(OwnerModel.self, forKey: .owner)
//        addresses
        make = try values.decodeIfPresent(String.self, forKey: .make)
        model = try values.decodeIfPresent(String.self, forKey: .model)
        year = try values.decodeIfPresent(Int.self, forKey: .year) ?? 0
        trim = try values.decodeIfPresent(String.self, forKey: .trim)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
    }
}

extension CarInfoModel {
    func makeCarPrice() -> String {
        return "$\(price)" //сделать разделение по тысячам
    }
    
    func makeCarTitle() -> String {
        if let make = self.make, let model = self.model {
            return "\(make) \(model)"
        }
        if make == nil, model != nil {
            return model!
        }
        if model == nil, make != nil {
            return make!
        }
        return String()
    }
    
    func makeYearString() -> String {
        return "\(year)"
    }
    
    func makeMillesString() -> String {
        return "\(millage) milles"
    }
    
    func makeProgressText() -> String {
        var value = "0%"
        if let currentValue = progress?.current {
            value = "\(currentValue)%"
        }
        return value
    }
    
    func makePhotosCountString() -> String {
        return "\(images.count) Photos"
    }
}
