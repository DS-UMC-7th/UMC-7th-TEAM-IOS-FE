//
//  BookDetailView.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 신연주 on 11/29/24.
//

import UIKit
import SnapKit
import Then

class BookDetailView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 33/255, green: 56/255, blue: 86/255, alpha: 1)
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //책 표지 이미지
    private let profileImageView = UIImageView().then {
        $0.image = UIImage(named: "book_image.png")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.25
        $0.layer.shadowOffset = CGSize(width: 3, height: 4)
        $0.layer.shadowRadius = 4
    }
    
    //책 제목 레이블
    private let bookTitleLabel = UILabel().then {
        $0.text = "작별하지 않는다"
        $0.font = UIFont(name: "MaruBuriOTF-Bold", size: 17) ?? UIFont.systemFont(ofSize: 17)
        $0.textColor = .white
        $0.backgroundColor = UIColor(red: 117/255, green: 148/255, blue: 193/255, alpha: 1)
    }
    
    //책 소개 레이블
    private let bookDescriptionLabel = UILabel().then {
        $0.text = "학살 이후 실종된 가족을 찾기 위한 생존자의 길고 고요한 투쟁의 서사가 있다. 공간적으로는 제주에서 경산에 이르고, 시간적으로는 반세기를 넘긴다. 폭력에 훼손되고 공포에 짓눌려도 인간은 포기하지 않는다. 작별할 수 없다는 것이다."
        $0.font = UIFont(name: "Pretendard", size: 15) ?? UIFont.systemFont(ofSize: 15)
        $0.textColor = .white
        $0.numberOfLines = 0
     
    }
    
    //컴포넌트 추가
    private func setupSubviews() {
        self.addSubview(profileImageView)
        self.addSubview(bookTitleLabel)
        self.addSubview(bookDescriptionLabel)
    }

   //레이아웃 설정
    private func setupConstraints() {
        profileImageView.snp.makeConstraints {
            $0.width.equalTo(84)
            $0.height.equalTo(124)
            $0.top.equalToSuperview().offset(75)
            $0.left.equalToSuperview().offset(138)
        }
        
        bookTitleLabel.snp.makeConstraints {
            $0.width.equalTo(132)
            $0.height.equalTo(14.61)
            $0.top.equalToSuperview().offset(227)
            $0.left.equalToSuperview().offset(114)
        }
        
        bookDescriptionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(258)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(320)
            $0.height.equalTo(90)
        }
    }
}
