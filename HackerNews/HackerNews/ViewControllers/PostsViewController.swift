//
//  PostsViewController.swift
//  HackerNews
//
//  Created by Atiyeh, Brian (B.) on 2/26/20.
//  Copyright © 2020 Brian Atiyeh. All rights reserved.
//

import RxSwift
import SnapKit
import UIKit

class PostsViewController: UIViewController {
    public weak var delegate: HomeCoordinatorDelegate?
    let postsViewModel: PostsViewable
    let postsDataManager: PostsTableViewDataManager
    let postsView = PostsView()
    private let disposeBag = DisposeBag()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    init(postsViewModel: PostsViewable) {
        self.postsViewModel = postsViewModel
        self.postsDataManager = PostsTableViewDataManager(postsViewModel: postsViewModel)
        super.init(nibName: nil, bundle: nil)
        self.postsDataManager.delegate = self
    }
    
    public convenience init() {
        self.init(postsViewModel: PostsViewModel())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        postsObservable()
        postsDataManager.setup(tableView: postsView.tableView)
        postsViewModel.fetchFirstPosts()
    }
    
    private func postsObservable() {
        postsViewModel.posts
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] posts in
                self?.postsDataManager.setPosts(posts: posts)
        }).disposed(by: disposeBag)
        
        postsViewModel.showBanner
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] (showBanner) in
                if showBanner {
                    self?.showErrorBanner(errorMessage: "Error fetching posts from Hacker News")
                }
        }).disposed(by: disposeBag)
    }
    
    private func setupNavigationBar() {
        title = "Hacker News"
        navigationController?.styleNavigationBarTitle()
    }
    
    private func setupView() {
        setupNavigationBar()
        view.backgroundColor = .white
        
        view.addSubview(postsView)
        postsView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension PostsViewController: PostsTableViewDelegate {
    func postTapped(url: String) {
        delegate?.showPost(url: url)
    }
}
