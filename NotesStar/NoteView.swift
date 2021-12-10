//
//  NoteView.swift
//  NotesStar
//
//  Created by star on 09.12.21.
//

import SwiftUI

struct NoteView: View {
    @State var title = ""
    @State var noteText = "#bStarsky'b is in Bold\r #iStarsky#i will be in Italics\r #uStarsky#u will be underlined."
    
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
    
    let textStorage = NSTextStorage()
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UITextView {
        let attrs =
        [NSAttributedString.Key.font:UIFont
            .preferredFont(forTextStyle: .body)]
        let attrString = NSAttributedString(string: text, attributes: attrs)
        textStorage.append(attrString)
        
        let layoutManager = NSLayoutManager()
        let container = NSTextContainer(size: CGSize())
        container.widthTracksTextView = true
        layoutManager.addTextContainer(container)
        textStorage.addLayoutManager(layoutManager)
        
        let textView = UITextView(frame: CGRect(), textContainer: container)
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        context.coordinator.updateAttributedString()
//        uiView.attributedText = context.coordinator.updateAttributedString()
    }

    class Coordinator: NSObject {
        var parent: TextView
        
        var replacements: [String: [NSAttributedString.Key:Any]] = [:]
        init(_ textView: TextView) {
            self.parent = textView
            
            super.init()
            
            let strikeThroughAttributes =
            [NSAttributedString.Key.strikethroughStyle: 1]
            
            replacements =
            ["(-\\w+(\\s\\w+)*-)":strikeThroughAttributes]
        }
/*
        func updateAttributedString() -> NSAttributedString {
            let attrs: [NSAttributedString.Key : Any] =
                [NSAttributedString.Key.font : UIFont.preferredFont(forTextStyle: .largeTitle),
                 NSAttributedString.Key.strikethroughStyle : NSUnderlineStyle.single.rawValue,
                 NSAttributedString.Key.strikethroughColor : UIColor.red ]
            let attrString = NSAttributedString(string: parent.text, attributes: attrs)
            return attrString
        }
 */
        func updateAttributedString() {
            for (pattern, attributes) in replacements {
                do {
                    let regex = try NSRegularExpression(pattern: pattern)
                    
                    let range = NSRange(parent.text.startIndex..., in: parent.text)
                    regex.enumerateMatches(in: parent.text, range: range) {
                        match, flags, stop in
                        
                        if let matchRange = match?.range(at: 1) {
                            print("matched \(pattern)")
                            parent.textStorage.addAttributes(attributes, range: matchRange)
                        }
                    }
                }
                catch {
                    print("Error occured")
                }
            }
        }
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView()
    }
}
