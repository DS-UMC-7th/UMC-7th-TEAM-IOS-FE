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
        self.backgroundColor = .white
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // 남색 배경 영역
    private let blueBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 33/255, green: 56/255, blue: 86/255, alpha: 1)
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
        $0.textAlignment = .center
    }
    
    //소라색 배경 뷰(책 제목 아래)
    private let lightBlueBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 117/255, green: 148/255, blue: 193/255, alpha: 1)
    }
    
    //책 소개 레이블
    private let bookDescriptionLabel = UILabel().then {
        $0.text = " 학살 이후 실종된 가족을 찾기 위한 생존자의 길고 고요한 투쟁의 서사가 있다. 공간적으로는 제주에서 경산에 이르고, 시간적으로는 반세기를 넘긴다. 폭력에 훼손되고 공포에 짓눌려도 인간은 포기하지 않는다. 작별할 수 없다는 것이다."
        $0.font = UIFont(name: "Pretendard", size: 15) ?? UIFont.systemFont(ofSize: 15)
        $0.textColor = .white
        $0.numberOfLines = 0
        $0.textAlignment = .center
     
    }
    
    // 책 정보 배경 뷰
    private let bookInfoBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 242/255, green: 249/255, blue: 255/255, alpha: 1)
        $0.layer.cornerRadius = 12
    }
    
    // 책 정보 타이틀 레이블
    private let bookInfoTitleLabel = UILabel().then {
        $0.text = "작가\n출판사\n발행 일자\n쪽수"
        $0.font = UIFont(name: "Pretendard", size: 15) ?? UIFont.systemFont(ofSize: 15)
        $0.textColor = UIColor(red: 117/255, green: 148/255, blue: 193/255, alpha: 1)
        $0.numberOfLines = 0
        $0.textAlignment = .left
    }
    
    // 책 정보 내용 레이블
    private let bookInfoContentLabel = UILabel().then {
        $0.text = "한강\n문학동네\n2021년 09월 09일\n332쪽"
        $0.font = UIFont(name: "Pretendard", size: 15) ?? UIFont.systemFont(ofSize: 15)
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.textAlignment = .left
        $0.lineBreakMode = .byCharWrapping
        $0.numberOfLines = 0
    }
    
    // 컴포넌트 추가
    private func setupSubviews() {
        self.addSubview(blueBackgroundView)
        blueBackgroundView.addSubview(profileImageView)
        blueBackgroundView.addSubview(lightBlueBackgroundView)
        blueBackgroundView.addSubview(bookTitleLabel)
        blueBackgroundView.addSubview(bookDescriptionLabel)
        
        self.addSubview(bookInfoBackgroundView)
        bookInfoBackgroundView.addSubview(bookInfoTitleLabel)
        bookInfoBackgroundView.addSubview(bookInfoContentLabel)
    }
    
   //레이아웃 설정
    private func setupConstraints() {
        //프로필 이미지 UI 구성
        blueBackgroundView.snp.makeConstraints {
            $0.width.equalTo(360)
            $0.height.equalTo(380)
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(49)
        }
        
        profileImageView.snp.makeConstraints {
            $0.width.equalTo(84)
            $0.height.equalTo(124)
            $0.top.equalTo(blueBackgroundView).offset(75)
            $0.left.equalTo(blueBackgroundView).offset(138)
        }
        
        bookTitleLabel.snp.makeConstraints {
            $0.width.equalTo(121)
            $0.height.equalTo(24)
            $0.top.equalTo(profileImageView.snp.bottom).offset(16)
            $0.left.equalTo(blueBackgroundView).offset(120)
            $0.centerX.equalTo(lightBlueBackgroundView)
        }
        
                lightBlueBackgroundView.snp.makeConstraints {
            $0.width.equalTo(132)
            $0.height.equalTo(14.61)
            $0.top.equalTo(bookTitleLabel.snp.bottom).offset(-13)
            $0.centerX.equalTo(blueBackgroundView)
        }
        
        bookDescriptionLabel.snp.makeConstraints {
            $0.width.equalTo(320)
            $0.height.equalTo(90)
            $0.top.equalTo(bookTitleLabel.snp.bottom).offset(19)
            $0.left.equalTo(blueBackgroundView).offset(20)
            $0.centerX.equalTo(blueBackgroundView)
        }
        
        //책 정보 레이아웃 구성
        bookInfoBackgroundView.snp.makeConstraints {
            $0.width.equalTo(320)
            $0.height.equalTo(112)
            $0.top.equalToSuperview().offset(396)
            $0.left.equalToSuperview().offset(20)
            $0.centerX.equalTo(blueBackgroundView)
        }
        
        bookInfoTitleLabel.snp.makeConstraints {
            $0.width.equalTo(56)
            $0.height.equalTo(88)
            $0.top.equalTo(bookInfoBackgroundView).offset(12)
            $0.left.equalTo(bookInfoBackgroundView).offset(12)
        }
        
        bookInfoContentLabel.snp.makeConstraints {
            $0.width.equalTo(130)
            $0.height.equalTo(88)
            $0.top.equalTo(bookInfoBackgroundView).offset(12)
            $0.left.equalTo(bookInfoTitleLabel.snp.right).offset(20)
        }
    }
}
