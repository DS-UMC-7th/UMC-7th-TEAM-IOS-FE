//
//  MyPageBookResponseModel.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 김미주 on 06/12/2024.
//

import Foundation

struct MyPageBookResponseModel: Codable {
    let isSuccess: Bool
    let code: String
    let message: String
    let result: MyPageResult
}

struct MyPageResult: Codable {
    let isLast: Bool
    let totalPage: Int
    let totalElement: Int
    let books: [Book]
}

struct Book: Codable {
    let id: Int
    let imgUrl: String
    let title: String
    let author: String
    let publisher: String
    let rating: Double
    let reviewCount: Int
    let description: String
}
