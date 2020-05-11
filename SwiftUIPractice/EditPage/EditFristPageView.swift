//
//  EditFristPageView.swift
//  SwiftUIPractice
//
//  Created by 灵 Q on 2020/4/10.
//  Copyright © 2020 灵 Q. All rights reserved.
//

import SwiftUI

struct EditFristPageView: View {
    @ObservedObject var aritcleManager = AritcleManager()
    
    @State private var showingSeachBar = false
    @State private var inputText = ""
    
    @State private var showingInputView = false
    
    var body: some View {
        
        VStack {
            QLSearchBar(text: $inputText, cancle: {
                self.aritcleManager.reload()
            }) {
                self.aritcleManager.search(content: $0)
            }
            .padding(.leading, 10)
            .padding(.trailing, 0)
            
//            Button("这是测试点击") {
//                self.showingInputView.toggle()
//            }
            
            QLSquareListView(articles: $aritcleManager.articles) {
                 self.aritcleManager.articles[$0].delete()
            }
        }
        .navigationBarItems(leading:
            Button(action: {
                
            }, label: {
                Image(systemName: "list.dash")
                .imageScale(.large)
                .foregroundColor(.primary)
                .padding(.trailing, 40)
            })
                .frame(width: 60, height: 60)
            
            , trailing:
            
            Button(action: {
                print("..........")
                self.showingInputView.toggle()
            }, label: {
                Image(systemName: "square.and.pencil")
                    .imageScale(.large)
                    .foregroundColor(.primary)
                    .padding(.leading, 40)
            })
                .frame(width: 60, height: 60)
        )
            .sheet(isPresented: $showingInputView){
                InputView(reloadCommit: {
                    self.showingInputView.toggle()
                })
        }
    }
}

struct EditFristPageView_Previews: PreviewProvider {
    static var previews: some View {
        EditFristPageView()
    }
}
