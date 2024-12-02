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
//
//struct RecommendProductModel: RequiredCellProtocol {
//    var imageView: String
//    var titleText: String
//    var descriptionText: String
//    var authorText: String
//}

final class HomeCellModel {

    static let bannerData: [BannerModel] = [.init(imageView: "home_banner")]
}
