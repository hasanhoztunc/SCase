//
//  ArrayExtensions.swift
//  SCase
//
//  Created by Hasan Oztunc on 18.02.2023.
//

import Foundation

extension Array {

    func distinct<Item: Person> /* 🤣 */ () -> [Item] {
        var seen: [Int: Bool] = [:]
        let personArray = self as! [Item]
        return personArray.filter({ seen.updateValue(true, forKey: $0.id) == nil })
    }
}
