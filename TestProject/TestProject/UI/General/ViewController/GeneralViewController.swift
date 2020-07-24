//
//  GeneralViewController.swift
//  TestProject
//
//  Created by Ivan Apet on 7/23/20.
//  Copyright © 2020 Ivan Apet. All rights reserved.
//

import UIKit

class GeneralViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var layoutManager: GeneralLayoutManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    public func openDetailsFor(model: CarInfoModel) {
        guard let vc = storyboard?.instantiate(DetailsViewController.self) else {return}
        vc.model = model
        navigationController?.pushViewController(vc, animated: true)
    }

}

extension GeneralViewController {
    func configure() {
        layoutManager = GeneralLayoutManager(vc: self, tableView: tableView)
    }
}
