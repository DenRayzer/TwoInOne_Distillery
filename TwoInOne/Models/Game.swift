//
//  Game.swift
//  TwoInOne
//
//  Created by Елизавета on 10.04.2020.
//  Copyright © 2020 Елизавета. All rights reserved.
//

import Foundation

class Game {
    private var recordsArray: [RecordModel] = []
    private let recordsArrayKey: String = ""
    
    private func saveRecord(attempt: Int, number: Int) {
              let newRecord = RecordModel(attempt: attempt,number: attempt)
                recordsArray = getRecords(forGame: recordsArrayKey)
                recordsArray.append(newRecord)
                saveRecords(recordsArray: recordsArray, forGame: recordsArrayKey)
       }
}
