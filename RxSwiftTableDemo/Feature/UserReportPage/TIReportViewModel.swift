//
//  TIReportViewModel.swift
//  RxSwiftTableDemo
//
//  Created by Josee Wu on 2018/10/25.
//  Copyright © 2018 com.isunClub. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

protocol TIReportViewModelInputs {
    func viewDidLoad()
    func sendButtonTapped()
    func setUsername(_ username: String?)
    func setProblem(_ problem: String?)
}
protocol TIReportViewModelOutputs {
    var newReport:BehaviorSubject<Report?> { get set }
}

class TIReportViewModel:ViewModelBinding, ViewModelDependency, TIReportViewModelInputs, TIReportViewModelOutputs {
    var inputs: TIReportViewModelInputs { return self }
    var outputs: TIReportViewModelOutputs { return self }
    var newReport: BehaviorSubject<Report?> = BehaviorSubject.init(value: nil)
   
    var content: String?
    var userName: String?
    let disposeBag:DisposeBag = DisposeBag()
    
    init() {
        userName = nil
        content = nil
    }
    
    required init(withDependency dependency: Report) {
        userName = dependency.userName
        content = dependency.content
    }
    
    func setUsername(_ username: String?) {
        userName = username
    }
    
    func setProblem(_ problem: String?) {
        content = problem
    }

    func sendButtonTapped() {
        var report: Report? = nil
        if let userName = userName, userName.count != 0 {
            report = Report.init(title: content, content: content, userName: userName, printScreen: nil)
        }
        else if let content = content, content.count != 0 {
            report = Report.init(title: content, content: content, userName: "no name", printScreen: nil)
        }
        newReport.onNext(report)
    }
    
    func viewDidLoad() {
        // API
    }
}
