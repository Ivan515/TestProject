//
//  UIStoryboard+Extension.swift
//  TestProject
//
//  Created by Ivan Apet on 7/24/20.
//  Copyright © 2020 Ivan Apet. All rights reserved.
//

import UIKit

extension UIStoryboard {
    public func instantiate<T: UIViewController>(_ type: T.Type) -> T {
        guard let vc = self.instantiateViewController(withIdentifier: String(describing: type.self)) as? T else {
            fatalError("Could not instantiate view controller \(T.self)") }
        return vc
    }
    
    public static var main: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
}
