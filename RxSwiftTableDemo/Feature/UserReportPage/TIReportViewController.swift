//
//  TIReporViewController.swift
//  RxSwiftTableDemo
//
//  Created by Josee Wu on 2018/10/25.
//  Copyright © 2018 com.isunClub. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol TIReportViewControllerDelegate:class {
    func addNewReport(_ report:Report)
}

class TIReportViewController: UIViewController {
    var originReport: Report?
    var disposeBag: DisposeBag = DisposeBag()
    var viewModel: TIReportViewModel!
    weak var delegate:TIReportViewControllerDelegate?

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var problem: UITextField!
    @IBOutlet weak var sendButton: UIButton!

    @IBAction func send(_ sender: Any) {
        viewModel.inputs.sendButtonTapped()
    }
    @IBAction func inputUsername(_ sender: UITextField) {
        viewModel.inputs.setUsername(sender.text)
    }
    @IBAction func inputProblem(_ sender: UITextField) {
        viewModel.inputs.setProblem(sender.text)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
        bindViewModel()
        viewModel.inputs.viewDidLoad()
    }

    func initViewModel() {
        if let originReport = originReport {
            viewModel = TIReportViewModel(withDependency: originReport)
            userName.text = originReport.userName
            problem.text = originReport.content
        }
        else {
            viewModel = TIReportViewModel()
        }
    }

    func bindViewModel() {
        viewModel.outputs.newReport.asDriver(onErrorJustReturn: nil).drive(onNext: { [weak self] (report) in
            guard let report = report else {return}
            self?.navigationController?.popViewController(animated: true)
            self?.delegate?.addNewReport(report)
        }).disposed(by: disposeBag)
    }
    func success() {
        
    }
}
