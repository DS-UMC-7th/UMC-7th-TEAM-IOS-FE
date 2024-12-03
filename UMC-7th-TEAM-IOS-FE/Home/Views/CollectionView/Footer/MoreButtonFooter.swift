//
//  MoreButtonFooter.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 선가연 on 12/3/24.
//

import UIKit

class MoreButtonFooter: UICollectionReusableView {
    
    static let identifier = "MoreButtonFooter"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var moreButton = UIButton().then {
        $0.setTitle("더보기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 15)
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 24
    }
    
    private func addComponents() {
        self.addSubview(moreButton)
    }
    
    private func constraints() {
        moreButton.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
    }
    
}
