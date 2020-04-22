//
//  TabBarItemView.swift
//  SwiftUIPractice
//
//  Created by 灵 Q on 2020/4/10.
//  Copyright © 2020 灵 Q. All rights reserved.
//

import SwiftUI

struct TabBarItemView: View {
    @Binding var isSelected: Bool
    public let item: TabBarItem
    
    var body: some View {
        VStack {
            Image(systemName: item.icon)
                .imageScale(.large)
                .foregroundColor(isSelected ? item.color : .primary)
            Text(item.title)
                .foregroundColor(isSelected ? item.color : .primary)
                .fontWeight(.semibold)
        }
        .padding()
    }
}

struct TabBarItemView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarItemView(isSelected: .constant(true), item: TabBarItem(icon: "house", title: "首页", color: .blue))
    }
}

