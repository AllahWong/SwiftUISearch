//
//  Commodity.swift
//  Search
//
//  Created by Allah on 2020/7/16.
//  Copyright © 2020 Allah. All rights reserved.
//

import SwiftUI

struct Product: Hashable, Codable, Identifiable {
    
    /// 产品 id
    var id: Int
    
    /// 产品特性
    var speciality: String
    
    /// 有该特性的商品
    var commoditys: [Commodity]
}

struct Commodity:Hashable, Codable, Identifiable {
    
    /// 商品 id
    var id: Int
    
    /// 商品名称
    var name: String
    
    /// 商品状态
    var state: String
    
    /// 商品价格
    var price: String
    
    /// 商品品牌
    var brand: String
    
    /// 商品是否有存货
    var instock: Bool
}
