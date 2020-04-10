//
//  RecordModel.swift
//  TwoInOne
//
//  Created by Елизавета on 10.04.2020.
//  Copyright © 2020 Елизавета. All rights reserved.
//

import Foundation

public class RecordModel: NSObject, NSCoding {
    
    let attempt: Int
    let number: Int
    
    public required init?(coder: NSCoder) {
        attempt = coder.decodeObject(forKey: "attempt") as? Int ?? coder.decodeInteger(forKey: "attempt")
        number = coder.decodeObject(forKey: "number") as? Int ?? coder.decodeInteger(forKey: "number")
    }
    
    public func encode(with coder: NSCoder) {
        coder.encode(attempt,forKey: "attempt")
        coder.encode(number,forKey: "number")
    }
    
    init(attempt: Int, number: Int) {
        self.attempt = attempt
        self.number = number
    }
}

public func saveRecords(recordsArray: [RecordModel], forGame key: String) {
    let encodedData = NSKeyedArchiver.archivedData(withRootObject: recordsArray)
    UserDefaults.standard.set(encodedData, forKey: key)
    UserDefaults.standard.synchronize()
    print("encoded")
}

func getRecords(forGame key: String) -> [RecordModel] {
    if let decoded  = UserDefaults.standard.object(forKey: key) as? Data {
        print ("decoded")
        if let array = NSKeyedUnarchiver.unarchiveObject(with: decoded) as? [RecordModel] {
            return array
        } else {
            return []
        }
    } else {
        return []
    }
    
    
}
