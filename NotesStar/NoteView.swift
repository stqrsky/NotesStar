//
//  NoteView.swift
//  NotesStar
//
//  Created by star on 09.12.21.
//

import SwiftUI

struct NoteView: View {
    @State var title = ""
    @State var noteText = ""
    
    var body: some View {
        TextEditor(text: $noteText)
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView()
    }
}
