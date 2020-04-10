//
//  SimpleViewController.swift
//  TwoInOne
//
//  Created by Елизавета on 22.03.2020.
//  Copyright © 2020 Елизавета. All rights reserved.
//

import UIKit


class SimpleViewController: UIViewController{
    
    @IBOutlet private weak var attemptCount: UILabel!
    @IBOutlet private weak var userNumber: UITextField!
    
    private var attempt: Int = 5
    private var number: Int = -1
    private var recordsArray = [RecordModel]()
    private let recordsArrayKey = "Simple"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        number = getRandomValue()
        attemptCount.text = "Попыток осталось: \(attempt)"
        userNumber.delegate = self
    }
    
    @IBAction private func verifyButtonAction(_ sender: Any) {
        
        if userNumber.text!.isEmpty {
            addAlert(s: "Вы не ввели число.")
        } else {
            let a = userNumber.text!
            attempt = attempt - 1
            checkUserAns(ans: Int(a)!)
            attemptCount.text = "Попыток осталось: \(attempt)"
            userNumber.text = ""
        }
    }
    
    private func checkUserAns(ans: Int) {
        if attempt == 0 {
            addAlert(s: "Вы проиграли. Будет загадано новое число")
            restart()
        } else if ans == number {
            saveRecord(attemp: attempt, numbe: number)
            restart()
            addAlert(s: "Вы угадали! Будет запущена новая игра")
        } else if ans > number {
            addAlert(s: "Ваше значение больше")
        } else if ans < number {
            addAlert(s: "Ваше значение меньше")
        }
    }
    
    private func restart() {
        attempt = 5
        number = getRandomValue()
    }
    
    private func addAlert(s: String) {
        let alert = UIAlertController(title: s, message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert,animated: true)
    }
    
    func getRandomValue() -> Int {
        return Int.random(in: 1...10)
    }
    
    private func saveRecord(attemp: Int, numbe: Int) {
        let newRecord = RecordModel(attempt: attemp,number: numbe)
        recordsArray = getRecords(forGame: recordsArrayKey)
        recordsArray.append(newRecord)
        saveRecords(recordsArray: recordsArray, forGame: recordsArrayKey)
    }
    
}

extension SimpleViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}


