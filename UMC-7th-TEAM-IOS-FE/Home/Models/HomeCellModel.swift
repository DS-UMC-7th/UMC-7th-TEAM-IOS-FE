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
    
    // 인기 도서 더미 데이터
    static let bestSellerData: [BookModel] = [
        BookModel(id: 1, imgUrl: "https://shopping-phinf.pstatic.net/main_3244161/32441616160.20220518182757.jpg?type=w300", title: "작별하지 않는다", author: "한강", publisher: "문학동네", rating: 4.9, reviewCount: 2, description: "작가의 성숙한 의식과 단정하고 묵직하면서도 정갈한 문체로 쓰인 작품이다. 현실의 대비와 비교에 의한 의식이 돋"),
        BookModel(id: 2, imgUrl: "https://shopping-phinf.pstatic.net/main_3244161/32441616160.20220518182757.jpg?type=w300", title: "작별하지 않는다", author: "한강", publisher: "문학동네", rating: 4.3, reviewCount: 5, description: "작가의 성숙한 의식과 단정하고 묵직하면서도 정갈한 문체로 쓰인 작품이다. 현실의 대비와 비교에 의한 의식이 돋"),
        BookModel(id: 3, imgUrl: "https://shopping-phinf.pstatic.net/main_3244161/32441616160.20220518182757.jpg?type=w300", title: "작별하지 않는다", author: "한강", publisher: "문학동네", rating: 4.1, reviewCount: 3, description: "작가의 성숙한 의식과 단정하고 묵직하면서도 정갈한 문체로 쓰인 작품이다. 현실의 대비와 비교에 의한 의식이 돋"),
    ]
}
