//
//  PostsViewModelTests.swift
//  HackerNewsTests
//
//  Created by Atiyeh, Brian (B.) on 2/27/20.
//  Copyright © 2020 Brian Atiyeh. All rights reserved.
//

import Nimble
import XCTest

@testable import HackerNews

class PostsViewModelTests: XCTestCase {
    var subject: PostsViewModel!
    let mockPostsService = MockPostsService()
    
    override func setUp() {
        subject = PostsViewModel(postsService: mockPostsService)
    }
    
    func testShouldCallGetFirstPosts() {
        subject.fetchFirstPosts()
        expect(self.mockPostsService.getPostsCalled).to(beTruthy())
    }
    
    func testShouldCallGetAdditionalPostsWithMoreToGet() {
        subject.postIds = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
        subject.fetchAdditionalPosts(start: 3)
        expect(self.mockPostsService.getPostDetailsCalled).to(beTruthy())
    }
    
    func testShouldNotCallGetAdditionalPostsWithNoMoreToGet() {
        subject.fetchAdditionalPosts(start: 20)
        expect(self.mockPostsService.getPostDetailsCalled).to(beFalsy())
    }
}
