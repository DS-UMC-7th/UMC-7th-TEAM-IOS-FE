//
//  MyPageReviewResponseModel.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 김미주 on 06/12/2024.
//

import Foundation

struct MyPageReviewResponseModel: Codable {
    let book: ReviewBook
    let review: Review
}

struct ReviewBook: Codable {
    let bookImg: String
    let title: String
    let author: String
    let publisher: String
}

struct Review: Codable {
    let id: Int
    let content: String
    let rating: Int
    let userId: Int
    let bookId: Int
    let tagNames: [String]
    let imageUrls: [String]
    let createdAt: String
}
