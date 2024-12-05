//
//  itemSeparatorCell.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 선가연 on 12/4/24.
//

import UIKit

class itemSeparatorCell: UICollectionReusableView {
    
    static let identifier: String = "itemSeparatorCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(separator)
        
        separator.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let separator = UIView().then {
        $0.backgroundColor = UIColor(red: 227/255, green: 241/255, blue: 255/255, alpha: 1.0)
    }
    
}
