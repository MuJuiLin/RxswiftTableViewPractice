//
//  TIReportViewModelTests.swift
//  RxSwiftTableDemoTests
//
//  Created by MuRay Lin on 2018/10/31.
//  Copyright © 2018年 com.isunClub. All rights reserved.
//

import XCTest
import RxSwift
@testable import RxSwiftTableDemo

class TIReportViewModelTests: XCTestCase {
    let disposeBag = DisposeBag()
    
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

    func testCreateReport() {
        let viewModel = TIReportViewModel()
        viewModel.inputs.viewDidLoad()
        viewModel.inputs.setUsername("user")
        viewModel.inputs.setProblem("problem")
        viewModel.outputs.newReport.asObservable().asDriver(onErrorJustReturn: nil).drive(onNext: { (report) in
            guard let report = report else {return}
            XCTAssert(report.title != nil)
            XCTAssert(report.userName != nil)
        }).disposed(by: disposeBag)
        viewModel.inputs.sendButtonTapped()
    }
    
    func testCreateNoNameReport() {
        let viewModel = TIReportViewModel()
        viewModel.inputs.viewDidLoad()
        viewModel.inputs.setProblem("problem")
        viewModel.outputs.newReport.asObservable().asDriver(onErrorJustReturn: nil).drive(onNext: { (report) in
            guard let report = report else {return}
            XCTAssert(report.userName == "no name")
        }).disposed(by: disposeBag)
        viewModel.inputs.sendButtonTapped()
    }
    
    func testModifyReport() {
        let report = Report.init(title: "title", content: "content", userName: "userName", printScreen: nil)
        let viewModel = TIReportViewModel(withDependency: report)
        viewModel.inputs.viewDidLoad()
        viewModel.inputs.setUsername("user")
        viewModel.inputs.setProblem("problem")
        viewModel.outputs.newReport.asObservable().asDriver(onErrorJustReturn: nil).drive(onNext: { (report) in
            guard let report = report else {return}
            XCTAssert(report.title != "title")
            XCTAssert(report.userName != "userName")
        }).disposed(by: disposeBag)
        viewModel.inputs.sendButtonTapped()
    }

    func testNilReport() {
       let viewModel = TIReportViewModel()
        viewModel.inputs.viewDidLoad()
        viewModel.outputs.newReport.asObservable().asDriver(onErrorJustReturn: nil).drive(onNext: { (report) in
            XCTAssert(report == nil)
        }).disposed(by: disposeBag)
        viewModel.inputs.sendButtonTapped()
    }

    func testDeleteReportInfo() {
        let report = Report.init(title: "title", content: "content", userName: "userName", printScreen: nil)
        let viewModel = TIReportViewModel(withDependency: report)
        viewModel.inputs.viewDidLoad()
        viewModel.inputs.setUsername("")
        viewModel.inputs.setProblem("")
        viewModel.outputs.newReport.asObservable().asDriver(onErrorJustReturn: nil).drive(onNext: { (report) in
            XCTAssert(report == nil)
        }).disposed(by: disposeBag)
        viewModel.inputs.sendButtonTapped()
    }
}
