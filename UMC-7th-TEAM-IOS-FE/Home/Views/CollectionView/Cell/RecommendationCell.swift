//
//  RecommendationCell.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 선가연 on 12/2/24.
//

import UIKit
import Kingfisher

class RecommendationCell: UICollectionViewCell {
    
    static let identifier: String = "RecommendationCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
        constraints()
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let bookImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
    }
    
    private let countView = UIView().then {
        $0.backgroundColor = UIColor(red: 33/255, green: 55/255, blue: 86/255, alpha: 1.0)
        $0.layer.cornerRadius = 10
    }
    
    private lazy var countLabel = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Bold", size: 12)
        $0.textColor = .white
    }
    
    private let titleLabel = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Bold", size: 18)
        $0.textColor = .black
        $0.textAlignment = .center
    }
    
    private let descriptionLabel = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Bold", size: 15)
        $0.textColor = UIColor(red: 69/255, green: 100/255, blue: 140/255, alpha: 1.0)
        $0.textAlignment = .center
        $0.numberOfLines = 2
    }
    
    private let authorLabel = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Light", size: 12)
        $0.textColor = .darkGray
        $0.textAlignment = .center
    }
    
    private func addComponents() {
        contentView.addSubview(bookImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(authorLabel)
        contentView.addSubview(countView)
        contentView.addSubview(countLabel)
        
    }
    
    private func constraints() {
        bookImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.height.lessThanOrEqualTo(172)
        }
        
        countView.snp.makeConstraints {
            $0.top.equalTo(bookImageView.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(45)
            $0.height.equalTo(20)
        }
        
        countLabel.snp.makeConstraints {
            $0.centerX.equalTo(countView)
            $0.centerY.equalTo(countView)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(countView.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
        
        authorLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    func configure(with model: BookModel, count: Int) {
        if let url = URL(string: model.imgUrl) {
            bookImageView.kf.setImage(with: url, placeholder: UIImage(named: "home_book_sample"))
        }
        
        countLabel.text = "\(count)/3"
        titleLabel.text = model.title
        authorLabel.text = "\(model.author) | \(model.publisher)"
        descriptionLabel.text = model.description
    }
}
