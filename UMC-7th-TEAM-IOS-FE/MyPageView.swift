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
    private let profileImage = UIImageView().then {
        $0.image = UIImage.imageProfile
    }
    
    private let nameBackground = UIView().then {
        $0.backgroundColor = UIColor(red: 33/255, green: 56/255, blue: 86/255, alpha: 1)
        $0.layer.cornerRadius = 10
    }
    
    private let nameLabel = UILabel().then {
        let partLabel = UILabel()
        partLabel.text = "책책책참새 님"
        
        let attributedString = NSMutableAttributedString(string: partLabel.text ?? "")
        attributedString.addAttribute(.font, value: UIFont(name: "Pretendard-Bold", size: 17) ?? .systemFont(ofSize: 17), range: (partLabel.text! as NSString).range(of: "책책책참새"))
        attributedString.addAttribute(.font, value: UIFont(name: "Pretendard-Bold", size: 15) ?? .systemFont(ofSize: 15), range: (partLabel.text! as NSString).range(of: " 님"))
        
        $0.attributedText = attributedString
        $0.textColor = .white
    }

    
    private let emailLabel = UILabel().then {
        $0.text = "ks18mskd9@naver.com"
        $0.font = UIFont(name: "Pretendard-Medium", size: 15)
        $0.textColor = .black
    }
    
    private let infoStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 4
        $0.alignment = .leading
    }
    
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
        [nameBackground, emailLabel].forEach { infoStackView.addArrangedSubview($0) }
    }
    
    private func setView() {
        [
            infoBackgroundView,
            logoStackView,
            menuStackView,
            profileImage,
            infoStackView,
            nameLabel
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
        
        profileImage.snp.makeConstraints {
            $0.top.equalTo(logoStackView.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(16)
        }
        
        infoStackView.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.top)
            $0.left.equalTo(profileImage.snp.right).offset(12)
        }
        
        nameBackground.snp.makeConstraints {
            $0.width.equalTo(108)
            $0.height.equalTo(32)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(infoStackView.snp.top).offset(5)
            $0.left.equalTo(infoStackView.snp.left).offset(9)
        }
        
        emailLabel.snp.makeConstraints {
            $0.height.equalTo(24)
        }

    }
}
