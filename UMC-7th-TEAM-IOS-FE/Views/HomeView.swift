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
    
    // 뷰 생성 함수
    private func makeView() -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        return view
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
            searchBar
        ].forEach {
            addSubview($0)
        }
        
        [
            logoImageView,
            notificationButton,
            menuButton
        ].forEach {
            navigationBar.addSubview($0)
        }
        
        searchBar.addSubview(searchTextField)
        searchBar.addSubview(searchButton)
        
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
    }
}
