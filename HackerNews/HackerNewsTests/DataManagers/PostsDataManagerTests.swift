//
//  PostsDataManagerTests.swift
//  HackerNewsTests
//
//  Created by Brian Atiyeh on 2/27/20.
//  Copyright © 2020 Brian Atiyeh. All rights reserved.
//

import Nimble
import XCTest

@testable import HackerNews

class PostsDataManagerTests: XCTestCase {
    var subject: PostsTableViewDataManager!
    let mockPostsViewModel = MockPostsViewModel()

    override func setUp() {
        subject = PostsTableViewDataManager(postsViewModel: mockPostsViewModel)
    }
    
    func testShouldFetchMoreRowsOnScroll() {
        let post = Post(by: "", id: 1, score: 1, title: "", url: "")
        subject.posts = [post, post, post, post]
        subject.tableView(UITableView(), willDisplay: UITableViewCell(), forRowAt: IndexPath(row: 1, section: 1))
        expect(self.mockPostsViewModel.fetchAdditionalPostsCalled).to(beTruthy())
    }
}
