//
//  NSObject+Extension.swift
//  TestProject
//
//  Created by Ivan Apet on 7/21/20.
//  Copyright © 2020 Ivan Apet. All rights reserved.
//

import Foundation

extension NSObject {
    /// String describing the class name.
    static var className: String {
        return String(describing: self)
    }
}
