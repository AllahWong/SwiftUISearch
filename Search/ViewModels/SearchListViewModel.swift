//
//  SearchListViewModel.swift
//  Search
//
//  Created by Allah on 2020/7/16.
//  Copyright © 2020 Allah. All rights reserved.
//

import SwiftUI

class SearchListViewModel {
    static var productData: [Procuct] = []
    static func getData() {
        jsonDataForResource(resource: "CommodityData",type: "json",result:  { (data,error, success) in
            guard success else{
                return
            }
            do{
                let decoder = JSONDecoder()
                productData = try decoder.decode(Array<Procuct>.self , from: data!)
            }catch let error as Error?{
                print("JSONDecoder 错误error: \(error!)")
            }
            
        })
    }
    
    static func jsonDataForResource(resource:String,type: String, result:(_ data: Data?, _ error: Error?, _ success: Bool) -> Void) {
        let path = Bundle.main.path(forResource: resource, ofType: type)
        let url = URL(fileURLWithPath: path!)
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
    func filterBrand(_ brand: String) -> [Procuct] {
        return self.map{product in
            var t: Procuct = product as! Procuct
                   t.commoditys = t.commoditys.filter{commodity in
                                  commodity.brand.localizedStandardContains(brand)
                              }
            return t
               }.filter{
                   $0.commoditys.count > 0
               }
    }
}
