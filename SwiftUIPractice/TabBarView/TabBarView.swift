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
    @State var isSelectIndex: Bool = false
    @State var items: [TabBarItem] = []
    
    var body: some View {
        VStack {
//            Color.purple.edgesIgnoringSafeArea(.all)
            Divider()
            HStack {
                ForEach(0 ..< items.count) {index in
                    self.itemView(at: index)
                    if index != self.items.count - 1 {
                        Spacer()
                    }
                }
            }
            .padding(EdgeInsets(top: 0.0, leading: 10.0, bottom: -10.0, trailing: 10.0))
        }
    }
    
    func itemView(at index: Int) -> some View {
        Button.init(action: {
            self.selectedIndex = index
        }, label: {
            TabBarItemView(selectedIndex: self.$selectedIndex, item: items[index])
                .tag(index)
        })
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(selectedIndex: .constant(0), items: [
            TabBarItem(icon: "house", title: "首页", color: .red, index: 0),
            TabBarItem(icon: "heart", title: "最爱", color: .red, index: 1),
            TabBarItem(icon: "heart", title: "最爱", color: .red, index: 2),
            TabBarItem(icon: "heart", title: "最爱", color: .red, index: 3)])
    }
}
