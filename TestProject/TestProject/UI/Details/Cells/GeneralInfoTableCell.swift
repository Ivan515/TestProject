//
//  GeneralInfoTableCell.swift
//  TestProject
//
//  Created by Ivan Apet on 7/21/20.
//  Copyright © 2020 Ivan Apet. All rights reserved.
//

import UIKit

class GeneralInfoTableCell: UITableViewCell {
    
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var trimLbl: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var yearView: UIView!
    @IBOutlet weak var millageLbl: UILabel!
    @IBOutlet weak var zipCodeLbl: UILabel!
    @IBOutlet weak var historyLbl: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    public func set(model: CarInfoModel) {
        priceLbl.text = model.makeCarPrice() 
        titleLbl.text = model.makeCarTitle()
        trimLbl.text =  model.trim
        yearLbl.text = model.makeYearString()
        millageLbl.text = model.makeMillesString()
        zipCodeLbl.text = model.addresses.first?.zipcode
    }

}

extension GeneralInfoTableCell {
    private func configure() {
        selectionStyle = .none
        yearView.layer.cornerRadius = 4
        yearView.layer.borderColor = UIColor.lightGray.cgColor
        yearView.layer.borderWidth = 1
    }
}
