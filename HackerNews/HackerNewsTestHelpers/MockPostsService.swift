//
//  MockPostsService.swift
//  HackerNewsTests
//
//  Created by Atiyeh, Brian (B.) on 2/27/20.
//  Copyright © 2020 Brian Atiyeh. All rights reserved.
//

import Foundation
import HackerNews
import RxSwift

class MockPostsService: PostsServicable {
    private let postListResponse: PostList = []
    private let post = Post(by: "", id: 1, score: 1, title: "", url: "")
    public var getPostsCalled = false
    public var getPostDetailsCalled = false
    
    public init() { }
    
    func getPosts() -> Observable<PostList> {
        getPostsCalled = true
        return Observable.just(postListResponse)
    }
    
    func getPostDetails(id: Int) -> Observable<Post> {
        getPostDetailsCalled = true
        return Observable.just(post)
    }
}
