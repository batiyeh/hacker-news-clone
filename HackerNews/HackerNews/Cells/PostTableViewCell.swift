//
//  PostTableViewCell.swift
//  HackerNews
//
//  Created by Atiyeh, Brian (B.) on 2/26/20.
//  Copyright © 2020 Brian Atiyeh. All rights reserved.
//

import SnapKit
import UIKit

class PostTableViewCell: UITableViewCell {
    private let verticalMargin: CGFloat = 25.0
    private let horizontalMargin: CGFloat = 20.0
    
    lazy var view = UIView()
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 4
        label.textColor = .black
        return label
    }()
    
    lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.numberOfLines = 0
        label.textColor = .gray
        return label
    }()
    
    lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.numberOfLines = 0
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()
    
    lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 5
        return stackView
    }()
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(post: Post) {
        titleLabel.text = post.title
        authorLabel.text = post.by
        scoreLabel.text = String(post.score) + "\n points"
    }
    
    private func layoutView() {
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(authorLabel)
        view.addSubview(scoreLabel)
        view.addSubview(verticalStackView)
        contentView.addSubview(view)
        
        view.snp.remakeConstraints { make in
            make.leading.equalToSuperview().offset(horizontalMargin)
            make.trailing.equalToSuperview().inset(horizontalMargin)
            make.top.equalToSuperview().offset(verticalMargin)
            make.bottom.equalToSuperview().inset(verticalMargin)
        }
        
        titleLabel.snp.remakeConstraints { make in
            make.leading.top.equalToSuperview()
        }
        
        authorLabel.snp.remakeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10.0)
            make.leading.equalToSuperview()
        }
        
        scoreLabel.snp.remakeConstraints { make in
            make.leading.equalToSuperview()
            make.width.equalTo(50)
            make.centerY.equalToSuperview()
        }
        
        verticalStackView.snp.remakeConstraints { make in
            make.leading.equalTo(scoreLabel.snp.trailing).offset(15)
            make.top.bottom.trailing.equalToSuperview()
        }
    }
}
