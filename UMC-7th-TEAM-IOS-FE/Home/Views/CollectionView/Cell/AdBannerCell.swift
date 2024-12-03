//
//  AdBannerCell.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 선가연 on 12/2/24.
//

import UIKit

class AdBannerCell: UICollectionViewCell {
    
    static let identifier: String = "AdBannerCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
        constraints()
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var bannerView = UIView().then {
        $0.backgroundColor = .systemGray6
    }
    
    private let bannerImageView = UIImageView().then {
        $0.image = UIImage(named: "home_banner")
        $0.contentMode = .scaleAspectFit
        $0.layer.shadowOpacity = 0.4
        $0.layer.shadowOffset = CGSize(width: 3, height: 4)
        $0.layer.shadowRadius = 4
        $0.layer.masksToBounds = false
    }
    
    private let bannerTitleLabel = UILabel().then {
        $0.text = "사라져가는 존재들의\n살아가는 이야기"
        $0.numberOfLines = 2
        $0.font = UIFont(name: "Pretendard-Bold", size: 20)
    }
    
    private let bannerSubtitleLabel = UILabel().then {
        $0.text = "멸종동물 조형작가\n정의동의 생존일지"
        $0.numberOfLines = 2
        $0.font = UIFont(name: "Pretendard-Regular", size: 15)
    }
    
    private func addComponents() {
        contentView.addSubview(bannerView)
        bannerView.addSubview(bannerImageView)
        bannerView.addSubview(bannerTitleLabel)
        bannerView.addSubview(bannerSubtitleLabel)
    }
    
    private func constraints() {
        bannerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        bannerImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-40)
            $0.bottom.equalToSuperview().offset(-24)
        }
        
        bannerTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(32)
            $0.leading.equalToSuperview().offset(39)
            $0.trailing.lessThanOrEqualTo(bannerImageView.snp.leading).offset(-16)
        }
        
        bannerSubtitleLabel.snp.makeConstraints {
            $0.top.equalTo(bannerTitleLabel.snp.bottom).offset(20)
            $0.leading.equalTo(bannerTitleLabel.snp.leading)
            $0.trailing.lessThanOrEqualTo(bannerImageView.snp.leading).offset(-16)
        }
    }
    
    func configure(model: BannerModel) {
        bannerImageView.image = UIImage(named: model.imageView)
    }
}
