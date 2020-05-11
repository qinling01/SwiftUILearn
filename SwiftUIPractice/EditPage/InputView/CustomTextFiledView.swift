//
//  CustomTextFiledView.swift
//  SwiftUIPractice
//
//  Created by Mac on 2020/5/11.
//  Copyright © 2020 灵 Q. All rights reserved.
//

import SwiftUI

struct CustomTextFiledView: UIViewRepresentable {
    var changeHandler:((String) -> Void)?
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<CustomTextFiledView>) -> UITextField {
        let tv = UITextField()
        tv.tintColor = .secondaryLabel
        tv.font = UIFont.systemFont(ofSize: 16)
        tv.delegate = context.coordinator
        tv.returnKeyType = .default
        tv.placeholder = "请输入你想要记录的内容"
        return tv
    }
    
    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<CustomTextFiledView>) {
        
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var masTextView: CustomTextFiledView
        
        init(_ textView: CustomTextFiledView) {
            self.masTextView = textView
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            masTextView.changeHandler?(textField.text ?? "")
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
    }
}
