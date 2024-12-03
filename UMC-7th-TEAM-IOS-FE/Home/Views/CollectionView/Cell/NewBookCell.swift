//
//  NewBookCell.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 선가연 on 12/3/24.
//

import UIKit

class NewBookCell: UICollectionViewCell {
    
    static let identifier: String = "NewBookCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
        constraints()
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let bookImageView = UIImageView().then {
        $0.image = UIImage(named: "home_book_sample")
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.layer.shadowOpacity = 0.3
        $0.layer.shadowOffset = CGSize(width: 3, height: 4)
        $0.layer.shadowRadius = 4
        $0.layer.masksToBounds = false
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "작별하지 않는다"
        $0.font = UIFont(name: "Pretendard-Bold", size: 17)
        $0.textColor = .black
        $0.numberOfLines = 1
    }
    
    private let descriptionLabel = UILabel().then {
        $0.text = "작가의 성숙한 의식과 단정하고 묵직하면서도 정갈한 문체로 쓰인 작품이다. 현실의 대비와 비교에 의한 의식이 돋"
        $0.font = UIFont(name: "Pretendard-Regular", size: 15)
        $0.textColor = UIColor(red: 69/255, green: 100/255, blue: 140/255, alpha: 1.0)
        $0.numberOfLines = 3
    }
    
    private let authorLabel = UILabel().then {
        $0.text = "한강 · 문학동네"
        $0.font = UIFont(name: "Pretendard-Light", size: 12)
        $0.textColor = .darkGray
        $0.numberOfLines = 1
    }
    
    private let countLabel = UILabel().then {
        $0.text = "1"
        $0.font = UIFont(name: "MaruBuri-Bold", size: 20)
        $0.textColor = .black
    }
    
    private let ratingImageView = UIImageView().then {
        $0.image = UIImage(named: "home_icon_star")
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
    }
    
    private let ratingLabel = UILabel().then {
        $0.text = "1"
        $0.font = UIFont(name: "Pretendard-Light", size: 12)
        $0.textColor = UIColor(red: 255/255, green: 191/255, blue: 0/255, alpha: 1.0)
    }
    
    private let reviewCountImageView = UIImageView().then {
        $0.image = UIImage(named: "home_icon_pen")
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
    }
    
    private let reviewCountLabel = UILabel().then {
        $0.text = "4.9/5.0"
        $0.font = UIFont(name: "Pretendard-Light", size: 12)
        $0.textColor = UIColor(red: 69/255, green: 100/255, blue: 140/255, alpha: 1.0)
    }
    
    private let separator = itemSeparatorCell()
    
    private func addComponents() {
        contentView.addSubview(countLabel)
        contentView.addSubview(bookImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(authorLabel)
        contentView.addSubview(ratingImageView)
        contentView.addSubview(ratingLabel)
        contentView.addSubview(reviewCountImageView)
        contentView.addSubview(reviewCountLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(separator)
    }
    
    private func constraints() {
        countLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        bookImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.height.equalTo(124)
            $0.width.equalTo(bookImageView.snp.height).multipliedBy(3.0 / 4.0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(bookImageView.snp.trailing).offset(20)
            $0.trailing.equalToSuperview()
        }
        
        authorLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.trailing.equalToSuperview()
        }
        
        ratingImageView.snp.makeConstraints {
            $0.centerY.equalTo(ratingLabel)
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.width.height.equalTo(12)
        }
        
        ratingLabel.snp.makeConstraints {
            $0.top.equalTo(authorLabel.snp.bottom).offset(4)
            $0.leading.equalTo(ratingImageView.snp.trailing).offset(4)
        }
        
        reviewCountImageView.snp.makeConstraints {
            $0.centerY.equalTo(reviewCountLabel)
            $0.leading.equalTo(ratingLabel.snp.trailing).offset(16)
            $0.width.height.equalTo(12)
        }
        
        reviewCountLabel.snp.makeConstraints {
            $0.top.equalTo(authorLabel.snp.bottom).offset(4)
            $0.leading.equalTo(reviewCountImageView.snp.trailing).offset(4)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(ratingImageView.snp.bottom).offset(12)
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(bookImageView.snp.bottom)
        }
        
        separator.snp.makeConstraints {
            $0.top.equalTo(bookImageView.snp.bottom).offset(26)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    func configure(with model: BookModel, count: Int) {
        countLabel.text = "\(count)"
        
        if let url = URL(string: model.imgUrl) {
            bookImageView.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"))
        }
        
        titleLabel.text = model.title
        authorLabel.text = "\(model.author) · \(model.publisher)"
        descriptionLabel.text = model.description
        reviewCountLabel.text = "\(model.reviewCount)"
        ratingLabel.text = model.rating != nil ? "\(model.rating!)/5.0" : "0/5.0"
    }
}
