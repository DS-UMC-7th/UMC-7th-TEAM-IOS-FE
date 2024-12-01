//
//  BookDetailCell.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 신연주 on 12/1/24.
//

import UIKit
import SnapKit
import Then

class BookDetailCell: UICollectionViewCell {
    static let identifier = "BookDetailCell"
    
    let topBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 33/255, green: 56/255, blue: 86/255, alpha: 1)
    }
    
    private let coverImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.25
        $0.layer.shadowOffset = CGSize(width: 3, height: 4)
        $0.layer.shadowRadius = 4
    }

    private let titleLabel = UILabel().then {
        $0.font = UIFont(name: "MaruBuriOTF-Bold", size: 17)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private let subtitleBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 117/255, green: 148/255, blue: 193/255, alpha: 1)
    }

    private let descriptionLabel = UILabel().then {
        $0.font = UIFont(name: "Pretendard", size: 15)
        $0.textColor = .white
        $0.numberOfLines = 0
        $0.lineBreakMode = .byCharWrapping
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        [topBackgroundView, coverImageView, subtitleBackgroundView,titleLabel, descriptionLabel, ].forEach { contentView.addSubview($0) }
        
        topBackgroundView.snp.makeConstraints {
            $0.width.equalTo(360)
            $0.height.equalTo(380)
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            


        }
        
        coverImageView.snp.makeConstraints {
            $0.width.equalTo(84)
            $0.height.equalTo(124)
            $0.top.equalTo(topBackgroundView.snp.top).offset(75)
            $0.left.equalTo(topBackgroundView.snp.left).offset(138)
        }
        
        subtitleBackgroundView.snp.makeConstraints {
            $0.left.equalTo(titleLabel.snp.left).offset(-5.5)
            $0.right.equalTo(titleLabel.snp.right).offset(5.5)
            $0.top.equalTo(titleLabel.snp.bottom).offset(-12)
            $0.height.equalTo(14.61)
            $0.centerX.equalTo(topBackgroundView)
        }
        
        titleLabel.snp.makeConstraints {
            $0.width.equalTo(121)
            $0.height.equalTo(24)
            $0.top.equalTo(coverImageView.snp.bottom).offset(16)
            $0.left.equalTo(topBackgroundView).offset(120)
            $0.centerX.equalTo(topBackgroundView)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.width.equalTo(320)
            $0.height.equalTo(90)
            $0.top.equalTo(titleLabel.snp.bottom).offset(19)
            $0.centerX.equalTo(topBackgroundView)
        }
    }

    func configure(with model: BookDetailModel) {
        titleLabel.text = model.title
        descriptionLabel.text = model.description
        coverImageView.image = model.coverImage
    }
}
