//
//  MyPageBookCollectionViewCell.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 김미주 on 03/12/2024.
//

import UIKit

class MyPageBookCollectionViewCell: UICollectionViewCell {
    static let identifier = "MyPageBookCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - layout
    public let bookImage = UIImageView().then {
        $0.contentMode = .scaleToFill
        $0.clipsToBounds = true
    }
    
    public let bookShadowView = UIView().then {
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.3
        $0.layer.shadowOffset = CGSize(width: 3, height: 3)
        $0.layer.shadowRadius = 6
        $0.backgroundColor = .white
    }
    
    // MARK: - function
    private func setView() {
        [
            bookShadowView,
            bookImage
        ].forEach { addSubview($0) }
        
        bookShadowView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        bookImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
}
