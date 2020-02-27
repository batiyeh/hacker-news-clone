//
//  PostsView.swift
//  HackerNews
//
//  Created by Atiyeh, Brian (B.) on 2/26/20.
//  Copyright © 2020 Brian Atiyeh. All rights reserved.
//

import Foundation
import SnapKit
import UIKit

public class PostsView: UIView {
    public var tableView = UITableView()
    private let horizontalMargin: CGFloat = 20.0
    
    public init() {
        super.init(frame: CGRect.zero)
        setupViews()
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        setupTableView()
    }
    
    private func setupTableView() {
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        tableView.rowHeight = UITableView.automaticDimension
    }
}
