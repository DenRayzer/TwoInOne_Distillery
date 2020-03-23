//
//  SecondController.swift
//  TwoInOne
//
//  Created by Елизавета on 22.03.2020.
//  Copyright © 2020 Елизавета. All rights reserved.
//
import UIKit

class SecondViewController: UIViewController {
   @IBOutlet weak var botAnswer: UILabel!
   private var min = 1
   private var max = 1_000_000
   private var value = -1
   private var tryNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        findNumber()
    }
    
    @IBAction func biggerButtonAction(_ sender: Any) {
        min = value + 1
        findNumber()
    }
    
    @IBAction func doneButtonAction(_ sender: Any) {
        let alert = UIAlertController(title: "Ура!", message: "Я знал с самого начала", preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
               present(alert,animated: true)
        tryNumber = 0
        min = 1
        max = 1_000_000
        findNumber()
    }
    
    @IBAction func lessButtonAction(_ sender: Any) {
        max = value - 1
        findNumber()
    }
    
   private func findNumber() {
        value = (max + min) / 2
        tryNumber += 1
        botAnswer.text = "Может ваше число \(value)? Попыток: \(tryNumber)"
    }
}
