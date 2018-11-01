//
//  TIHomeViewModel.swift
//  RxSwiftTableDemo
//
//  Created by Josee Wu on 2018/10/24.
//  Copyright © 2018 com.isunClub. All rights reserved.
//
import Foundation
import RxSwift
import RxCocoa

protocol TIHomeViewModelInputs {
    func viewDidLoad()
    func updateTotalReports(_ report: Report, atIndex index: Int?)
}
protocol TIHomeViewModelOutputs {
    var totalReports:BehaviorRelay<[Report]> { get set }
}

class TIHomeViewModel:ViewModelBinding, TIHomeViewModelInputs, TIHomeViewModelOutputs {

    var inputs: TIHomeViewModelInputs { return self }
    var outputs: TIHomeViewModelOutputs { return self }
    var totalReports: BehaviorRelay<[Report]> = BehaviorRelay(value: [Report]())

    func viewDidLoad() {
        // API
    }
    
    func updateTotalReports(_ report: Report, atIndex index: Int?) {
        var newValue = totalReports.value
        if let index = index {
            newValue[index] = report
        }
        else {
            newValue.append(report)
        }
        totalReports.accept(newValue)
    }
}
