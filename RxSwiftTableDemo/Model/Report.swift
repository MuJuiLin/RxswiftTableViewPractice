//
//  Report.swift
//  RxSwiftTableDemo
//
//  Created by joseewu on 2018/10/26.
//  Copyright © 2018 com.isunClub. All rights reserved.
//

import Foundation
struct ArrayWrapper<T:Codable>:Codable {
    private enum CodingKeys:String,CodingKey {
        case data
    }
    let data:[T]?
}
extension ArrayWrapper {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try? container.decode(Array<T>.self, forKey: .data)
    }
}
struct Report:Codable {
    let title:String?
    let content:String?
    let userName:String?
    let printScreen:URL?
    private enum CodingKeys:String,CodingKey {
        case title
        case content
        case userName
        case printScreen
    }
    init(title:String?, content:String?,userName:String, printScreen:URL? ) {
        self.title = title
        self.content = content
        self.userName = userName
        self.printScreen = printScreen

    }
}
extension Report {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try? container.decode(String.self, forKey: .title)
        content = try? container.decode(String.self, forKey: .content)
        userName = try? container.decode(String.self, forKey: .userName)
        printScreen = try? container.decode(URL.self, forKey: .printScreen)
    }
}
