//
//  DatabaseManager.swift
//  TestProject
//
//  Created by Ivan Apet on 7/22/20.
//  Copyright © 2020 Ivan Apet. All rights reserved.
//

import Foundation
import RealmSwift

class DatabaseManager {
    private init() {}
    
    static let shared = DatabaseManager()
    
    private let realm = try! Realm()
    
}

extension DatabaseManager {
    func saveImage(model: ImageModel) {
        try! realm.write {
            realm.add(model, update: .modified)
        }
    }
    
    func getImageWith(id: String) -> UIImage? {
        let predicate = NSPredicate(format: "urlString == %@", id)
        if let imgData = realm.objects(ImageModel.self).filter(predicate).first?.imageData {
            return UIImage(data: imgData as Data)
        }
        
        return nil
    }
}
