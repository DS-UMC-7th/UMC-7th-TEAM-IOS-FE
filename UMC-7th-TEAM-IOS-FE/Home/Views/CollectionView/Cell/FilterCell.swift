//
//  FilterCell.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 선가연 on 12/3/24.
//

import UIKit

class FilterCell: UICollectionViewCell {
    
    static let identifier = "FilterHeaderView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var categoryButton = UIButton().then {
        $0.setTitle("국내 도서", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.setImage(UIImage(named: "home_icon_down"), for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 15)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 16
        $0.layer.borderWidth = 1.5
        $0.layer.borderColor = UIColor(red: 117/255, green: 148/255, blue: 193/255, alpha: 1.0).cgColor
        $0.semanticContentAttribute = .forceRightToLeft
        $0.contentEdgeInsets = UIEdgeInsets(top: 7, left: 0, bottom: 7, right: 0)
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 26, bottom: 0, right: 0)
    }
    
    lazy var genreButton = UIButton().then {
        $0.setTitle("소설", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.setImage(UIImage(named: "home_icon_down"), for: .normal)
        $0.backgroundColor = .white
        $0.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 15)
        $0.layer.cornerRadius = 16
        $0.layer.borderWidth = 1.5
        $0.layer.borderColor = UIColor(red: 117/255, green: 148/255, blue: 193/255, alpha: 1.0).cgColor
        $0.semanticContentAttribute = .forceRightToLeft
        $0.contentEdgeInsets = UIEdgeInsets(top: 7, left: 0, bottom: 7, right: 0)
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 26, bottom: 0, right: 0)
    }
    
    lazy var buttonStackView = UIStackView(arrangedSubviews: [categoryButton, genreButton]).then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.distribution = .fillEqually
        $0.spacing = 14
    }
    
    private func addComponents() {
        self.addSubview(buttonStackView)
    }
    
    private func constraints() {
        buttonStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }
}
