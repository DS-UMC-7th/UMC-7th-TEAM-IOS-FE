//
//  MyPageMenuModel.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 김미주 on 30/11/2024.
//

import Foundation
import UIKit

struct MyPageMenuModel {
    let menuIcon: UIImage
    let menuLabel: String
}

extension MyPageMenuModel {
    static func dummy() -> [MyPageMenuModel] {
        return [
            MyPageMenuModel(menuIcon: .iconSave, menuLabel: "임시저장"),
            MyPageMenuModel(menuIcon: .iconCoupon, menuLabel: "적립금 쿠폰"),
            MyPageMenuModel(menuIcon: .iconSetting, menuLabel: "환경설정"),
        ]
    }
}
