//
//  NotesStarApp.swift
//  NotesStar
//
//  Created by star on 04.12.21.
//

import SwiftUI

@main
struct NotesStarApp: App {
    @StateObject private var myNotes = MyNotes()
    
    var body: some Scene {
        WindowGroup {
            ContentView(myNotes: myNotes)
        }
    }
}
