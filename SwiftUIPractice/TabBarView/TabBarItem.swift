//
//  TabBarItem.swift
//  SwiftUIPractice
//
//  Created by 灵 Q on 2020/4/10.
//  Copyright © 2020 灵 Q. All rights reserved.
//

import SwiftUI

struct TabBarItem {
    public let icon: String
    public let title: String
    public let color: Color
    public var index: Int
    
    init(icon: String, title: String, color: Color, index: Int) {
        self.icon = icon
        self.title = title
        self.color = color
        self.index = index
    }
}
