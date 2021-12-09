//
//  NoteView.swift
//  NotesStar
//
//  Created by star on 09.12.21.
//

import SwiftUI

struct NoteView: View {
    @State var title = ""
    @State var noteText = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam"
    
    var body: some View {
//        TextEditor(text: $noteText)
        TextView(text: $noteText) // UITextView
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        print("Done")
                    }
                }
            }
    }
}

struct TextView: UIViewRepresentable {
    @Binding var text: String
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.attributedText = context.coordinator.updateAttributedString()
    }

    class Coordinator: NSObject {
        var parent: TextView
        
        init(_ textView: TextView) {
            self.parent = textView
        }
        
        func updateAttributedString() -> NSAttributedString {
            let attrs: [NSAttributedString.Key : Any] =
                [NSAttributedString.Key.font : UIFont.preferredFont(forTextStyle: .largeTitle),
                 NSAttributedString.Key.strikethroughStyle:NSUnderlineStyle.single.rawValue,
                 NSAttributedString.Key.strikethroughColor : UIColor.red]
            let attrString = NSAttributedString(string: parent.text, attributes: attrs)
            return attrString
        }
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView()
    }
}
