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
    let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = true
    }
    
    private let contentView = UIView().then {
        $0.backgroundColor = .white
    }
    
    let filterButton = UIButton().then {
        $0.setTitle("별점 높은 순", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        $0.setImage(UIImage(systemName: "chevron.down")?.withTintColor(UIColor(red: 117/255, green: 148/255, blue: 193/255, alpha: 1), renderingMode: .alwaysOriginal), for: .normal)
        $0.semanticContentAttribute = .forceRightToLeft
    }
    
    let reviewTableView = UITableView().then {
        $0.register(BookDetailPageReviewViewCell.self, forCellReuseIdentifier: BookDetailPageReviewViewCell.identifier)
        $0.separatorStyle = .none
        $0.isScrollEnabled = false
    }
    
    let showMoreButton = UIButton().then {
        $0.setTitle("전체 보기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        $0.backgroundColor = UIColor(red: 33/255, green: 55/255, blue: 86/255, alpha: 1)
        $0.layer.cornerRadius = 24
        $0.clipsToBounds = true
        $0.contentEdgeInsets = UIEdgeInsets(top: 19, left: 133, bottom: 19, right: 133)
    }
    
    // MARK: -
    private func setupView() {
        addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }

        contentView.addSubview(bookDetailCell)
        contentView.addSubview(filterButton)
        contentView.addSubview(reviewTableView)
        contentView.addSubview(showMoreButton)

        bookDetailCell.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.height.equalTo(640)
        }
        
        filterButton.snp.makeConstraints {
            $0.top.equalTo(bookDetailCell.snp.bottom).offset(20)
            $0.right.equalToSuperview().offset(-16)
            $0.width.equalTo(96)
            $0.height.equalTo(20)
        }
        
        reviewTableView.snp.makeConstraints {
            $0.top.equalTo(filterButton.snp.bottom).offset(20)
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(600)
        }
        
        showMoreButton.snp.makeConstraints {
            $0.top.equalTo(reviewTableView.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-20)
        }
    }
}

