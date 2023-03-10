//
//  CodeTextView.swift
//  LearningApp
//
//  Created by Sean.Lacey on 3/10/23.
//

import SwiftUI

struct CodeTextView: UIViewRepresentable {
    
    @EnvironmentObject var model: ContentModel
    
    func makeUIView(context: Context) -> some UITextView {
        let textView = UITextView()
        
        textView.isEditable = false
        return textView
    }
    
    func updateUIView(_ textView: UIViewType, context: Context) {
        //Set the attributed Text for the lesson
        textView.attributedText = model.lessonDescription
        
        // scroll back to the top
        textView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
        
    }
}

struct CodeTextView_Previews: PreviewProvider {
    static var previews: some View {
        CodeTextView()
    }
}
