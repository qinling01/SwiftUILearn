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
                
            }) { (searText) in
                
            }
            .padding(.leading, 10)
            .padding(.trailing, 0)
            
            QLSquareListView(articles: $aritcleManager.articles)
        }
        .navigationBarItems(leading:
            Button(action: {
                
            }, label: {
                Image(systemName: "list.dash")
                .imageScale(.large)
                .foregroundColor(.primary)
            })
                .frame(width: 25, height: 25)
            , trailing:
            
            Button(action: {
                self.showingInputView.toggle()
            }, label: {
                Image(systemName: "square.and.pencil")
                    .imageScale(.large)
                    .foregroundColor(.primary)
            })
                .frame(width: 25, height: 25)
        )
            .sheet(isPresented: $showingInputView) {
                InputView {
                    self.showingInputView.toggle()
                }
        }
    }
}

struct EditFristPageView_Previews: PreviewProvider {
    static var previews: some View {
        EditFristPageView()
    }
}
