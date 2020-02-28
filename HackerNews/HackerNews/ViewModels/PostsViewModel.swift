//
//  PostsViewModel.swift
//  HackerNews
//
//  Created by Atiyeh, Brian (B.) on 2/26/20.
//  Copyright © 2020 Brian Atiyeh. All rights reserved.
//

import RxSwift
import RxCocoa

public protocol PostsViewable {
    var posts: BehaviorRelay<[Post]> { get }
    var postIds: PostList { get }
    var showBanner: BehaviorRelay<Bool> { get }
    func fetchFirstPosts()
    func fetchAdditionalPosts(start: Int)
}

class PostsViewModel: PostsViewable {
    public var posts = BehaviorRelay<[Post]>(value: [])
    public var postIds: PostList = []
    public var showBanner = BehaviorRelay<Bool>(value: false)
    let postsService: PostsServicable
    let disposeBag = DisposeBag()
    
    init(postsService: PostsServicable) {
        self.postsService = postsService
    }
    
    public convenience init() {
        self.init(postsService: PostsService())
    }
    
    public func fetchFirstPosts() {
        postsService.getPosts()
            .concatMap { [unowned self] posts -> Observable<[Post]> in
                self.postIds = posts
                return self.fetchPostDetails(posts: Array(posts.prefix(20)))
            }
            .subscribe(onNext: { [weak self] (response) in
                self?.posts.accept(response)
            }, onError: { [weak self] (error) in
                self?.showBanner.accept(true)
            }).disposed(by: disposeBag)
    }
    
    public func fetchAdditionalPosts(start: Int) {
        guard start < postIds.count - 10 else { return }
        
        let postsToFetch = Array(postIds[start ..< start + 10])
        fetchPostDetails(posts: postsToFetch).subscribe(onNext: { [weak self] (newPosts) in
            guard let self = self else { return }
            self.posts.accept(self.posts.value + newPosts)
        }, onError: { [weak self] (error) in
            self?.showBanner.accept(true)
        }).disposed(by: disposeBag)
    }
    
    private func fetchPostDetails(posts: [Int]) -> Observable<[Post]> {
        return Observable.from(posts).flatMap { [weak self] id in
            return (self?.postsService.getPostDetails(id: id) ?? Observable.empty())
        }
        .toArray()
        .asObservable()
    }
}
