//
//  Commodity.swift
//  Search
//
//  Created by Allah on 2020/7/16.
//  Copyright © 2020 Allah. All rights reserved.
//

import SwiftUI

struct Procuct: Hashable, Codable, Identifiable {
    var id: Int
    var speciality: String
    var commoditys: [Commodity]
}

struct Commodity:Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var state: String
    var price: String
    var brand: String
    var instock: Bool
}
