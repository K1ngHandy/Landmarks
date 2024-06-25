//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Steve Handy on 2024.05.03.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    // enables to read and write between a property that stores data and a view that displays and changes the data
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .yellow : .gray)
        }
    }
}

#Preview {
    FavoriteButton(isSet: .constant(true))
}
