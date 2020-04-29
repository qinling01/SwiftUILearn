//
//  TabBarItemView.swift
//  SwiftUIPractice
//
//  Created by 灵 Q on 2020/4/10.
//  Copyright © 2020 灵 Q. All rights reserved.
//

import SwiftUI

struct TabBarItemView: View {
    @Binding var selectedIndex: Int
    var item: TabBarItem
    
    var body: some View {
        VStack {
            Image(systemName: item.icon)
                .imageScale(.large)
                .foregroundColor(selectedIndex == item.index ? item.color : defalutColor())
            Text(item.title)
                .foregroundColor(selectedIndex == item.index ? item.color : defalutColor())
                .font(.system(size: 12))
//                .padding(.top, 5.0)
                //baselineOffset--设置垂直方向偏移值
                .baselineOffset(-5.0)
        }
        .padding()
    }
    
    func defalutColor() -> Color{
        return .primary
    }
}

struct TabBarItemView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarItemView(selectedIndex: .constant(0), item: TabBarItem(icon: "house", title: "首页", color: .blue, index: 0))
    }
}

