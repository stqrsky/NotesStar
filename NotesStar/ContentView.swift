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
                    TextField("Search", text: $searchString)
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
            GeometryReader { geo in
                ZStack {
                    RoundedRectangle(cornerRadius: 7)
                        .fill(Color(.systemGray4))
                        .frame(width: geo.size.width * 0.70, height: geo.size.width * 0.40, alignment: .center)
                    VStack {
                        Text("New Folder")
                            .font(.headline)
                        Text("Enter a name for this folder")
                            .font(.subheadline)
                        Spacer()
                        TextField("Name", text: $newFolderName)
                            .frame(width: 200, height: 10)
                            .padding()
                            .background(Color(.white))
                            .cornerRadius(7)
                        Spacer()
                        Color.gray.frame(width: 200, height: CGFloat(1))
                        HStack {
                            Button(action: {print("Cancel")}) {
                                Text("Cancel")
                                    .frame(maxWidth: .infinity)
                            }
                            Button(action: {print("Save")}) {
                                Text("Save")
                                    .frame(maxWidth: .infinity)
                            }
                        }
                    }
                    .frame(width: geo.size.width * 0.70, height: geo.size.width * 0.35)
                }
                .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct FolderCell: View {
    var name: String
    var body: some View {
        HStack {
            Image(systemName: "folder")
            Text(name)
        }
    }
}
