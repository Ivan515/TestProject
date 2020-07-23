//
//  UICollectionView+Extension.swift
//  TestProject
//
//  Created by Ivan Apet on 7/21/20.
//  Copyright © 2020 Ivan Apet. All rights reserved.
//

import UIKit

extension UICollectionView {
    public func dequeueReusableCell<T: UICollectionViewCell>(ofType type: T.Type, indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: type.className, for: indexPath) as? T else {
            fatalError("Couldn't find UITableViewCell of class \(type.className)")
        }
        return cell
    }
}
