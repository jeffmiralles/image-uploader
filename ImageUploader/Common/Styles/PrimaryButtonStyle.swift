//
//  PrimaryButtonStyle.swift
//  ImageUploader
//
//  Created by Jefferson Miralles on 10/22/21.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    let disabled: Bool
    
    init(disabled: Bool = false) {
        self.disabled = disabled
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(EdgeInsets(top: 6, leading: 10, bottom: 6, trailing: 10))
            .background(Color.blue)
            .foregroundColor(disabled ? Color.white.opacity(0.5) : .white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed && !disabled ? 1.1 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
