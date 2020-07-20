//
//  SearchListViewModel.swift
//  Search
//
//  Created by Allah on 2020/7/16.
//  Copyright © 2020 Allah. All rights reserved.
//

import SwiftUI

class SearchListViewModel {
    
    /// 总商品
    static var productData: [Product] = []
    
    /// 获取商品数据
    static func getData() {
        jsonDataForResource(resource: "CommodityData",type: "json",result:  { (data,error, success) in
            guard success else{
                return
            }
            do{
                let decoder = JSONDecoder()
                productData = try decoder.decode(Array<Product>.self , from: data!)
            }catch let error as Error?{
                print("JSONDecoder 错误error: \(error!)")
            }
            
        })
    }
    
    
    /// 读取Bundle文件中的数据
    /// - Parameters:
    ///   - resource: 文件名
    ///   - type: 文件类型
    ///   - result: 文件中的数据
    static func jsonDataForResource(resource:String,type: String, result:(_ data: Data?, _ error: Error?, _ success: Bool) -> Void) {
        guard let path = Bundle.main.path(forResource: resource, ofType: type) else {
            print("读取Resource文件:\(resource).\(type)失败：path == nil")
            return
        }
        
        let url = URL(fileURLWithPath: path)
        do{
            let restultData = try Data(contentsOf: url)
            result(restultData,nil,true)
        }catch let error as Error?{
            print("读取Resource文件 \(resource).\(type)  出现错误error: \(error!)")
            result(nil,error,false)
        }
        
    }
    
}


extension Array{
    
    /// 根据商品品牌过滤商品
    /// - Parameter brand: 品牌名
    /// - Returns: 符合这一品牌的商品
    func filterBrand(_ brand: String) -> [Product] {
        return self.map{product in
            var t: Product = product as! Product
                   t.commoditys = t.commoditys.filter{commodity in
                                  commodity.brand.localizedStandardContains(brand)
                              }
            return t
               }.filter{
                   $0.commoditys.count > 0
               }
    }
}
