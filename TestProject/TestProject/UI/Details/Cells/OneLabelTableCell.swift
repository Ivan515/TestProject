//
//  OneLabelTableCell.swift
//  TestProject
//
//  Created by Ivan Apet on 7/22/20.
//  Copyright © 2020 Ivan Apet. All rights reserved.
//

import UIKit

enum OneLabelCellType {
    case empty
    case listingDetails
    case vehicleDetails
    case contactInfo
    
    func makeTitle() -> String {
        switch self {
        case .empty: return " "
        case .listingDetails: return "Listing Details"
        case .vehicleDetails: return "VehicleDetails"
        case .contactInfo: return "Contact info"
        }
    }
}

class OneLabelTableCell: UITableViewCell {

    @IBOutlet weak var textLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    public func set(type: OneLabelCellType) {
        textLbl.text = type.makeTitle()
    }

}
