//
//  PostsViewControllerTests.swift
//  HackerNewsTests
//
//  Created by Atiyeh, Brian (B.) on 2/27/20.
//  Copyright © 2020 Brian Atiyeh. All rights reserved.
//

import Nimble
import XCTest

@testable import HackerNews

class PostsViewControllerTests: XCTestCase {
    var subject: PostsViewController!
    var mockPostsViewModel = MockPostsViewModel()
    
    override func setUp() {
        subject = PostsViewController(postsViewModel: mockPostsViewModel)
    }

    func testShouldFetchPostsOnLoad() {
        subject.viewDidLoad()
        expect(self.mockPostsViewModel.fetchFirstPostsCalled).to(beTruthy())
    }
    
    func testShouldUpdatePostsOnFetch() {
        subject.viewDidLoad()
        expect(self.subject.postsDataManager.posts.count).toEventually(equal(1))
    }
    
    func testShouldShowErrorBannerOnError() {
        subject.viewDidLoad()
        mockPostsViewModel.showBanner.accept(true)
        expect(self.subject.view.subviews[2]).toEventually(beAnInstanceOf(Banner.self))
    }
}
