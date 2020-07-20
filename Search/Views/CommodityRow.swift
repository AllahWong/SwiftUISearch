//
//  CommodityRow.swift
//  Search
//
//  Created by Allah on 2020/7/16.
//  Copyright © 2020 Allah. All rights reserved.
//

import SwiftUI

struct CommodityRow: View {
    var commodity: Commodity
    
    var body: some View {
      
        HStack {
            VStack {
                Text(commodity.name).font(.body).frame(width: 160, height: 30, alignment: .leading)
                Text(commodity.state).font(.subheadline).foregroundColor(.gray).frame(width: 160, height: 30, alignment: .leading)
                
                
            }
            Spacer()
            if self.commodity.instock{
                Text(commodity.price).frame(width: 75, height: 26, alignment: .center).background(Color.init(red: 244/255, green: 247/255, blue: 253/255)).cornerRadius(8).foregroundColor(.blue)
            }
            else{
                Text(commodity.price).frame(width: 75, height: 26, alignment: .center).background(Color.init(red: 246/255, green: 246/255, blue: 246/255)).cornerRadius(10)
            }
        }
    }
 
}

struct CommodityRow_Previews: PreviewProvider {    
    static var previews: some View {
        CommodityRow(commodity: Commodity(id: -1, name: "-1", state: "-1", price: "-1", brand: "-1",instock: false))
    }
}
