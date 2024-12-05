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
    let bookTitle: String
    let bookInfo: String
}

extension MyPageBookModel {
    static func dummy() -> [MyPageBookModel] {
        return [
            MyPageBookModel(bookImage: .imageBook1, bookTitle: "작별하지 않는다", bookInfo: "한강 저"),
            MyPageBookModel(bookImage: .imageBook2, bookTitle: "왜왜왜 동아리", bookInfo: "진형민 저"),
            MyPageBookModel(bookImage: .imageBook3, bookTitle: "영원한 천국", bookInfo: "정유정 저"),
            MyPageBookModel(bookImage: .imageBook4, bookTitle: "원더풀 랜드", bookInfo: "더글라스 케네디 저/조동섭 역"),
            MyPageBookModel(bookImage: .imageBook5, bookTitle: "다시 쓰는 수학의 역사", bookInfo: "케이트 기타가와, 티모시 레벨 저/이충호 역"),
            MyPageBookModel(bookImage: .imageBook6, bookTitle: "노란 집", bookInfo: "가와카미 미에코 저 / 홍은주 역"),
        ]
    }
}
