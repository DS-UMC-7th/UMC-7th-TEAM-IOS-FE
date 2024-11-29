//
//  MyPageView.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 김미주 on 30/11/2024.
//

import UIKit
import SnapKit
import Then

class MyPageView: UIView {
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        makeStackView()
        setView()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - layout
    // MARK: - 사용자 정보
    // 배경
    private let infoBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 242/255, green: 249/255, blue: 255/255, alpha: 1)
    }
    
    // 상단 바
    private let logoImage = UIImageView().then {
        $0.image = UIImage.logo
    }
    
    private let logoTitle = UIImageView().then {
        $0.image = UIImage.logoText
    }
    
    private let logoStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 8
        $0.alignment = .center
    }
    
    private let alertButton = UIButton().then {
        $0.setImage(UIImage.iconAlert, for: .normal)
    }
    
    private let menuButton = UIButton().then {
        $0.setImage(UIImage.iconMenu, for: .normal)
    }
    
    private let menuStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 16
        $0.alignment = .center
    }
    
    // 프로필
    
    // 메뉴
    
    
    // MARK: - 내가 쓴 리뷰
    // 타이틀
    
    // 필터링
    
    // 테이블뷰
    
    // 더보기
    
    
    // MARK: - 이 책은 어땠나요?
    // 타이틀
    
    // 슬라이드
    
    // 리뷰 작성
    
    
    // MARK: - function
    private func makeStackView() {
        [logoImage, logoTitle].forEach { logoStackView.addArrangedSubview($0) }
        [alertButton, menuButton].forEach { menuStackView.addArrangedSubview($0) }
    }
    
    private func setView() {
        [
            infoBackgroundView,
            logoStackView,
            menuStackView,
        ].forEach {
            addSubview($0)
        }
        
        infoBackgroundView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(268)
        }
        
        logoStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(9)
            $0.left.equalToSuperview().offset(16)
        }
        
        menuStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(13)
            $0.right.equalToSuperview().offset(-16)
        }

    }
}
