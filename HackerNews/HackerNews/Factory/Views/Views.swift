//
//  Views.swift
//  HackerNews
//
//  Created by Brian Atiyeh on 2/26/20.
//  Copyright © 2020 Brian Atiyeh. All rights reserved.
//

import Foundation

public struct Views {
    public func banner(type: BannerType, text: String) -> Banner {
        return Banner(type: type, text: text)
    }
}
