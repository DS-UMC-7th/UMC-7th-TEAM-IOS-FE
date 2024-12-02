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
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addComponents()
        constraints()
        print("Subviews added: \(subviews)")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Property
    public lazy var homeCollectionView: UICollectionView = {
        let layout = HomeCollectionLayout.createCompositionalLayout()
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        
        /* 셀 등록 */
        collectionView.register(SearchBarCell.self, forCellWithReuseIdentifier: SearchBarCell.identifier)
        collectionView.register(AdBannerCell.self, forCellWithReuseIdentifier: AdBannerCell.identifier)
        
        /* 헤더 등록 */
//        collectionView.register(BaseCellHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: BaseCellHeader.identifier)

        return collectionView
    }()
    
    // 상단 헤더 뷰
    public lazy var homeHeaderView: HomeHeaderView = HomeHeaderView()
    
    // MARK: - Constaints & Add Function
    private func addComponents() {
        [homeHeaderView, homeCollectionView].forEach{ self.addSubview($0) }
    }
    
    private func constraints() {
        homeHeaderView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(64)
        }
        
        homeCollectionView.snp.makeConstraints {
            $0.top.equalTo(homeHeaderView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
