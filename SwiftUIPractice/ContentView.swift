//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by 灵 Q on 2020/4/6.
//  Copyright © 2020 灵 Q. All rights reserved.
//

import SwiftUI

let items: [TabBarItem] = [TabBarItem(icon: "house.fill", title: "首页", color: .blue),
                          TabBarItem(icon: "list.dash", title: "列表", color: .blue),
                          TabBarItem(icon: "square.and.pencil", title: "编辑", color: .blue),
                          TabBarItem(icon: "person.fill", title: "个人", color: .blue)]

/// 自定义tabBarItem
struct AppView: View {
    @State private var selectedIndex: Int = 0
    var selectItem: TabBarItem {
        items[selectedIndex]
    }
    var body: some View {
        NavigationView {
            VStack {
                if selectedIndex == 0 {
                    HomePageView()
                        .navigationBarTitle(selectItem.title)
                }
                if selectedIndex == 1 {
                    ListFristPageView()
                        .navigationBarTitle(selectItem.title)
                }
                if selectedIndex == 2 {
                    EditFristPageView()
                        .navigationBarTitle(selectItem.title)
                }
                if selectedIndex == 3 {
                    MyClassPageView()
                        .navigationBarTitle(selectItem.title)
                }
                Spacer()
                TabBarView(selectedIndex: $selectedIndex, items: items)
            }
        }
    }
}

struct TabViews: View {
    var body: some View {
        TabView {
            HomePageView().tabItem {
                VStack {
                    Image(systemName: "house.fill")
                    Text("首页")
                }
            }
            
            ListFristPageView().tabItem {
                VStack {
                    Image(systemName: "list.dash")
                    Text("列表")
                }
            }
            
            EditFristPageView().tabItem {
                VStack {
                    Image(systemName: "square.and.pencil")
                    Text("编辑")
                }
            }
            
            MyClassPageView().tabItem {
                VStack {
                    Image(systemName: "person.fill")
                    Text("个人")
                }
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
//        AppView()
        TabViews()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
