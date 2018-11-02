//
//  TIReportViewControllerTests.swift
//  RxSwiftTableDemoTests
//
//  Created by MuRay Lin on 2018/11/1.
//  Copyright © 2018年 com.isunClub. All rights reserved.
//

import XCTest
import RxSwift
import RxTest
@testable import RxSwiftTableDemo

class TIReportViewControllerTests: XCTestCase {
    let disposeBag = DisposeBag()
    let vcReport: TIReportViewController =  TIReportViewController(nibName:"TIReportViewController", bundle:nil)
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        _ = vcReport.view // To call viewDidLoad
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

    func testCreateReport() {
        vcReport.userName.text = "username"
        vcReport.userName.sendActions(for: .editingChanged)
        vcReport.problem.text = "content"
        vcReport.problem.sendActions(for: .editingChanged)
        vcReport.sendButton.sendActions(for: .touchUpInside)
        let value = try? vcReport.viewModel.outputs.newReport.value()
        XCTAssert(value??.userName == "username")
    }
}
