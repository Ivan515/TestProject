//
//  DataProvider.swift
//  TestProject
//
//  Created by Ivan Apet on 7/20/20.
//  Copyright © 2020 Ivan Apet. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher

class DataProvider: NSObject {

    private override init() {}
    static let shared = DataProvider()
    
    private let fileName = "listings-temp"
    private let db = DatabaseManager.shared

    public func getData() -> [CarInfoModel] {
        var arr = [CarInfoModel]()
        
        guard let modelsFromJson = getArrayFromJSON(type: CarInfoModel()) else {return arr}
        arr.append(contentsOf: modelsFromJson)
        
        return arr
    }
}

extension DataProvider {
    private func getArrayFromJSON<ModelType: Decodable>(type: ModelType) -> [ModelType]? {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let json = try JSONDecoder().decode(JSON.self, from: data)
                let arrOfModels = try JSONDecoder().decode(Array<ModelType>.self, from: json.rawData())
                return arrOfModels
            } catch {
                print("Error parsing JSON")
            }
        }
        return nil
    }
}
