//
//  ViewController.swift
//  TestProject
//
//  Created by Ivan Apet on 7/20/20.
//  Copyright © 2020 Ivan Apet. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var btn: UIButton!
    
    var dataArr: [CarInfoModel] {
        return DataProvider.shared.getData()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "DetailsVC") as! DetailsViewController
        
        vc.model = dataArr.first
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

