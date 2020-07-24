//
//  Formatter+Extension.swift
//  TestProject
//
//  Created by Ivan Apet on 7/24/20.
//  Copyright © 2020 Ivan Apet. All rights reserved.
//

import Foundation

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        return formatter
    }()
}
