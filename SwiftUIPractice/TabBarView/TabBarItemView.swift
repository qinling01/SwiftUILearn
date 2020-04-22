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
                .font(.system(size: 12))
//                .padding(.top, 5.0)
                //baselineOffset--设置垂直方向偏移值
                .baselineOffset(-5.0)
        }
        .padding()
    }
}

struct TabBarItemView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarItemView(isSelected: .constant(true), item: TabBarItem(icon: "house", title: "首页", color: .blue))
    }
}

