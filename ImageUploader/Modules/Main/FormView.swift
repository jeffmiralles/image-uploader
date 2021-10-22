//
//  FormView.swift
//  ImageUploader
//
//  Created by Jefferson Miralles on 10/22/21.
//

import SwiftUI

struct FormView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject private var viewModel: ViewModel
    
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    @State private var tags: [String] = []
    @State private var selectedTags: [String] = []
    @State private var showingTagsList = false
    
    var body: some View {
        VStack {
            Color.gray.opacity(0.5)
                .overlay(
                    image?
                        .resizable()
                        .scaledToFit()
                )
            Button("Upload", action: { showingImagePicker.toggle() })
                .buttonStyle(PrimaryButtonStyle())
            Color.clear.overlay(
                VStack {
                    if !tags.isEmpty {
                        Button("Add tags", action: {showingTagsList.toggle()})
                            .buttonStyle(PrimaryButtonStyle())
                    }
                    if !selectedTags.isEmpty && image != nil {
                        HStack {
                            ForEach(selectedTags, id: \.self) { selectedTag in
                                Text(selectedTag)
                                    .removeConfig()
                                    .onTapGesture {
                                        tags.append(selectedTag)
                                        if let index = selectedTags.firstIndex(of: selectedTag) {
                                            self.selectedTags.remove(at: index)
                                        }
                                    }
                            }
                        }
                        .padding(8)
                    }
                    if showingTagsList && !tags.isEmpty {
                        List(tags, id: \.self) { tag in
                            Button {
                                self.selectedTags.append(tag)
                                if let index = tags.firstIndex(of: tag) {
                                    tags.remove(at: index)
                                }
                            } label: {
                                Text(tag)
                            }
                        }
                        .frame(height: 180)
                    }
                    HStack(spacing: 32) {
                        Button("Cancel", action: {presentationMode.wrappedValue.dismiss()})
                            .buttonStyle(PrimaryButtonStyle())
                        Button("Submit", action: {
                            guard let inputImage = inputImage else { return }
                            viewModel.submitImage(Picture(image: inputImage, tags: selectedTags))
                            presentationMode.wrappedValue.dismiss()
                        })
                            .buttonStyle(PrimaryButtonStyle(disabled: self.image == nil))
                    }
                    .padding(.top, 16)
                }
            )
        }
        .sheet(isPresented: $showingImagePicker) {
            loadImage()
        } content: {
            ImagePicker(image: self.$inputImage)
        }
    }
    
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        tags = viewModel.getTags()
        selectedTags = []
        image = Image(uiImage: inputImage)
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
