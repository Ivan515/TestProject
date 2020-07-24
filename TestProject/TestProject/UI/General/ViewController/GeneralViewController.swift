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
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsViewController
        vc.model = model
        navigationController?.pushViewController(vc, animated: true)
    }

}

extension GeneralViewController {
    func configure() {
        layoutManager = GeneralLayoutManager(vc: self, tableView: tableView)
    }
}
