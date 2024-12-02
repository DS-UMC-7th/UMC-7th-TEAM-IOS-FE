//
//  BookDetailPageBookDetailCell.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 신연주 on 12/1/24.
//

import UIKit
import SnapKit
import Then

class BookDetailCell: UICollectionViewCell {
    static let identifier = "BookDetailCell"
    
    var onSortButtonTapped: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupSortMenu()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - layout
    // MARK: - 책 프로필 이미지
    let topBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 33/255, green: 56/255, blue: 86/255, alpha: 1)
    }
    
    private let backIconView = UIImageView().then {
        $0.image = UIImage(systemName: "chevron.left")
        $0.tintColor = .white
        $0.contentMode = .scaleAspectFit
    }
    
    private let coverImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.25
        $0.layer.shadowOffset = CGSize(width: 3, height: 4)
        $0.layer.shadowRadius = 4
    }
    
    private let titleLabel = UILabel().then {
        $0.font = UIFont(name: "MaruBuriOTF-Bold", size: 17)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private let subtitleBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 117/255, green: 148/255, blue: 193/255, alpha: 1)
    }
    
    private let descriptionLabel = UILabel().then {
        $0.font = UIFont(name: "Pretendard", size: 15)
        $0.textColor = .white
        $0.numberOfLines = 0
        $0.lineBreakMode = .byCharWrapping
    }
    // MARK: - 책 정보 박스
    private let bookInfoBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 242/255, green: 249/255, blue: 255/255, alpha: 1)
        $0.layer.cornerRadius = 12
    }
    
    private let bookInfoTitleLabel = UILabel().then {
        $0.text = "작가\n출판사\n발행 일자\n쪽수"
        $0.font = UIFont(name: "Pretendard", size: 15)
        $0.textColor = UIColor(red: 117/255, green: 148/255, blue: 193/255, alpha: 1)
        $0.numberOfLines = 0
        $0.textAlignment = .left
    }
    
    private let bookInfoContentLabel = UILabel().then {
        $0.font = UIFont(name: "Pretendard", size: 15)
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.textAlignment = .left
        $0.lineBreakMode = .byCharWrapping
    }
    // MARK: - 별점 및 리뷰 수 그래프
    private let ratingContainerView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    private let averageRatingLabel = UILabel().then {
        $0.font = UIFont.boldSystemFont(ofSize: 40)
        $0.textColor = UIColor(red: 117/255, green: 148/255, blue: 193/255, alpha: 1)
        $0.textAlignment = .center
    }
    
    private let starStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = 4
    }
    
    private let totalReviewsLabel = UILabel().then {
        $0.textAlignment = .left
    }
    
    private lazy var ratingGraphStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    // MARK: - 정렬 및 필터 버튼
    private let sortButton = UIButton().then {
        $0.setTitle("별점 높은 순 ", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        $0.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        $0.tintColor = UIColor(red: 117/255, green: 148/255, blue: 193/255, alpha: 1)
        $0.semanticContentAttribute = .forceRightToLeft
    }
    
    private let sortMenuView = UIView().then {
        $0.backgroundColor = UIColor.white
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 4
        $0.isHidden = true
    }
    
    private let sortOptions = ["별점 높은 순", "최신순", "공감 많은 순"]
    private var sortOptionButtons: [UIButton] = []
    // MARK: - function
    func setupView() {
        [topBackgroundView, backIconView, coverImageView, subtitleBackgroundView,titleLabel, descriptionLabel,bookInfoBackgroundView,bookInfoTitleLabel,bookInfoContentLabel, ratingContainerView, averageRatingLabel,starStackView, totalReviewsLabel, ratingGraphStackView].forEach { contentView.addSubview($0) }
        
        topBackgroundView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalTo(360)
            $0.height.equalTo(380)
            $0.centerX.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
        }
        
        backIconView.snp.makeConstraints {
            $0.width.equalTo(8)
            $0.height.equalTo(16)
            $0.top.equalTo(topBackgroundView.snp.top).offset(56)
            $0.left.equalTo(topBackgroundView.snp.left).offset(16)
        }
        
        coverImageView.snp.makeConstraints {
            $0.width.equalTo(84)
            $0.height.equalTo(124)
            $0.top.equalTo(topBackgroundView.snp.top).offset(75)
            $0.left.equalTo(topBackgroundView.snp.left).offset(138)
            $0.centerX.equalToSuperview()
        }
        
        subtitleBackgroundView.snp.makeConstraints {
            $0.left.equalTo(titleLabel.snp.left).offset(-5.5)
            $0.right.equalTo(titleLabel.snp.right).offset(5.5)
            $0.top.equalTo(titleLabel.snp.bottom).offset(-12)
            $0.height.equalTo(14.61)
            $0.centerX.equalTo(topBackgroundView)
        }
        
        titleLabel.snp.makeConstraints {
            $0.width.equalTo(121)
            $0.height.equalTo(24)
            $0.top.equalTo(coverImageView.snp.bottom).offset(16)
            $0.left.equalTo(topBackgroundView).offset(120)
            $0.centerX.equalTo(topBackgroundView)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.width.equalTo(320)
            $0.height.equalTo(90)
            $0.top.equalTo(titleLabel.snp.bottom).offset(19)
            $0.centerX.equalTo(topBackgroundView)
        }
        
        //
        bookInfoBackgroundView.snp.makeConstraints {
            $0.width.equalTo(320)
            $0.height.equalTo(112)
            $0.top.equalTo(topBackgroundView.snp.bottom).offset(16)
            $0.left.equalToSuperview().offset(20)
            $0.centerX.equalToSuperview()
        }
        
        bookInfoTitleLabel.snp.makeConstraints {
            $0.width.equalTo(56)
            $0.height.equalTo(88)
            $0.top.equalTo(bookInfoBackgroundView).offset(12)
            $0.left.equalTo(bookInfoBackgroundView.snp.left).offset(23)
        }
        
        bookInfoContentLabel.snp.makeConstraints {
            $0.width.equalTo(130)
            $0.height.equalTo(88)
            $0.top.equalTo(bookInfoBackgroundView).offset(12)
            $0.left.equalTo(bookInfoTitleLabel.snp.right).offset(20)
        }
        
        //
        ratingContainerView.snp.makeConstraints {
            $0.width.equalTo(320)
            $0.height.equalTo(112)
            $0.top.equalTo(bookInfoBackgroundView.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(20)
            $0.centerX.equalToSuperview()
            
        }
        
        averageRatingLabel.snp.makeConstraints {
            $0.top.equalTo(ratingContainerView)
            $0.left.equalTo(ratingContainerView).offset(25)
            
        }
        
        starStackView.snp.makeConstraints {
            //$0.centerY.equalTo(averageRatingLabel)
            $0.top.equalTo(averageRatingLabel.snp.bottom).offset(4)
            $0.left.equalTo(ratingContainerView)
        }
        
        totalReviewsLabel.snp.makeConstraints {
            $0.top.equalTo(starStackView.snp.bottom).offset(8)
            $0.left.equalTo(ratingContainerView).offset(8)
        }
        
        ratingGraphStackView.snp.makeConstraints {
            $0.centerY.equalTo(ratingContainerView)
            $0.left.equalTo(starStackView.snp.right).offset(10)
        }
    }
    
    func configure(with model: BookDetailModel) {
        titleLabel.text = model.title
        descriptionLabel.text = model.description
        coverImageView.image = model.coverImage
        bookInfoContentLabel.text = "\(model.author)\n\(model.publisher)\n\(model.publishDate)\n\(model.pages)쪽"
        averageRatingLabel.text = String(format: "%.1f", model.rating)
        configureStarIcons(for: model.rating)
        setTotalReviewsLabel(totalReviews: model.totalReviews)
        configureRatingGraph(with: model.ratingDistribution.reversed())
        
    }
    
    func setTotalReviewsLabel(totalReviews: Int) {
        let totalReviewsText = "\(totalReviews) 개의 리뷰"
        let attributedString = NSMutableAttributedString(string: totalReviewsText)
        
        attributedString.addAttribute(
            .foregroundColor,
            value: UIColor(red: 117/255, green: 148/255, blue: 193/255, alpha: 1),
            range: (totalReviewsText as NSString).range(of: "\(totalReviews)")
        )
        attributedString.addAttribute(
            .foregroundColor,
            value: UIColor.black,
            range: (totalReviewsText as NSString).range(of: " 개의 리뷰")
        )
        totalReviewsLabel.attributedText = attributedString
    }
    
    func configureStarIcons(for rating: Double) {
        starStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        let filledStars = Int(rating)
        let emptyStars = 5 - filledStars
        
        for _ in 0..<filledStars {
            let star = UIImageView(image: UIImage(systemName: "star.fill"))
            star.tintColor = UIColor(red: 255/255, green: 215/255, blue: 0/255, alpha: 1) // 황금색
            starStackView.addArrangedSubview(star)
        }
        
        for _ in (filledStars)..<5 {
            let emptyStar = UIImageView(image: UIImage(systemName: "star"))
            emptyStar.tintColor = UIColor(red: 255/255, green: 215/255, blue: 0/255, alpha: 1)
            emptyStar.backgroundColor = .clear
            starStackView.addArrangedSubview(emptyStar)
        }
    }
    
    func configureRatingGraph(with distribution: [Int]) {
        ratingGraphStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for (index, percentage) in distribution.enumerated().reversed() {
            let starImageView = UIImageView(image: UIImage(systemName: "star.fill"))
            starImageView.tintColor = UIColor(red: 255/255, green: 215/255, blue: 0/255, alpha: 1)
            starImageView.contentMode = .scaleAspectFit
            starImageView.snp.makeConstraints {
                $0.width.height.equalTo(16)
            }
            
            let starLabel = UILabel()
            starLabel.text = "\(index + 1)"
            starLabel.font = .systemFont(ofSize: 12)
            starLabel.textColor = .black
            
            let barView = UIView()
            barView.backgroundColor = UIColor(red: 117/255, green: 148/255, blue: 193/255, alpha: 1)
            barView.layer.cornerRadius = 4
        
            
            let percentageLabel = UILabel()
            percentageLabel.text = "\(percentage)%"
            percentageLabel.font = .systemFont(ofSize: 12)
            percentageLabel.textColor = .black
            
            let container = UIView()
            [starImageView, starLabel, barView, percentageLabel].forEach { container.addSubview($0) }
            
            starImageView.snp.makeConstraints {
                $0.left.centerY.equalToSuperview()
                //$0.top.centerY.equalToSuperview()
            }
        
            starLabel.snp.makeConstraints {
                $0.top.equalTo(starImageView)
                $0.left.equalTo(starImageView.snp.right).offset(5)

                
            }
            barView.snp.makeConstraints {
                $0.left.equalTo(starLabel.snp.right).offset(4)
                $0.centerY.equalToSuperview()
                $0.width.equalTo(percentage * 3)
                $0.height.equalTo(8)
            }
            percentageLabel.snp.makeConstraints {
                $0.left.equalTo(barView.snp.right).offset(8)
                $0.centerY.equalToSuperview()
            }
            ratingGraphStackView.addArrangedSubview(container)
        }
    }
    private func setupSortMenu() {
        contentView.addSubview(sortButton)
        contentView.addSubview(sortMenuView)
        
        sortButton.snp.makeConstraints {
            $0.width.equalTo(96)
            $0.height.equalTo(20)
            $0.top.equalTo(ratingContainerView.snp.bottom).offset(28)
            $0.right.equalToSuperview().offset(-20)
        }
        
        sortOptions.forEach { option in
            let button = UIButton().then {
                $0.setTitle(option, for: .normal)
                $0.setTitleColor(.black, for: .normal)
                $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
                $0.contentHorizontalAlignment = .left
                $0.backgroundColor = .white
                $0.addTarget(self, action: #selector(handleSortOptionTapped(_:)), for: .touchUpInside)
            }
            sortMenuView.addSubview(button)
            sortOptionButtons.append(button)
        }
        
        for (index, button) in sortOptionButtons.enumerated() {
            button.snp.makeConstraints {
                $0.left.right.equalToSuperview().inset(8)
                $0.height.equalTo(20)
                $0.top.equalToSuperview().offset(index * 25)
            }
        }
        
        sortMenuView.snp.makeConstraints {
            $0.width.equalTo(sortButton)
            $0.top.equalTo(sortButton.snp.bottom).offset(8)
            $0.right.equalTo(sortButton)
            $0.height.equalTo(sortOptions.count * 25)
        }
    }
    
    // MARK: - Sort Menu Actions
    
    @objc private func toggleSortMenu() {
        UIView.animate(withDuration: 0.3, animations: {
            self.sortMenuView.isHidden = !self.sortMenuView.isHidden
            let newHeight = self.sortMenuView.isHidden ? 0 : self.sortOptions.count * 40
            self.sortMenuView.snp.updateConstraints {
                $0.height.equalTo(newHeight)
            }
            self.layoutIfNeeded()
        })
    }
    
    @objc private func handleSortOptionTapped(_ sender: UIButton) {
        guard let title = sender.title(for: .normal) else { return }
        sortButton.setTitle(title, for: .normal)
        toggleSortMenu()
    }
}
