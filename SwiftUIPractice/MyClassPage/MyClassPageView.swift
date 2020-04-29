//
//  MyClassPageView.swift
//  SwiftUIPractice
//
//  Created by 灵 Q on 2020/4/8.
//  Copyright © 2020 灵 Q. All rights reserved.
//

import SwiftUI

struct MyClassPageView: View {
    var body: some View {
//        VStack {
////            MapView().frame(height: 200)
//            ExtractedView()
//        }
        ExtractedView()
    }
}


struct MyClassPageView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone XS Max", "iPhone 8"], id: \.self) { deviceName in
            MyClassPageView()
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
    }
}

struct ExtractedView: View {
    var body: some View {
        List(0 ..< 8) { item in
            CircleImage()
            NavigationLink.init(destination: MyClassInformationView()) {
                VStack(alignment: .leading) {
                    Text("这是真的吗傻等哈说打死啊好堵ddjagdjjj啊")
                        .font(.system(size: 21)).bold()
                    HStack {
                        Text("当然是真的了")
                            .font(.subheadline)
                        Spacer()
                        Text("10:37")
                    }
                    .padding(.top, 5.0)
                }
                .padding(10)
            }
        }
    }
}
