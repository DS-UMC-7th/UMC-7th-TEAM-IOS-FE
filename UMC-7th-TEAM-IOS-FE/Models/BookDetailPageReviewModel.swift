//
//  BookDetailPageReviewModel.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 신연주 on 12/2/24.
//

import UIKit

struct BookDetailPageReviewModel{
    let reviewerImage: UIImage
    let reviewerName: String
    let reviewDate: String
    let reviewText: String
    let tags: [String]
    let rating: Int
}

extension BookDetailPageReviewModel {
    static func dummy() -> [BookDetailPageReviewModel] {
        return [
            BookDetailPageReviewModel(
                            reviewerImage: UIImage(named: "profile1") ?? UIImage(),
                            reviewerName: "책책책참새",
                            reviewDate: "24.11.03",
                            reviewText: "책을 덮으면서 지극한 사랑에 대한 소설이라는 작가의 말에 고개를 끄덕였다. 그 말처럼 곳곳에서 연약하고 소중한 생명들에 대한 사랑, 그러한 생명들의 서로를 향한 사랑이 느껴지는 책",
                            tags: ["캐릭터 서사", "감동", "역사"],
                            rating: 4
                        ),
                        BookDetailPageReviewModel(
                            reviewerImage: UIImage(named: "profile2") ?? UIImage(),
                            reviewerName: "슈퍼파워",
                            reviewDate: "24.11.01",
                            reviewText: "어처구니 없고 잔혹한 역사의 소용돌이에 휘말려 참혹하게 학살당한 무고한 피해자와 피해자의 자손들의 트라우마를 매우 섬세한 터치로 상기시킨다. 진혼되지 않는 영혼들에 대한 작가의 무한한 연민이 느껴진다.",
                            tags: ["문제", "탄탄한 스토리", "여운"],
                            rating: 3
                        ),
                        BookDetailPageReviewModel(
                            reviewerImage: UIImage(named: "profile3") ?? UIImage(),
                            reviewerName: "김보람",
                            reviewDate: "24.10.31",
                            reviewText: "작가의 성숙한 의식과 단정하고 묵직하면서도 정갈한 문체로 쓰인 작품이다. '소년이 온다'를 쓴 이후의 사색이랄까.... 여튼 꿈과 현실의 대비와 비교에 의한 의식탐구의 노력이 소설속에서 빛나는 것 같다.",
                            tags: ["독창성", "감동", "흡입력"],
                            rating: 4
                        )
        ]
    }
}
