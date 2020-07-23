//
//  DetailsLayoutManager.swift
//  TestProject
//
//  Created by Ivan Apet on 7/21/20.
//  Copyright © 2020 Ivan Apet. All rights reserved.
//

import UIKit

class DetailsLayoutManager: NSObject {

    private let model: CarInfoModel!
    private let vc: DetailsViewController!
    private let tableView: UITableView!
    
    private var cellData = [UITableViewCell]()
        
    init(vc: DetailsViewController, model: CarInfoModel, tableView: UITableView) {
        self.vc = vc
        self.model = model
        self.tableView = tableView
        super.init()
        configure()
    }
}

extension DetailsLayoutManager {
    func configure() {
        makeCells()
        tableView.dataSource = self
    }
}

extension DetailsLayoutManager : UITableViewDelegate {
    
}

extension DetailsLayoutManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cellData[indexPath.row]
    }
}

// MARK: -
// MARK: - cells
extension DetailsLayoutManager {
    func makeCells() {
        cellData.append(photosCell(model: model))
        cellData.append(generalInfoCell(model: model))
        cellData.append(oneLabelCell(type: .empty))
        cellData.append(progressCell(model: model))
        cellData.append(oneLabelCell(type: .listingDetails))
        cellData.append(smallInfoCell(type: .price, infoValue: model.makeCarPrice()))
        cellData.append(smallInfoCell(type: .photos, infoValue: model.makePhotosCountString()))
        cellData.append(oneLabelCell(type: .vehicleDetails))
        cellData.append(smallInfoCell(type: .trim, infoValue: model.trim ?? ""))
        cellData.append(smallInfoCell(type: .features, infoValue: "Add Features"))
        cellData.append(smallInfoCell(type: .transmission, infoValue: model.transmission))
        cellData.append(smallInfoCell(type: .mileage, infoValue: model.makeMillesString()))
        cellData.append(smallInfoCell(type: .zipCode, infoValue: model.addresses.first?.zipcode))
        cellData.append(oneLabelCell(type: .contactInfo))
        cellData.append(smallInfoCell(type: .email, infoValue: model.owner?.email))
        cellData.append(smallInfoCell(type: .phone, infoValue: model.phone))
    }
}

extension DetailsLayoutManager {
    func photosCell(model: CarInfoModel) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: ImagesTableCell.self)
        cell.set(images: model.images)
        return cell
    }
    
    func generalInfoCell(model: CarInfoModel) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: GeneralInfoTableCell.self)
        cell.set(model: model)
        return cell
    }
    
    func oneLabelCell(type: OneLabelCellType) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: OneLabelTableCell.self)
        cell.set(type: type)
        return cell
    }
    
    func progressCell(model: CarInfoModel) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: ProgressTableCell.self)
        cell.set(model: model)
        return cell
    }
    
    func smallInfoCell(type: InfoCellType, infoValue: String?) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: SmallInfoTableCell.self)
        cell.set(type: type, value: infoValue)
        return cell
    }
}

