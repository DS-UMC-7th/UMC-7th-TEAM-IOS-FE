//
//  MyPageReviewTableViewCell.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 김미주 on 02/12/2024.
//

import UIKit

class MyPageReviewTableViewCell: UITableViewCell {
    static let identifier = "MyPageReviewTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.bookImage.image = nil
        self.bookInfo.text = nil
        self.starLabel.text = nil
        self.reviewDateLabel.text = nil
        self.reviewLabel.text = nil
    }
    
    // MARK: - layout
    // 이미지
    public var bookImage = UIImageView().then {
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.25
        $0.layer.shadowOffset = CGSize(width: 3, height: 4)
        $0.layer.shadowRadius = 4
    }
    
    // 제목
    public var bookTitle = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Bold", size: 17)
        $0.textColor = .black
    }
    
    // 정보
    public var bookInfo = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Regular", size: 12)
        $0.textColor = UIColor(red: 119/255, green: 119/255, blue: 119/255, alpha: 1)
    }
    
    // 별점
    private let starIcon = UIImageView().then {
        $0.image = .iconStar
    }
    
    public var starLabel = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Regular", size: 12)
        $0.textColor = UIColor(red: 255/255, green: 191/255, blue: 0/255, alpha: 1)
    }
    
    // 리뷰 작성일
    public var reviewDateLabel = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Regular", size: 12)
        $0.textColor = .black
    }
    
    // 리뷰
    public var reviewLabel = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Regular", size: 15)
        $0.textColor = UIColor(red: 69/255, green: 100/255, blue: 140/255, alpha: 1)
        $0.numberOfLines = 3
        $0.textAlignment = .left
        $0.lineBreakMode = .byTruncatingTail
    }
    
    // MARK: - function
    private func setView() {
        [
            bookImage,
            bookTitle, bookInfo,
            starIcon, starLabel, reviewDateLabel,
            reviewLabel
        ].forEach {
            addSubview($0)
        }
        
        bookImage.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().inset(22.5)
            $0.left.equalToSuperview()
            $0.width.equalTo(69)
            $0.height.equalTo(103)
        }
        
        bookTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(21)
            $0.left.equalTo(bookImage.snp.right).offset(16)
            $0.height.equalTo(20)
        }
        
        bookInfo.snp.makeConstraints {
            $0.left.equalTo(bookTitle.snp.right).offset(8)
            $0.bottom.equalTo(bookTitle.snp.bottom)
            $0.height.equalTo(14)
        }
        
        starIcon.snp.makeConstraints {
            $0.top.equalTo(bookTitle.snp.bottom).offset(5)
            $0.left.equalTo(bookTitle.snp.left)
            $0.width.height.equalTo(12)
        }
        
        starLabel.snp.makeConstraints {
            $0.centerY.equalTo(starIcon)
            $0.left.equalTo(starIcon.snp.right).offset(4)
            $0.height.equalTo(14)
        }
        
        reviewDateLabel.snp.makeConstraints {
            $0.centerY.equalTo(starIcon)
            $0.left.equalTo(starLabel.snp.right).offset(8)
            $0.height.equalTo(14)
        }
        
        reviewLabel.snp.makeConstraints {
            $0.top.equalTo(starIcon.snp.bottom).offset(9)
            $0.left.equalTo(starIcon.snp.left)
            $0.right.equalToSuperview()
            $0.width.equalTo(242)
            $0.height.equalTo(60)
        }
    }

}
