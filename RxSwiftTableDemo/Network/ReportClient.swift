//
//  ReportClient.swift
//  RxSwiftTableDemo
//
//  Created by joseewu on 2018/10/26.
//  Copyright © 2018 com.isunClub. All rights reserved.
//

import Foundation
import RxSwift
import RxAlamofire
import Alamofire
protocol EndPointType {
    var baseURL:String {get}
    var authorizedHeader:[String:Any] {get}
}

class ReportClient:EndPointType {
    var authorizedHeader: [String : Any] {
        return ["cookies":""]
    }

    var baseURL: String = "https://s3-ap-northeast-1.amazonaws.com/jstripnote/AllReports.json"


    init() {

    }
    func getAllReports() -> Observable<[Report]> {
        let response = RxAlamofire.request(.get, baseURL).responseData().flatMapLatest { (_, data) -> Observable<[Report]> in
            do {
                let decoder:JSONDecoder = JSONDecoder.init()
                let result = try? decoder.decode(ArrayWrapper<Report>.self, from: data)
                if let pureData = result?.data {
                    return Observable.just(pureData)
                }
                return Observable.empty()
            } catch {
                return Observable.empty()
            }
        }
//        let response = RxAlamofire.request(.get, baseURL, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData().flatMapLatest { (_, data) -> Observable<[Report]> in
//            do {
//                let decoder:JSONDecoder = JSONDecoder.init()
//                let result = try? decoder.decode(ArrayWrapper<Report>.self, from: data)
//                if let pureData = result?.data {
//                    return Observable.just(pureData)
//                }
//                return Observable.empty()
//            } catch {
//                return Observable.empty()
//            }
//        }
        return response
    }
}
