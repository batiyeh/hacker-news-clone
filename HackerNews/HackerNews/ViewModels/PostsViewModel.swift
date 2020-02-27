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
    var showBanner: BehaviorRelay<Bool> { get }
    func fetchPosts()
}

class PostsViewModel: PostsViewable {
    public var posts = BehaviorRelay<[Post]>(value: [])
    public var showBanner = BehaviorRelay<Bool>(value: false)
    let postsService: PostsServicable
    let disposeBag = DisposeBag()
    
    init(postsService: PostsServicable) {
        self.postsService = postsService
    }
    
    public convenience init() {
        self.init(postsService: PostsService())
    }
    
    public func fetchPosts() {
        postsService.getPosts()
            .flatMap { posts in
                return self.fetchPostDetails(posts: Array(posts.prefix(25)))
            }
            .subscribe(onNext: { [weak self] (response) in
                self?.posts.accept(response)
            }, onError: { [weak self] (error) in
                self?.showBanner.accept(true)
            }).disposed(by: disposeBag)
    }
    
    private func fetchPostDetails(posts: [Int]) -> Observable<[Post]> {
        return Observable.from(posts).flatMap { id in
            return self.postsService.getPostDetails(id: id)
        }
        .toArray()
        .asObservable()
    }
    
    private func setPosts(postList: [Post]) {
        posts.accept(postList)
    }
}
