//
//  BaseCellHeader.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 선가연 on 12/2/24.
//

import UIKit
import Then

class BaseCellHeader: UICollectionReusableView, CellHeaderProtocol {
    
    static let identifier: String = "BaseCellHeader"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var headerTitle = UILabel().then {
        $0.font = UIFont(name: "MaruBuri-Bold", size: 22)
        $0.textColor = UIColor.black
    }
    
    lazy var headerHighlight = UIView().then {
        $0.backgroundColor = UIColor(red: 194/255, green: 221/255, blue: 248/255, alpha: 1.0) // #C2DDF8
    }
    
    private func addComponents() {
        [headerHighlight, headerTitle].forEach { self.addSubview($0) }
    }
    
    private func constraints() {
        headerTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.centerX.equalToSuperview()
        }
        
        headerHighlight.snp.makeConstraints {
            $0.leading.equalTo(headerTitle.snp.leading).offset(-5)
            $0.trailing.equalTo(headerTitle.snp.trailing).offset(5)
            $0.top.equalTo(headerTitle.snp.top).offset(12)
            $0.bottom.equalTo(headerTitle.snp.bottom).offset(2)
        }
    }
    
    public func configure(title: String) {
        self.headerTitle.text = title
    }
}
