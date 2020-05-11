//
//  InputView.swift
//  SwiftUIPractice
//
//  Created by Mac on 2020/5/9.
//  Copyright © 2020 灵 Q. All rights reserved.
//

import SwiftUI

struct InputView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var reloadCommit: (() -> ())?
    
    @State private var textString: String = ""
    @State private var showingAlert: Bool = false
    // 当前时间字符串
    var nowTimeString: String {
        get {
            let dformatter = DateFormatter()
            dformatter.dateFormat = "yyyy年MM月dd日 HH:mm"
            return dformatter.string(from: Date())
        }
    }
    
    var body: some View {
        VStack {
            Text("内容编辑")
                //字体大小
                .font(.title)
                .padding(.top, 20)
            
            HStack(alignment: .top) {
                Text("在下面添加你想记录内容")
                    .foregroundColor(Color.gray)
                Spacer()
                Button("添加") {
                    if self.textString == "" {
                        self.showingAlert.toggle()
                    }else{
                        QLCoreData.shared.persistentContainer.viewContext.performChanges {
                            var article = Article.ViewModel()
                            article.content = self.textString
                            article.avatarColor = 0
                            article.createdAt = Date()
                            
                            _ = Article.insert(viewModel: article)
                        }
                        
                        //两种返回方式都可以
//                        self.reloadCommit?()
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }.alert(isPresented: $showingAlert) { () -> Alert in
                    Alert(title: Text("提示"), message: Text("文本内容不能为空"), dismissButton: .default(Text("确定")))
                }
            }
            .padding(10)
            .padding(.top, 30)
            
            
            CustomTextFiledView {
                self.textString = $0
            }
            .frame(height: 25, alignment: .leading)
            .padding(10)
//            .border(Color.gray, width: 1)
//            .overlay(Capsule.init(style: .circular).accentColor(Color.clear))
                //给view添加边框与圆角
                .overlay(
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .stroke(Color.gray, lineWidth: 1)
            )
            .padding(10)
            
            Spacer()
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
}
