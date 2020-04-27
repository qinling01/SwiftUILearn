//
//  HomePageView.swift
//  SwiftUIPractice
//
//  Created by 灵 Q on 2020/4/8.
//  Copyright © 2020 灵 Q. All rights reserved.
//

import SwiftUI
import Alamofire

struct Menu: Identifiable {
    let id = UUID()
    let type: ViewType
    var title: String
    var color: Color
}

enum ViewType {
    case text
    case textCopy
    case homeList
    case cardAnimation
    case imageZoom
    case other
}

let menuData = [Menu(type: .text, title: "Text视图的段落属性", color: .green),
                Menu(type: .textCopy, title: "TextCopy", color: .blue),
                Menu(type: .homeList, title: "List", color: .red),
                Menu(type: .cardAnimation, title: "卡片带动画", color: .red),
                Menu(type: .imageZoom, title: "Image缩放", color: .orange),
                Menu(type: .other, title: "Other", color: .yellow)]

struct RowView: View {
    var item: Menu
    var body: some View {
        HStack {
            Text(item.title)
                .foregroundColor(item.color)
            Spacer()
            Image(systemName: "square.and.pencil")
        }
    }
}

struct HomePageView: View {
    var body: some View {
        List {
            ForEach(menuData) { item in
                NavigationLink(destination: self.rowSelect(item)) {
                    RowView(item: item)
                }
            }
        }
    }
    
    /// 分配需要跳转的页面
    /// - Parameter item: Menu
    /// - Returns: View
    func rowSelect(_ item: Menu) -> AnyView{
        switch item.type {
        case .text:
            return AnyView(TextSettingAttribute())
        case .textCopy:
            return AnyView(TextCopyView())
        case .homeList:
            return AnyView(HomeListView())
        case .cardAnimation:
            return AnyView(CardAnimationView())
        case .imageZoom:
            return AnyView(ImageZoom())
        default:
            return AnyView(ListFristPageView())
        }
    }
    
    func getJson() {
        let sessionManager = Alamofire.Session()
        sessionManager.request("", method: .get, parameters: [:], headers: nil).responseJSON { (response) in
            
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
