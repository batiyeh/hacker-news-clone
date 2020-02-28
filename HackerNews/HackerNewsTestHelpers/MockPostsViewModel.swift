//
//  MockPostsViewModel.swift
//  HackerNewsTests
//
//  Created by Atiyeh, Brian (B.) on 2/27/20.
//  Copyright © 2020 Brian Atiyeh. All rights reserved.
//

import Foundation
import HackerNews
import RxCocoa
import RxSwift

public class MockPostsViewModel: PostsViewable {
    let post = Post(by: "", id: 1, score: 1, title: "", url: "")
    public var postIds: PostList = []
    public var fetchFirstPostsCalled = false
    public var fetchAdditionalPostsCalled = false
    
    public init() { }
    
    public var posts = BehaviorRelay<[Post]>(value: [])
    
    public var showBanner = BehaviorRelay<Bool>(value: false)
    
    public func fetchFirstPosts() {
        fetchFirstPostsCalled = true
        posts.accept([post])
    }
    
    public func fetchAdditionalPosts(start: Int) {
        fetchAdditionalPostsCalled = true
    }
}
