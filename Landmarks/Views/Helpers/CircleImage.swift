//
//  CircleImage.swift
//  Landmarks
//
//  Created by Steve Handy on 2024.04.29.
//

import SwiftUI

struct CircleImage: View {
    var image: Image // stored image property
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(image: Image("turtlerock"))
}
