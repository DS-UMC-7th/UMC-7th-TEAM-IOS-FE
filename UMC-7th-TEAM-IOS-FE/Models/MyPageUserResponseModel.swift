//
//  MyPageUserResponseModel.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 김미주 on 06/12/2024.
//

import Foundation

struct MyPageUserResponseModel: Codable {
    let profilePicture: String?
    let topReviews: [TopReview]
    let userName: String
    let userId: Int
    let email: String
}

struct TopReview: Codable {
    let id: Int
    let content: String
    let rating: Int
    let userId: Int
    let bookId: Int
    let tagNames: [String]
    let imageUrls: [String]
}
