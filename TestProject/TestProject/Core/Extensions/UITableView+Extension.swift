//
//  UITableView+Extension.swift
//  TestProject
//
//  Created by Ivan Apet on 7/21/20.
//  Copyright © 2020 Ivan Apet. All rights reserved.
//

import UIKit

extension UITableView {
    public func dequeueReusableCell<T: UITableViewCell>(ofType type: T.Type) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: type.className) as? T else {
            fatalError("Couldn't find UITableViewCell of class \(type.className)")
        }
        return cell
    }
}
