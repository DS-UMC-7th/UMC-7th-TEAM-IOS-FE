//
//  BookDetailPageReviewViewCell.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 신연주 on 12/3/24.
//
import UIKit

class BookDetailPageReviewViewCell: UITableViewCell {
    static let identifier = "BookDetailPageReviewViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - layout
    private let reviewerImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
    }
    
    private let reviewerNameLabel = UILabel().then {
        $0.font = UIFont.boldSystemFont(ofSize: 15)
        $0.textColor = .black
    }
    
    private let reviewDateLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textColor = .gray
    }
    
    private let reviewTextLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
    }
    
    private let tagStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 8
        $0.alignment = .leading
        $0.distribution = .fill
    }
    
    private let ratingStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 4
        $0.alignment = .center
    }
    
    private let separatorView = UIView().then {
        $0.backgroundColor = UIColor(red: 227/255, green: 241/255, blue: 255/255, alpha: 1)
    }
    
    // MARK: - function
    private func setupView() {
        contentView.addSubview(reviewerImageView)
        contentView.addSubview(reviewerNameLabel)
        contentView.addSubview(ratingStackView)
        contentView.addSubview(reviewDateLabel)
        contentView.addSubview(reviewTextLabel)
        contentView.addSubview(tagStackView)
        contentView.addSubview(separatorView)
        
        reviewerImageView.snp.makeConstraints {
            $0.top.left.equalToSuperview().inset(16)
            $0.width.height.equalTo(40)
        }
        
        reviewerNameLabel.snp.makeConstraints {
            $0.top.equalTo(reviewerImageView)
            $0.left.equalTo(reviewerImageView.snp.right).offset(12)
        }
        
        ratingStackView.snp.makeConstraints {
            $0.centerY.equalTo(reviewerNameLabel)
            $0.left.equalTo(reviewerNameLabel.snp.right).offset(8)
        }
        
        reviewDateLabel.snp.makeConstraints {
            $0.top.equalTo(reviewerNameLabel.snp.bottom).offset(4)
            $0.left.equalTo(reviewerNameLabel)
        }
        
        reviewTextLabel.snp.makeConstraints {
            $0.top.equalTo(reviewDateLabel.snp.bottom).offset(12)
            $0.left.right.equalToSuperview().inset(16)
        }
        
        tagStackView.snp.makeConstraints {
            $0.top.equalTo(reviewTextLabel.snp.bottom).offset(12)
            $0.left.right.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().offset(-16)
        }
        
        separatorView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-16)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    // MARK: - Configure Cell
    func configure(with model: BookDetailPageReviewModel) {
        reviewerImageView.image = model.reviewerImage
        reviewerNameLabel.text = model.reviewerName
        reviewDateLabel.text = model.reviewDate
        reviewTextLabel.text = model.reviewText
        
        ratingStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        for i in 0..<5 {
            let starImage = UIImageView()
            if i < Int(model.rating) {
                starImage.image = UIImage(systemName: "star.fill")
                starImage.tintColor = UIColor(red: 255/255, green: 191/255, blue: 0, alpha: 1)
                starImage.layer.cornerRadius = 0.5
            } else {
                starImage.image = UIImage(systemName: "star")
                starImage.tintColor = UIColor(red: 255/255, green: 191/255, blue: 0, alpha: 1)
                starImage.layer.cornerRadius = 0.5
            }
            ratingStackView.addArrangedSubview(starImage)
        }
        
        tagStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        model.tags.forEach { tag in
            let tagLabel = UILabel().then {
                $0.text = tag
                $0.font = UIFont.systemFont(ofSize: 12)
                $0.textColor = .white
                $0.textAlignment = .center
                $0.backgroundColor = UIColor(red: 117/255, green: 148/255, blue: 193/255, alpha: 1)
                $0.layer.cornerRadius = 12
                $0.clipsToBounds = true
            }
            
            let tagWidth = tag.size(withAttributes: [.font: UIFont.systemFont(ofSize: 12)]).width + 90
            tagLabel.snp.makeConstraints {
                $0.height.equalTo(24)
                $0.width.equalTo(tagWidth)
            }
            tagStackView.addArrangedSubview(tagLabel)
        }
    }
}
