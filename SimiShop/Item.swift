//
//  Item.swift
//  SimiShop
//
//  Created by Zap Islas on 17/07/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
