//
//  HomeView.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 선가연 on 11/30/24.
//

import UIKit
import SnapKit
import Then

class HomeView: UIView {
    
    // MARK: - 네비게이션
    private lazy var navigationBar = makeView()
    
    // 로고 이미지
    private let logoImageView = UIImageView().then {
        $0.image = UIImage(named: "home_logo")
        $0.contentMode = .scaleAspectFit
    }
    
    // 알림 버튼
    private let notificationButton = UIButton().then {
        $0.setImage(UIImage(systemName: "bell"), for: .normal)
        $0.tintColor = .black
    }
    
    // 메뉴 버튼
    private let menuButton = UIButton().then {
        $0.setImage(UIImage(systemName: "line.3.horizontal"), for: .normal)
        $0.tintColor = .black
    }
    
    // MARK: - 검색
    private lazy var searchBar = makeView().then {
        $0.backgroundColor = UIColor(red: 0.89, green: 0.95, blue: 1.0, alpha: 1.0) // #E3F1FF
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
    }
    
    // 검색 텍스트 필드
    private let searchTextField = UITextField().then {
        $0.placeholder = "책 제목, 작가 이름, 장르 검색"
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        $0.leftViewMode = .always
        $0.font = .systemFont(ofSize: 15)
    }
    
    // 검색 버튼
    private let searchButton = UIButton().then {
        $0.setImage(UIImage(named: "icon_search"), for: .normal)
    }
    
    // MARK: - 배너
    private lazy var bannerView = makeView().then {
        $0.backgroundColor = .systemGray6
    }
    
    private let bannnerBookImageView = UIImageView().then {
        $0.image = UIImage(named: "home_banner")
        $0.contentMode = .scaleAspectFit
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
    
    // MARK: - 오늘의 추천 도서
    private lazy var recommendView = makeView()
    private lazy var recommendTitleLabel = makeTitleLabel("오늘의 추천 도서")
    private lazy var titleHighlightView = makeView().then {
        $0.backgroundColor = UIColor(red: 194/255, green: 221/255, blue: 248/255, alpha: 1.0) // #C2DDF8
    }
    
    // MARK: - 생성 함수
    // 뷰 생성 함수
    private func makeView() -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }
    
    // 제목 레이블 생성 함수
    private func makeTitleLabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.font = UIFont(name: "MaruBuri-Bold", size: 22)
        return label
    }
    
    // MARK: - 설정
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        [
            navigationBar,
            searchBar,
            bannerView,
            recommendView
        ].forEach {
            addSubview($0)
        }
        
        navigationBar.addSubview(logoImageView)
        navigationBar.addSubview(notificationButton)
        navigationBar.addSubview(menuButton)
        
        searchBar.addSubview(searchTextField)
        searchBar.addSubview(searchButton)
        
        bannerView.addSubview(bannerTitleLabel)
        bannerView.addSubview(bannerSubtitleLabel)
        bannerView.addSubview(bannnerBookImageView)
        
        recommendView.addSubview(titleHighlightView)
        recommendView.addSubview(recommendTitleLabel)
        
        
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(64)
        }
        
        logoImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(104)
            $0.height.equalTo(24)
        }
        
        notificationButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(menuButton.snp.leading).offset(-16)
            $0.width.height.equalTo(16)
        }
        
        menuButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-18)
            $0.width.height.equalTo(16)
        }
        
        searchBar.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(36)
        }
        
        searchTextField.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview()
            $0.trailing.equalTo(searchButton.snp.leading).offset(-16)
        }
        
        searchButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-16)
            $0.width.height.equalTo(16)
        }
        
        bannerView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(bannerView.snp.width).multipliedBy(0.5)
        }
        
        bannerTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(32)
            $0.leading.equalToSuperview().offset(39)
        }
        
        bannerSubtitleLabel.snp.makeConstraints {
            $0.top.equalTo(bannerTitleLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(bannerTitleLabel)
        }
        
        bannnerBookImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-40)
            $0.bottom.equalToSuperview().offset(-24)
            $0.width.equalTo(bannnerBookImageView.snp.height).multipliedBy(3.0 / 4.0)
        }
        
        recommendView.snp.makeConstraints {
            $0.top.equalTo(bannerView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(312) // 수정 필요
        }
        
        recommendTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(44)
            $0.centerX.equalToSuperview()
        }
        
        titleHighlightView.snp.makeConstraints {
            $0.leading.equalTo(recommendTitleLabel.snp.leading).offset(-5)
            $0.trailing.equalTo(recommendTitleLabel.snp.trailing).offset(5)
            $0.top.equalTo(recommendTitleLabel.snp.top).offset(12)
            $0.bottom.equalTo(recommendTitleLabel.snp.bottom).offset(2)
        }
    }
}
