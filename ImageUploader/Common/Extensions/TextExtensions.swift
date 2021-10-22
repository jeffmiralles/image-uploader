//
//  TextExtensions.swift
//  ImageUploader
//
//  Created by Jefferson Miralles on 10/23/21.
//

import SwiftUI

extension Text {
    func removeConfig() -> some View {
        self
            .padding(6)
            .background(
                Color.gray.opacity(0.333)
                    .overlay(
                        ZStack(alignment: .topTrailing) {
                            Color.clear
                            Text("x")
                                .padding(2)
                                .font(.system(size: 9))
                        }
                    )
            )
    }
}

