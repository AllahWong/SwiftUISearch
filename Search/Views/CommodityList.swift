//
//  CustomList.swift
//  Search
//
//  Created by Allah on 2020/7/20.
//  Copyright © 2020 Allah. All rights reserved.
//

import SwiftUI

struct CommodityList: View {
    var showProducts: [Procuct] = []
    
    var body: some View {
        VStack {
            if showProducts.count > 0{
                List(showProducts) {
                    product in
                    VStack {
                        Section(header: Text(product.speciality).frame(width: 375, height: 50, alignment: .leading).font(.body).foregroundColor(.gray).background(Color.init(red: 250, green: 250, blue: 250))) {
                            VStack {
                                ForEach(product.commoditys, id: \.self){commodity in
                                    CommodityRow(commodity: commodity).frame(width: 375, height: 60, alignment: .leading)
                                }
                            }
                        }
                }

                }.listStyle(GroupedListStyle())
                
            }
            else{
                Text("No result").foregroundColor(Color.gray)

            }
        }
        
    }
}

struct CommodityList_Previews: PreviewProvider {
    static var previews: some View {
        CommodityList()
    }
}
