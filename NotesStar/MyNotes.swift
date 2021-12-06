//
//  MyNotes.swift
//  NotesStar
//
//  Created by star on 06.12.21.
//

import Foundation

class MyNotes: ObservableObject {
    @Published var folders = [Folder]()
}

struct Folder: Identifiable {
    var id = UUID()
    
    var name: String
}

var testFolders = [
    Folder(name: "Folder1"),
    Folder(name: "Folder2")
]
