//
//  SearchTests.swift
//  SearchTests
//
//  Created by Allah on 2020/7/16.
//  Copyright © 2020 Allah. All rights reserved.
//

import XCTest
@testable import Search

class SearchTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testFilterBrand() {
        let product1 = Product(id: 0, speciality: "Vacuum", commoditys: [Commodity(id: 1001, name: "V11", state: "in-stock", price: "$599.99", brand: "Dyson", instock: true),Commodity(id: 1002, name: "V10", state: "out-of-stock", price: "$399.99", brand: "Dyson", instock: false)])
        let product2 = Product(id: 1, speciality: "Hair Dryer", commoditys: [Commodity(id: 1003, name: "Supersonic", state: "in-stock", price: "$399.99", brand: "Dyson", instock: true)])
        XCTAssert([product1,product2].filterBrand("Dyson").count == 2, "testFilterBrand 失败提示：filterBrand(Dyson).count  != 2")
        XCTAssert([product1,product2].filterBrand("Dysony").count == 0, "testFilterBrand 失败提示：filterBrand(Dyson).count  != 0")


    }

    func testJsonDataForResource() {
        SearchListViewModel.jsonDataForResource(resource: "CommodityData",type: "json",result:  { (data,error, success) in
            XCTAssertNil(error, "testJsonDataForResource 失败提示： 读取CommodityData.json 文件失败")
        })
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
