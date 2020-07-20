//
//  SearchList.swift
//  Search
//
//  Created by Allah on 2020/7/16.
//  Copyright © 2020 Allah. All rights reserved.
//

import SwiftUI
import Combine



struct SearchList: View {
    
    ///品牌过滤的关键字，和  SearchBar显示的内容 绑定
    @State var searchText = "Dyson"
        
    init() {
        UITableView.appearance().separatorColor = .clear
        SearchListViewModel.getData()
    }
    
    var body: some View {
        NavigationView {
            CommodityList(showProducts: SearchListViewModel.productData.filterBrand(searchText)).navigationBarSearch(self.$searchText,placeholder: "Tap here to Search")
        }
        
       
    }
}


struct SearchList_Previews: PreviewProvider {
    static var previews: some View {
        SearchList()
    }
}





