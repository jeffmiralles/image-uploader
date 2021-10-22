//
//  ContentView.swift
//  ImageUploader
//
//  Created by Jefferson Miralles on 10/22/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ViewModel
    
    @State private var selectedTags: [String] = []
    @State private var tags: [String] = []
    @State private var showingTagsList = false
    
    private var items: [GridItem] {
        Array(repeating: .init(.flexible(), spacing: 16), count: 1)
    }
    
    init(viewModel: ViewModel = .init()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    @State private var showingFormView = false
    
    var body: some View {
        VStack {
            Button("+ Tags", action: toggleTagsList)
                .buttonStyle(PrimaryButtonStyle())
            
            if !selectedTags.isEmpty {
                HStack {
                    ForEach(selectedTags, id: \.self, content: selectedTagRow)
                }
                .padding(8)
            }
            
            if showingTagsList && !tags.isEmpty {
                List(tags, id: \.self, rowContent: tagRow)
                    .frame(height: 180)
            }
            
            Button("Add Image", action: toggleForm)
                .buttonStyle(PrimaryButtonStyle())
            
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: items, spacing: 16) {
                        ForEach(viewModel.filterPictures(selectedTags)) { picture in
                            Image(uiImage: picture.image)
                                .resizable()
                                .mask(RoundedRectangle(cornerRadius: 14.0))
                                .scaledToFit()
                        }
                    }
                    
                }
                .padding(.horizontal, 16)
                if !viewModel.containPictures() {
                    Text("No images to display")
                }
            }
            .padding(.top, 32)
        }
        .sheet(isPresented: $showingFormView, content: { FormView() })
        .onAppear(perform: setUp)
        .environmentObject(viewModel)
        
    }
    
    func setUp() {
        tags = viewModel.getTags()
        selectedTags = []
    }
    
    func toggleForm() {
        showingFormView.toggle()
    }
    
    func toggleTagsList() {
        showingTagsList.toggle()
    }
    
    func selectedTagRow(_ tag: String) -> some View {
        Text(tag)
            .removeConfig()
            .onTapGesture {
                removeSelectedTag(tag)
            }
    }
    
    func tagRow(_ tag: String) -> some View {
        Button(tag, action: {
            self.selectedTags.append(tag)
            if let index = tags.firstIndex(of: tag) {
                tags.remove(at: index)
            }
        })
    }
    
    func removeSelectedTag(_ tag: String) {
        tags.append(tag)
        if let index = selectedTags.firstIndex(of: tag) {
            self.selectedTags.remove(at: index)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
