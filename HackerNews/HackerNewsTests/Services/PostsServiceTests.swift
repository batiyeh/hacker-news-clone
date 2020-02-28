//
//  PostsServiceTests.swift
//  HackerNewsTests
//
//  Created by Atiyeh, Brian (B.) on 2/27/20.
//  Copyright © 2020 Brian Atiyeh. All rights reserved.
//

import Nimble
import XCTest

@testable import HackerNews

class PostsServiceTests: XCTestCase {
    var subject: PostsService!
    let mockNetworking = MockNetworking()
    
    override func setUp() {
        subject = PostsService(networking: mockNetworking)
    }
    
    func testGetPosts() {
        _ = subject.getPosts()
        expect(self.mockNetworking.requestedUrl).to(equal("https://hacker-news.firebaseio.com/v0/topstories.json"))
    }
    
    func testGetPostDetails() {
        _ = subject.getPostDetails(id: 1)
        expect(self.mockNetworking.requestedUrl).to(equal("https://hacker-news.firebaseio.com/v0/item/1.json"))
    }
    
    func testGetPostsSuccess() {
        /* Ideally I would write a network stubbing response class where I could pass in a
         success / error response type w/ JSON and return it when a certain URL is called.
         I would then use this class to test both a success / error response.
         Unfortunately I ran out of time at this point. */
    }
}
