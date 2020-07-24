//
//  ProgressModel.swift
//  TestProject
//
//  Created by Ivan Apet on 7/20/20.
//  Copyright © 2020 Ivan Apet. All rights reserved.
//

import UIKit

class ProgressModel: Codable {
    
    var current: Int = 0
    var total: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case current
        case total
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        current = try (values.decodeIfPresent(Int.self, forKey: .current) ?? 0)
        total = try (values.decodeIfPresent(Int.self, forKey: .total) ?? 0)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
    }
}
