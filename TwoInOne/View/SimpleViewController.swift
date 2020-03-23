//
//  SimpleViewController.swift
//  TwoInOne
//
//  Created by Елизавета on 22.03.2020.
//  Copyright © 2020 Елизавета. All rights reserved.
//

import UIKit

class SimpleViewController: UIViewController {
    @IBOutlet weak var attemptCount: UILabel!
    @IBOutlet weak var userNumber: UITextField!
    private var attempt: Int = 3
    private var number: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        number = getRandomValue()
        attemptCount.text = "Попыток осталось: \(attempt)"
        userNumber.delegate = self
    }
    
    @IBAction func verifyButtonAction(_ sender: Any) {
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
    
    func checkUserAns(ans: Int) {
        if attempt == 0 {
            addAlert(s: "Вы проиграли. Будет загадано новое число")
            restart()
        } else if ans == number {
            restart()
            addAlert(s: "Вы угадали! Будет запущена новая игра")
        } else if ans > number { addAlert(s: "Ваше значение больше")
        } else if ans < number { addAlert(s: "Ваше значение меньше") }
    }
    
    func restart() {
        attempt = 3
        number = getRandomValue()
    }
    
    func addAlert(s: String) {
        let alert = UIAlertController(title: s, message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert,animated: true)
    }
    
    func getRandomValue() -> Int {
        return Int.random(in: 1...10)
    }
}

extension SimpleViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}
