//
//  TIItemTableViewCell.swift
//  RxSwiftTableDemo
//
//  Created by Josee Wu on 2018/10/23.
//  Copyright © 2018 com.isunClub. All rights reserved.
//

import UIKit

class TIItemTableViewCell: UITableViewCell {

    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        renderUI()
    }
    private func renderUI() {

    }
    func bind(with viewModle:Report) {
        content.text = viewModle.content
        title.text = viewModle.title
    }
    
}
