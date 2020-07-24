//
//  ImageService.swift
//  TestProject
//
//  Created by Ivan Apet on 7/22/20.
//  Copyright © 2020 Ivan Apet. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class ImageService {
    
    static let shared = ImageService()
    private let db = DatabaseManager.shared
    
    let semaphore = DispatchSemaphore(value: 1)
    
    func getImageFor(model: ImageModel, completion: @escaping (_ image: UIImage?) ->()) {
        if let imageFromDB = db.getImageWith(id: model.urlString ?? "") {
            completion(imageFromDB)
            return
        }
        
        DispatchQueue.main.async {
            self.downloadimages(model: model) { (downloadedImage) in
                completion(downloadedImage)
            }
        }
    }
}

extension ImageService {
    private func downloadimages(model: ImageModel, completion: @escaping (_ image: UIImage?) -> ()) {
        guard let urlString = model.urlString else {
            completion(nil)
            return
        }
        if model.imageData != nil {
            completion(nil)
            return
        }
        
        let downloader = ImageDownloader.default
        downloader.downloadImage(with: URL(string: urlString)!) {result in
            self.semaphore.wait()
            switch result {
            case .success(let value):
                print(value.image)
                model.image = value.image
                let data = value.image.jpegData(compressionQuality: 0.5)
                model.imageData = data as NSData?
                DatabaseManager.shared.saveImage(model: model)
                completion(value.image)
                self.semaphore.signal()
            case .failure(let error):
                print(error)
                completion(nil)
            }
        }
    }
}
