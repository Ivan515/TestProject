//
//  DetailsViewController.swift
//  TestProject
//
//  Created by Ivan Apet on 7/21/20.
//  Copyright © 2020 Ivan Apet. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var model: CarInfoModel!
    
    private var layoutManager: DetailsLayoutManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

extension DetailsViewController {
    func configure() {
        layoutManager = DetailsLayoutManager(vc: self, model: model, tableView: tableView)
    }
}


