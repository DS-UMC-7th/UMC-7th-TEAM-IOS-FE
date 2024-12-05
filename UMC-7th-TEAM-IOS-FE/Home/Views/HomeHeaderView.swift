//
//  HomeHeaderView.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 선가연 on 12/2/24.
//

import UIKit
import Then

class HomeHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        addComponents()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 로고 이미지
    private let logoImageView = UIImageView().then {
        $0.image = UIImage(named: "home_logo")
        $0.contentMode = .scaleAspectFit
    }
    
    // 알림 버튼
    private let notificationButton = UIButton().then {
        $0.setImage(UIImage(named: "home_icon_bell"), for: .normal)
    }
    
    // 메뉴 버튼
    private let menuButton = UIButton().then {
        $0.setImage(UIImage(named: "home_icon_menu"), for: .normal)
    }
    
    // 컴포넌트 생성
    private func addComponents() {
        [logoImageView, notificationButton, menuButton].forEach { self.addSubview($0) }
    }
    
    // 제약조건 설정
    private func constraints() {
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(104)
            $0.height.equalTo(24)
            $0.bottom.equalToSuperview()
        }
        
        notificationButton.snp.makeConstraints {
            $0.centerY.equalTo(logoImageView.snp.centerY)
            $0.trailing.equalTo(menuButton.snp.leading).offset(-16)
            $0.width.height.equalTo(20)
        }
        
        menuButton.snp.makeConstraints {
            $0.centerY.equalTo(logoImageView.snp.centerY)
            $0.trailing.equalToSuperview().offset(-18)
            $0.width.height.equalTo(20)
        }
    }
}
