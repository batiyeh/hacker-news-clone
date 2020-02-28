//
//  HackerNewsUITests.swift
//  HackerNewsUITests
//
//  Created by Atiyeh, Brian (B.) on 2/27/20.
//  Copyright © 2020 Brian Atiyeh. All rights reserved.
//

import XCTest

class HackerNewsUITests: XCTestCase {
    override func setUp() {
        continueAfterFailure = false
        App.shared.launch()
    }

    func testHomeScreenLoad() {
        waitForExistence(HomeScreen.navigationBar)
        XCTAssertTrue(HomeScreen.navigationBar.exists)
    }
}
