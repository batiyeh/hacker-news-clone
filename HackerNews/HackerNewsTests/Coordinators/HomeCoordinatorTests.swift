//
//  HomeCoordinatorTests.swift
//  HackerNewsTests
//
//  Created by Atiyeh, Brian (B.) on 2/27/20.
//  Copyright © 2020 Brian Atiyeh. All rights reserved.
//

import Nimble
import SafariServices
import XCTest

@testable import HackerNews

class HomeCoordinatorTests: XCTestCase {
    var subject: HomeCoordinator!
    let mockRouter = MockRouter()
    
    override func setUp() {
        subject = HomeCoordinator(router: mockRouter)
    }
    
    func testStartShowsPostsVC() {
        subject.start()
        expect(self.mockRouter.pushedViewController).to(beAnInstanceOf(PostsViewController.self))
    }
    
    func testShowPostWebview() {
        subject.showPost(url: "http://localhost")
        expect(self.mockRouter.presentedViewController).to(beAnInstanceOf(SFSafariViewController.self))
    }
}
