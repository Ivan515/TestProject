//
//  CustomProgressView.swift
//  TestProject
//
//  Created by Ivan Apet on 7/23/20.
//  Copyright © 2020 Ivan Apet. All rights reserved.
//

import UIKit

class CustomProgressView: UIProgressView {

    var height:CGFloat = 10.0

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let size:CGSize = CGSize.init(width: UIScreen.main.bounds.width - 32, height: height)

        return size
    }

}

