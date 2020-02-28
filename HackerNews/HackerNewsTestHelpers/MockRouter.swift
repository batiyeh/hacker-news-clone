//
//  MockRouter.swift
//  HackerNewsTests
//
//  Created by Atiyeh, Brian (B.) on 2/27/20.
//  Copyright © 2020 Brian Atiyeh. All rights reserved.
//

import Foundation
import HackerNews
import UIKit

public class MockRouter: Routable {
    public var rootViewController: UIViewController? = nil
    public var topViewController: UIViewController? = nil
    
    public var presentedViewController: UIViewController? = nil
    public var pushedViewController: UIViewController? = nil
    
    public func present(viewController: UIViewController, animated: Bool) {
        presentedViewController = viewController
    }
    
    public func push(viewController: UIViewController, animated: Bool) {
        pushedViewController = viewController
    }
}
