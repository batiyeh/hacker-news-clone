//
//  UINavigationController+Extensions.swift
//  HackerNews
//
//  Created by Atiyeh, Brian (B.) on 2/26/20.
//  Copyright © 2020 Brian Atiyeh. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    func styleNavigationBarTitle(prefersLargeTitles: Bool = true) {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 20, weight: .bold), .foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = Factory.colors.hackerNewsOrange
        navBarAppearance.shadowImage = UIImage()
        navigationBar.standardAppearance = navBarAppearance
        navigationBar.scrollEdgeAppearance = navBarAppearance
        
        navigationBar.prefersLargeTitles = prefersLargeTitles
        navigationBar.layoutMargins.left = 25
        navigationBar.isTranslucent = false
    }
}
