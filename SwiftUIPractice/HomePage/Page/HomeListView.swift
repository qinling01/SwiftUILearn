//
//  HomeListView.swift
//  SwiftUIPractice
//
//  Created by Mac on 2020/4/22.
//  Copyright © 2020 灵 Q. All rights reserved.
//

import SwiftUI
/**
 @ObservedObject：告诉SwiftUI，这个对象是可以被观察的，里面含有被@Published包装了的属性。@ObservedObject包装的对象，必须遵循ObservableObject协议。也就是说必须是class对象，不能是struct。
 @EnvironmentObject：包装的属性是全局的，整个app都可以访问。需要注意的是，不需要给定默认值，由于该属性是整个app都可以访问的，SwiftUI会自动的从环境中取出来
 @Environment：是从环境中取出预定义的值，比如获得当前是暗黑模式还是正常模式，屏幕的大小等等。
 @Binding：用的比较少，但是也是非常重要的一个包装，声明一个属性是从外部获取的，并且与外部是共享的。相当于外部传过来的时候，不是传递的值。
 @GestureState：能够让我们传递手势的状态，虽然使用@State也能实现，但@GestureState能让手势结束后我们回到最初的状态。
 */
/// @Published属性需要遵循ObservableObject协议，Published会自动修改与该属性绑定的界面，@Published包装会自动添加willSet方法监视属性的改变
class HomeListSectionModel: ObservableObject, Identifiable {
    let id = UUID()
    var title: String = ""
    /// 禁止删除
    var deleteDisabled = true
    /// 禁止移动
    var mobileDisabled = true
    /// 是否显示row
    var rowShow: Bool = true
    var rowModels: [HomeListRowModel] = []
    
    init(title: String, rowModels: [HomeListRowModel] = []) {
        self.title = title
        self.rowModels = rowModels
    }
}

/// @Published属性需要遵循ObservableObject协议
class HomeListRowModel: ObservableObject, Identifiable {
    let id = UUID()
    var title: String = ""
    /// 禁止删除
    var deleteDisabled = true
    /// 禁止移动
    var mobileDisabled = true
    /// 默认不喜欢
    var isLive: Bool = true
    
    init(title: String, deleteDisabled: Bool = true, mobileDisabled: Bool = true, isLive: Bool = true) {
        self.title = title
        self.deleteDisabled = deleteDisabled
        self.mobileDisabled = mobileDisabled
        self.isLive = isLive
    }
}

class HomeListDate: ObservableObject {
    /// 标明为 publish 属性
    @Published var sectionDataArr = [HomeListSectionModel](){
        didSet {
            print(#function, "值改变了")
            // 发送改变, 通知视图更新
            self.objectWillChange.send()
        }
    }
    
    init(_ dataArr: [HomeListSectionModel] = []) {
        self.sectionDataArr = dataArr
    }
}

fileprivate var dataArr = [HomeListSectionModel(title: "这是表头不可删除", rowModels: [HomeListRowModel(title: "Cell 默认不可删除，不可移动")])]

struct HomeListView: View {
    /// 一般静态数据, 用 @State, 动态用 @ObservedObject
    @ObservedObject var dataObj = HomeListDate(dataArr)
    var body: some View {
        List {
            ForEach(dataObj.sectionDataArr) { sectionModel in
//                Text("Hello")
                Section(
                header: HomeListHeaderView(dataObj: self.dataObj, sectionModel: sectionModel)
//                ,footer: HomeListFooterView()
                ) {
                    if sectionModel.rowShow {
                        ForEach(sectionModel.rowModels) { rowModel in
                            HomeListRowView(dataObj: self.dataObj, rowModel: rowModel)
                        }
                        .onDelete { (indexSet) in
                            print("...执行删除...",indexSet)
                            sectionModel.rowModels.remove(at: indexSet.first!)
                            self.dataObj.objectWillChange.send()
                        }
                        .onMove { (indexSet, index) in
                            print("....执行移动....",index)
                            sectionModel.rowModels.move(fromOffsets: indexSet, toOffset: index)
                            self.dataObj.objectWillChange.send()
                        }
                    }
                }
            }
        }
//        .listStyle(GroupedListStyle())
        .listStyle(PlainListStyle())
        .navigationBarItems(trailing:
            HStack {
                Button.init("Add Section") {
                    let model = HomeListSectionModel(title: "Header\(self.dataObj.sectionDataArr.count)")
                    model.deleteDisabled = false
                    self.dataObj.sectionDataArr.append(model)
                }
                EditButton()
                    .foregroundColor(Color.red)
            })
        .navigationBarTitle("List")
    }
}

/// ListCell
struct HomeListRowView: View {
    @ObservedObject var dataObj: HomeListDate
    @ObservedObject var rowModel: HomeListRowModel
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text(rowModel.title)
                Spacer()
                Image(rowModel.isLive ? "HomeLive" : "HomeUnLive")
                    .onTapGesture {
                        self.rowModel.isLive = !self.rowModel.isLive
                        self.dataObj.objectWillChange.send()
                }
            }
            Text("10:30")
                .padding(.top, 5)
        }
        .padding(.top, 5)
        .padding(.bottom, 5)
        .deleteDisabled(rowModel.deleteDisabled)
        .moveDisabled(rowModel.mobileDisabled)
    }
}

/// HeaderView
struct HomeListHeaderView: View {
    @ObservedObject var dataObj: HomeListDate
    @ObservedObject var sectionModel: HomeListSectionModel
    var body: some View {
        HStack {
            Text(sectionModel.title)
            Spacer()
            
            if !sectionModel.deleteDisabled {
                Button("Delete Section") {
                    let index = self.dataObj.sectionDataArr.lastIndex { (model) -> Bool in
                        if model.id == self.sectionModel.id {
                            return true
                        }
                        return false
                    }
                    
                    if let index = index {
                        self.dataObj.sectionDataArr.remove(at: index)
                    }
                }.foregroundColor(Color.red)
            }
            
            Button("Add Cell") {
                let model = HomeListRowModel(title: "Cell\(self.sectionModel.rowModels.count)", deleteDisabled: false, mobileDisabled: false, isLive: false)
                self.sectionModel.rowModels.append(model)
                self.dataObj.objectWillChange.send()
            }
            
            Button(sectionModel.rowShow ? "Hide" : "Show") {
                self.sectionModel.rowShow = !self.sectionModel.rowShow
                self.dataObj.objectWillChange.send()
            }
        }
    }
}

/// FooterView
struct HomeListFooterView: View {
    var body: some View {
        HStack {
            Text("这是尾部")
        }
    }
}

struct HomeListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeListView()
    }
}
