//
//  ImageCollectionCell.swift
//  TestProject
//
//  Created by Ivan Apet on 7/21/20.
//  Copyright © 2020 Ivan Apet. All rights reserved.
//

import UIKit
import Kingfisher

class ImageCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    public func set(image: UIImage?) {
        imageView.image = image
        imageView.kf.indicator?.stopAnimatingView()
    }
    
}
extension ImageCollectionCell {
    func configure() {
        imageView.contentMode = .scaleAspectFill
        imageView.kf.indicatorType = .activity
        imageView.kf.indicator?.startAnimatingView()
    }
}
