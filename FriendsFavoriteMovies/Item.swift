//
//  Item.swift
//  FriendsFavoriteMovies
//
//  Created by Marcello Gonzatto Birkan on 14/04/24.
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
