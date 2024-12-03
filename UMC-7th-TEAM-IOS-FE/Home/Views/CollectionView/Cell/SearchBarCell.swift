//
//  SearchBarCell.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 선가연 on 12/2/24.
//

import UIKit

class SearchBarCell: UICollectionViewCell {
    
    static let identifier: String = "SearchBarCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
        constraints()
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 검색 바
    lazy var searchBar = UIView().then {
        $0.backgroundColor = UIColor(red: 0.89, green: 0.95, blue: 1.0, alpha: 1.0) // #E3F1FF
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
    }
    
    // 검색 텍스트 필드
    lazy var searchTextField = UITextField().then {
        $0.placeholder = "책 제목, 작가 이름, 장르 검색"
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        $0.leftViewMode = .always
        $0.font = .systemFont(ofSize: 15)
    }
    
    // 검색 버튼
    lazy var searchButton = UIButton().then {
        $0.setImage(UIImage(named: "home_icon_search"), for: .normal)
    }
    
    private func addComponents() {
        contentView.addSubview(searchBar)
        searchBar.addSubview(searchTextField)
        searchBar.addSubview(searchButton)
    }
    
    private func constraints() {
        searchBar.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        searchTextField.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview()
            $0.trailing.equalTo(searchButton.snp.leading).offset(-16)
        }
        
        searchButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-16)
            $0.width.height.equalTo(20)
        }
    }
}
