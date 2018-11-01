//
//  TIViewController.swift
//  RxSwiftTableDemo
//
//  Created by Josee Wu on 2018/10/23.
//  Copyright © 2018 com.isunClub. All rights reserved.
//
// https://medium.com/blablacar-tech/rxswift-mvvm-66827b8b3f10

import UIKit
import RxSwift
import RxCocoa

class TIViewController: UIViewController {
    let viewModel = TIHomeViewModel()
    let disposeBag = DisposeBag()

    @IBOutlet weak var floatyButton: TLFloatButton! {
        didSet {
            floatyButton.bgColor = UIColor.black
            floatyButton.iconImg = UIImage(named: "plus_icon")?.withRenderingMode(.alwaysTemplate)
            floatyButton.tintColor = UIColor.white
        }
    }
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: "TIItemTableViewCell", bundle: nil), forCellReuseIdentifier: "TIItemTableViewCell")
        }
    }
    @IBAction func addNewReport(_ sender: Any) {
        pushToReportViewController(withSelectedReport: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tideisun report system"
        bindViewModel()
        viewModel.inputs.viewDidLoad()
    }

    func bindViewModel() {
        viewModel.outputs.totalReports.asDriver().drive(onNext: { [weak self] _ in
            self?.tableView.reloadData()
        }).disposed(by: disposeBag)
    }

    func pushToReportViewController(withSelectedReport selectedReport: Report?) {
        let reportVC = TIReportViewController(nibName:"TIReportViewController", bundle:nil)
        reportVC.delegate = self
        reportVC.originReport = selectedReport
        navigationController?.pushViewController(reportVC, animated: true)
    }
}

extension TIViewController: TIReportViewControllerDelegate {
    func addNewReport(_ report: Report) {
        viewModel.inputs.updateTotalReports(report, atIndex: tableView.indexPathForSelectedRow?.row)
    }
}

extension TIViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.outputs.totalReports.value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TIItemTableViewCell", for: indexPath) as? TIItemTableViewCell
        let data = viewModel.outputs.totalReports.value[indexPath.row]
        cell?.content.text = data.content
        cell?.title.text = data.userName
        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pushToReportViewController(withSelectedReport: viewModel.outputs.totalReports.value[indexPath.row])
    }
}
