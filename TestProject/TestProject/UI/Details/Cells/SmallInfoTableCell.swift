//
//  SmallInfoTableCell.swift
//  TestProject
//
//  Created by Ivan Apet on 7/22/20.
//  Copyright © 2020 Ivan Apet. All rights reserved.
//

import UIKit

enum InfoCellType {
    case price
    case photos
    case trim
    case features
    case transmission
    case mileage
    case zipCode
    case email
    case phone
    
    func makeTitle() -> String {
        switch self {
        case .price: return "Price"
        case .photos: return "Photos"
        case .trim: return "Trim"
        case .features: return "Features"
        case .transmission: return "Transmission"
        case .mileage: return "Mileage"
        case .zipCode: return "Zip Code"
        case .email: return "Email"
        case .phone: return "Phone"
        }
    }
    
    func isNeedSeparator() -> Bool {
        switch self {
        case .price, .trim, .features, .transmission, .mileage, .email:
            return true
        default:
            return false
        }
    }
    
    func isNeedLeftArrow() -> Bool {
        switch self {
        case .mileage: return false
        default: return true
        }
    }
    
    func valueLblColor() -> UIColor {
        switch self {
        case .features: return #colorLiteral(red: 0.3832074106, green: 0.7979181409, blue: 0.9956780076, alpha: 1)
        default: return #colorLiteral(red: 0.6414243579, green: 0.6748339534, blue: 0.7221559882, alpha: 1)
        }
    }
}

class SmallInfoTableCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var infoLbl: UILabel!
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var leftArrow: UIButton!
    @IBOutlet weak var arrowRightConstraint: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    public func set(type: InfoCellType, value: String?) {
        titleLbl.text = type.makeTitle()
        infoLbl.text = value
        separatorView.isHidden = !type.isNeedSeparator()
        leftArrow.isHidden = !type.isNeedLeftArrow()
        infoLbl.textColor = type.valueLblColor()
        arrowRightConstraint.constant = type.isNeedLeftArrow() ? 0 :
            -(leftArrow.frame.size.width - 16)
    }

}
