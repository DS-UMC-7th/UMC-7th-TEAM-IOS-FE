//
//  MyPageReviewModel.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 김미주 on 02/12/2024.
//

import Foundation
import UIKit

struct MyPageReviewModel {
    let bookImage: UIImage
    let bookTitle: String
    let bookInfo: String
    let starLabel: String
    let dateLabel: String
    let reviewLabel: String
}

extension MyPageReviewModel {
    static func dummy() -> [MyPageReviewModel] {
        return [
            MyPageReviewModel(bookImage: .imageBook1, bookTitle: "작별하지 않는다", bookInfo: "한강 · 문학동네", starLabel: "5", dateLabel: "24.08.12.", reviewLabel: "작가의 성숙한 의식과 단정하고 묵직하면서도 정갈한 문체로 쓰인 작품이다. 현실의 대비와 비교에 의한 의식이 돋보이는 작품"),
            MyPageReviewModel(bookImage: .imageBook2, bookTitle: "왜왜왜 동아리", bookInfo: "진형민 · 창비", starLabel: "5", dateLabel: "24.11.23.", reviewLabel: "기후 위기 시대에 어린이들이 던지는 유쾌한 한 방! 오늘만 사는 어른들을 대신해 내일도 살아야 하는 어린이들이 보내는 한 마디"),
            MyPageReviewModel(bookImage: .imageBook3, bookTitle: "영원한 천국", bookInfo: "정유정 · 은행나무", starLabel: "5", dateLabel: "24.11.03.", reviewLabel: "정유정 작가 신작이 나온다는 소식을 듣고 바로 예약 구매했어요. 처음 받는 순간 1판 1쇄라고 찍힌 걸 보고 너무 감동했습니다. 역시"),
            MyPageReviewModel(bookImage: .imageBook1, bookTitle: "작별하지 않는다", bookInfo: "한강 · 문학동네", starLabel: "5", dateLabel: "24.08.12.", reviewLabel: "작가의 성숙한 의식과 단정하고 묵직하면서도 정갈한 문체로 쓰인 작품이다. 현실의 대비와 비교에 의한 의식이 돋보이는 작품"),
            MyPageReviewModel(bookImage: .imageBook2, bookTitle: "왜왜왜 동아리", bookInfo: "진형민 · 창비", starLabel: "5", dateLabel: "24.11.23.", reviewLabel: "기후 위기 시대에 어린이들이 던지는 유쾌한 한 방! 오늘만 사는 어른들을 대신해 내일도 살아야 하는 어린이들이 보내는 한 마디"),
            MyPageReviewModel(bookImage: .imageBook3, bookTitle: "영원한 천국", bookInfo: "정유정 · 은행나무", starLabel: "5", dateLabel: "24.11.03.", reviewLabel: "정유정 작가 신작이 나온다는 소식을 듣고 바로 예약 구매했어요. 처음 받는 순간 1판 1쇄라고 찍힌 걸 보고 너무 감동했습니다. 역시"),
            MyPageReviewModel(bookImage: .imageBook1, bookTitle: "작별하지 않는다", bookInfo: "한강 · 문학동네", starLabel: "5", dateLabel: "24.08.12.", reviewLabel: "작가의 성숙한 의식과 단정하고 묵직하면서도 정갈한 문체로 쓰인 작품이다. 현실의 대비와 비교에 의한 의식이 돋보이는 작품"),
            MyPageReviewModel(bookImage: .imageBook2, bookTitle: "왜왜왜 동아리", bookInfo: "진형민 · 창비", starLabel: "5", dateLabel: "24.11.23.", reviewLabel: "기후 위기 시대에 어린이들이 던지는 유쾌한 한 방! 오늘만 사는 어른들을 대신해 내일도 살아야 하는 어린이들이 보내는 한 마디"),
            MyPageReviewModel(bookImage: .imageBook3, bookTitle: "영원한 천국", bookInfo: "정유정 · 은행나무", starLabel: "5", dateLabel: "24.11.03.", reviewLabel: "정유정 작가 신작이 나온다는 소식을 듣고 바로 예약 구매했어요. 처음 받는 순간 1판 1쇄라고 찍힌 걸 보고 너무 감동했습니다. 역시"),
        ]
    }
}
