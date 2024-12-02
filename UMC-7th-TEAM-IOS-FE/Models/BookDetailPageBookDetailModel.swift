//
//  BookDetailPageBookDetailModel.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 신연주 on 12/1/24.
//

import UIKit

struct BookDetailModel {
    let title: String
    let description: String
    let coverImage: UIImage
    let author: String
    let publisher: String
    let publishDate: String
    let pages: Int
    let rating: Double
    let totalReviews: Int
    let ratingDistribution: [Int]
}

extension BookDetailModel {
    static func dummy() -> BookDetailModel {
        return BookDetailModel(
            title: "작별하지 않는다",
            description: "학살 이후 실종된 가족을 찾기 위한 생존자의 길고 고요한 투쟁의 서사가 있다. 공간적으로는 제주에서 경산에 이르고, 시간적으로는 반세기를 넘긴다. 폭력에 훼손되고 공포에 짓눌려도 인간은 포기하지 않는다. 작별할 수 없다는 것이다.",
            coverImage: UIImage(named: "book_image.png") ?? UIImage(),
            author: "한강",
            publisher: "문학동네",
            publishDate: "2021년 09월 09일",
            pages: 332,
            rating: 4.8,
            totalReviews: 1231,
            ratingDistribution: [54, 32, 12, 4, 9]
        )
    }
}
