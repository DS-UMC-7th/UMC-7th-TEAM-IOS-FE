//
//  BookDetailView.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 신연주 on 12/1/24.
//

import UIKit

class BookDetailView: UIView {
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - 책 프로필 이미지 UI
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 400)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(BookDetailCell.self, forCellWithReuseIdentifier: BookDetailCell.identifier)
        return collectionView
    }()
    // MARK: - 책 정보
    // MARK: - 별점 및 리뷰 수 그래프
    // MARK: - 정렬 및 필터 버튼
    
    // MARK: - 
    private func setupView() {
        addSubview(collectionView)

        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
