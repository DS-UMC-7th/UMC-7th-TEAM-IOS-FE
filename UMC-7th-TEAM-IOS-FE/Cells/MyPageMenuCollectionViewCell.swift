//
//  MyPageMenuCollectionViewCell.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 김미주 on 30/11/2024.
//

import UIKit
import SnapKit
import Then

class MyPageMenuCollectionViewCell: UICollectionViewCell {
    static let identifier = "MyPageMenuCollectionViewCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - layout
    public let menuIcon = UIImageView()
    
    public let menuLabel = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Medium", size: 12)
        $0.textColor = .black
    }
    
    // MARK: - function
    private func setView() {
        [
            menuIcon,
            menuLabel
        ].forEach { addSubview($0) }
        
        menuIcon.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        menuLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }
}
