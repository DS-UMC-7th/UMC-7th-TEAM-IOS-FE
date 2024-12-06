//
//  MyPageTargetType.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 김미주 on 06/12/2024.
//

import Foundation
import Moya

enum MyPageTargetType {
    case getUserInfo(userId: String)
    case getBookList(sortedBy: String, page: Int, size: Int)
    case getReview(userId: String)
}

extension MyPageTargetType: TargetType {
    var baseURL: URL {
        guard let baseURL = URL(string: "http://ec2-3-39-137-120.ap-northeast-2.compute.amazonaws.com:8080") else {
            fatalError("Error: Invalid URL")
        }
        
        return baseURL
    }
    
    var path: String {
        switch self {
        case .getUserInfo:
            return "/auth/mypage"
        case .getReview:
            return "/auth/reviews"
        case .getBookList:
            return "/books"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getUserInfo:
            return .get
        case .getReview:
            return .get
        case .getBookList:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getUserInfo(let userId):
            return .requestParameters(parameters: ["userId": userId], encoding: URLEncoding.queryString)
        case .getReview(let userId):
            return .requestParameters(parameters: ["userId": userId], encoding: URLEncoding.queryString)
        case .getBookList(let sortedBy, let page, let size):
            return .requestParameters(parameters: ["sortedBy": sortedBy, "page": page, "size": size], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getUserInfo:
            return ["Content-Type" : "application/json"]
        case .getReview:
            return ["Content-Type" : "application/json"]
        case .getBookList:
            return ["Content-Type" : "application/json"]
        }
    }
    
    
}
