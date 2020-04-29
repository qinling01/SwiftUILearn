//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by 灵 Q on 2020/4/6.
//  Copyright © 2020 灵 Q. All rights reserved.
//

import SwiftUI

let items: [TabBarItem] = [TabBarItem(icon: "house.fill", title: "Tabar-Home.text".localized, color: .blue, index: 0),
                           TabBarItem(icon: "list.dash", title: "Tabar-List.text".localized, color: .red, index: 1),
                           TabBarItem(icon: "square.and.pencil", title: "Tabar-Edit.text".localized, color: .orange, index: 2),
                           TabBarItem(icon: "person.fill", title: "Tabar-Personal.text".localized, color: .green, index: 3)]

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
                    Text("Tabar-Home.text".localized)
                }
            }
            
            ListFristPageView().tabItem {
                VStack {
                    Image(systemName: "list.dash")
                    Text("Tabar-List.text".localized)
                }
            }
            
            EditFristPageView().tabItem {
                VStack {
                    Image(systemName: "square.and.pencil")
                    Text("Tabar-Edit.text".localized)
                }
            }
            
            MyClassPageView().tabItem {
                VStack {
                    Image(systemName: "person.fill")
                    Text("Tabar-Personal.text".localized)
                }
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        AppView()
//        TabViews()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
