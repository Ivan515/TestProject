//
//  GeneralLayoutManager.swift
//  TestProject
//
//  Created by Ivan Apet on 7/23/20.
//  Copyright © 2020 Ivan Apet. All rights reserved.
//

import UIKit

class GeneralLayoutManager: NSObject {
    
    private let vc: GeneralViewController!
    private let tableView: UITableView!
    
    private var dataArr = [CarInfoModel]()
    
    init(vc: GeneralViewController, tableView: UITableView) {
        self.vc = vc
        self.tableView = tableView
        super.init()
        configure()
    }
}

extension GeneralLayoutManager {
    func configure() {
        dataArr = DataProvider.shared.getData()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
    }
}

extension GeneralLayoutManager : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        vc.openDetailsFor(model: dataArr[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension GeneralLayoutManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = dataArr[indexPath.row].makeCarTitle()
        return cell
    }
}
