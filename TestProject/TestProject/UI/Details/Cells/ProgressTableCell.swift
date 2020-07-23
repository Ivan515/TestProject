//
//  ProgressTableCell.swift
//  TestProject
//
//  Created by Ivan Apet on 7/22/20.
//  Copyright © 2020 Ivan Apet. All rights reserved.
//

import UIKit

class ProgressTableCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var percentLbl: UILabel!
    @IBOutlet weak var progressView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    public func set(model: CarInfoModel) {
        percentLbl.text = model.makeProgressText()
        
        let progressBar = CustomProgressView(progressViewStyle: .default)
        progressBar.progress = model.makeCurrentProgressPercent()
        progressBar.height = 10.0
        progressView.addSubview(progressBar)
    }

}
