//
//  TIHomeViewModelTests.swift
//  RxSwiftTableDemoTests
//
//  Created by joseewu on 2018/10/30.
//  Copyright © 2018 com.isunClub. All rights reserved.
//

import XCTest
import Alamofire
@testable import RxSwiftTableDemo
class TIHomeViewModelTests: XCTestCase {

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

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testAddNewReport() {
        let viewModel = TIHomeViewModel()
        viewModel.inputs.viewDidLoad()
        let newReport = Report.init(title: "new report", content: "content", userName: "userName", printScreen: nil)
        viewModel.inputs.updateTotalReports(newReport, atIndex: nil)
        XCTAssert(viewModel.outputs.totalReports.value.count == 1)
    }

    func testReplaceOriginReport() {
        let viewModel = TIHomeViewModel()
        viewModel.inputs.viewDidLoad()
        let newReport = Report.init(title: "new report", content: "content", userName: "userName", printScreen: nil)
        viewModel.inputs.updateTotalReports(newReport, atIndex: nil)
        let replacedReport = Report.init(title: "replaced report", content: "content", userName: "userName", printScreen: nil)
        viewModel.inputs.updateTotalReports(replacedReport, atIndex: 0)
        XCTAssert(viewModel.outputs.totalReports.value[0].title == "replaced report")
    }
}
