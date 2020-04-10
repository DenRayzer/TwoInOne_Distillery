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
    private var number = -1
    private var attempt = 0
    private var recordsArray = [RecordModel]()
    private let recordsArrayKey = "Second"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        findNumber()
    }
    
    @IBAction func biggerButtonAction(_ sender: Any) {
        min = number + 1
        findNumber()
    }
    
    @IBAction func doneButtonAction(_ sender: Any) {
        saveRecord(attempt: attempt, number: number)
        let alert = UIAlertController(title: "Ура!", message: "Я знал с самого начала", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert,animated: true)
        attempt = 0
        min = 1
        max = 1_000_000
        findNumber()
    }
    
    @IBAction func lessButtonAction(_ sender: Any) {
        max = number - 1
        findNumber()
    }
    
    private func saveRecord(attempt: Int, number: Int) {
        let newRecord = RecordModel(attempt: attempt,number: number)
        recordsArray = getRecords(forGame: recordsArrayKey)
        recordsArray.append(newRecord)
        saveRecords(recordsArray: recordsArray, forGame: recordsArrayKey)
    }
    
    private func findNumber() {
        number = (max + min) / 2
        attempt += 1
        botAnswer.text = "Может ваше число \(number)? Попыток: \(attempt)"
    }
    
}
