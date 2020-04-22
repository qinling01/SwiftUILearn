//
//  MyClassInformationView.swift
//  SwiftUIPractice
//
//  Created by 灵 Q on 2020/4/8.
//  Copyright © 2020 灵 Q. All rights reserved.
//

import SwiftUI

struct Product : Identifiable{
    let id = UUID()
    let title:String
    var isFavorited:Bool
}

struct MyClassInformationView: View {
    private var products: [Product] = [
        Product(title:"abc1",isFavorited: true),
        Product(title:"abc2",isFavorited: true),
        Product(title:"abc3",isFavorited: false),
        Product(title:"abc4",isFavorited: true),
    ]
    
    @State private var showFavorited: Bool = true
    @State private var showQL: Bool = true
    
    var body: some View {
        List {
            FilterView(showFavorited: $showFavorited)
            
            ForEach(products) { product in
                if (self.showFavorited || product.isFavorited) && self.showQL{
                    self.rowView(product: product, on: self.showFavorited)
                }
            }
            
            Button("button") {
                print(".....",self.showQL)
                self.showQL.toggle()
            }
        }.navigationBarTitle("详情")
    }
    
    /// row刷新赋值
    /// - Parameter product: 数据model
    func rowView(product: Product, on: Bool) -> some View {
        print(">> \(product.isFavorited),,,", on)
        return Text(product.title)
    }
}

struct FilterView: View {
    @Binding var showFavorited: Bool
    var body: some View {
        //下面两种写法效果一样
//        Toggle(isOn: $showFavorited) {
//            Text("Change filter")
//        }
        
        Toggle("Title", isOn: $showFavorited)
    }
}

struct MyClassInformationView_Previews: PreviewProvider {
    static var previews: some View {
        MyClassInformationView()
    }
}
