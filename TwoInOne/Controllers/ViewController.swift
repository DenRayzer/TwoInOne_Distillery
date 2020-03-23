//
//  ViewController.swift
//  TwoInOne
//
//  Created by Елизавета on 22.03.2020.
//  Copyright © 2020 Елизавета. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func firstButtonAction(_ sender: Any) {
        let simpleView = SimpleViewController(nibName: "SimpleViewController", bundle: nil)
              navigationController?.pushViewController(simpleView, animated: true)
    }
}

