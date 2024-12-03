//
//  MyPageBookModel.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 김미주 on 03/12/2024.
//

import Foundation
import UIKit

struct MyPageBookModel {
    let bookImage: UIImage
}

extension MyPageBookModel {
    static func dummy() -> [MyPageBookModel] {
        return [
            MyPageBookModel(bookImage: .imageBook1),
            MyPageBookModel(bookImage: .imageBook2),
            MyPageBookModel(bookImage: .imageBook3),
            MyPageBookModel(bookImage: .imageBook4),
            MyPageBookModel(bookImage: .imageBook5),
            MyPageBookModel(bookImage: .imageBook6),
        ]
    }
}
