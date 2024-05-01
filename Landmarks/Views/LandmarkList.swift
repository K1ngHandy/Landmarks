//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Steve Handy on 2024.04.30.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationSplitView {
            List(landmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark") // iPad placeholder
        }
    }
}

#Preview {
    LandmarkList()
}
