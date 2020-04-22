//
//  TabBarView.swift
//  SwiftUIPractice
//
//  Created by 灵 Q on 2020/4/10.
//  Copyright © 2020 灵 Q. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
    @Binding var selectedIndex: Int
    let items: [TabBarItem]
    
    var body: some View {
        HStack {
            ForEach(0 ..< items.count) {index in
                self.itemView(at: index)
                if index != self.items.count - 1 {
                    Spacer()
                }
            }
        }.padding()
    }
    
    func itemView(at index: Int) -> some View {
        Button.init(action: {
            self.selectedIndex = index
        }, label: {
            TabBarItemView(isSelected: .constant(self.selectedIndex == index ? true : false), item: items[index])
        })
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(selectedIndex: .constant(0), items: [
            TabBarItem(icon: "house", title: "首页", color: .red),
            TabBarItem(icon: "heart", title: "最爱", color: .red),
            TabBarItem(icon: "heart", title: "最爱", color: .red),
            TabBarItem(icon: "heart", title: "最爱", color: .red)])
    }
}
