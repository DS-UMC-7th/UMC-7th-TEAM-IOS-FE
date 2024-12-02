//
//  BookDetailPageView.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 신연주 on 12/1/24.
//

import UIKit

class BookDetailView: UIView {
    let bookDetailCell = BookDetailCell()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 
    /*let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 400)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(BookDetailCell.self, forCellWithReuseIdentifier: BookDetailCell.identifier)
        return collectionView
    }()
     collectionView.snp.makeConstraints {
         $0.edges.equalToSuperview()
     }
     */
    //스크롤뷰
    let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = true
    }
    
    private let contentView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private func setupView() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(bookDetailCell)
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        bookDetailCell.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-20)
        }
    }
    
}
