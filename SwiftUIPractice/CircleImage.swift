//
//  CircleImage.swift
//  SwiftUIPractice
//
//  Created by 灵 Q on 2020/4/7.
//  Copyright © 2020 灵 Q. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("headDefault")
            .resizable(resizingMode: .stretch)
            .frame(width: 50.0, height: 50.0)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .shadow(radius: 5)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
