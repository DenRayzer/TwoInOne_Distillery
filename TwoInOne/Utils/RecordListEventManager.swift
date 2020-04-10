//
//  RecordListEventManager.swift
//  TwoInOne
//
//  Created by Елизавета on 08.04.2020.
//  Copyright © 2020 Елизавета. All rights reserved.
//

import Foundation
class RecordsListEventManager {
    
    let listener: RecordsListObserver
    
    init(_ listener: RecordsListObserver) {
        self.listener = listener
    }
    
    func notifyAttemptItemSelected() {
        listener.sortByAttemptsCount()
    }
    
    func notifyNumberItemSelected() {
        listener.sortByGuessNumber()
    }
    
}
