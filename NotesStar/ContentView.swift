//
//  ContentView.swift
//  NotesStar
//
//  Created by star on 04.12.21.
//

import SwiftUI

struct ContentView: View {
    var folders = ["Folder1", "Folder2"]
    @State var searchString: String = ""
    @State var newFolderName: String = ""
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    TextField("Search, text: $searchString")
                    Section(header:
                        Text("On My iPhone")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.black)) {
                        ForEach (folders, id: \.self) { folderName in
                            FolderCell(name: folderName)
                        }
                    }
                    .textCase(nil)
                }
                .listStyle(InsetGroupedListStyle())
                .navigationTitle("Folders")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button("Edit") {
                            print("Edit")
                        }
                    }
                    ToolbarItemGroup(placement: .bottomBar) {
                        Image(systemName: "folder.badge.plus")
                        Image(systemName: "square.and.pencil")
                    }
                }
            }

            .frame(width: 200, height: 200)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Folder: View {
    var name: String
    var body: some View {
        HStack {
            Image(systemName: "folder")
            Text(name)
        }
    }
}
