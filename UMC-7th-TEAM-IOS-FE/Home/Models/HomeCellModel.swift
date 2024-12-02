//
//  HomeCellModel.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 선가연 on 12/2/24.
//

import Foundation

struct BannerModel: RequiredCellProtocol {
    var imageView: String
}

struct BookResponse: Codable {
    let isSuccess: Bool
    let code: String
    let message: String
    let result: BookResult
}

struct BookResult: Codable {
    let isLast: Bool
    let totalPage: Int
    let totalElement: Int
    let books: [BookModel]
}

struct BookModel: Codable {
    let id: Int
    let imgUrl: String
    let title: String
    let author: String
    let publisher: String
    let rating: Double
    let reviewCount: Int
    let description: String
}

final class HomeCellModel {
    static let bannerData: [BannerModel] = [
        BannerModel(imageView: "home_banner")
    ]
}
