//
//  Numeric+Extension.swift
//  TestProject
//
//  Created by Ivan Apet on 7/24/20.
//  Copyright © 2020 Ivan Apet. All rights reserved.
//

import Foundation

extension Numeric {
    var formattedWithSeparator: String { Formatter.withSeparator.string(for: self) ?? "" }
}
