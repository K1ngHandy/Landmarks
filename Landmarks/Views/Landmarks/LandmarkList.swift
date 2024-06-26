//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Steve Handy on 2024.04.30.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    // read model data of current view
    @State private var showFavoritesOnly = false
    // state as private to hold information specific to a view and its state
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) { // $ prefix to add binding to state variable
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
            .frame(minWidth: 300) // minimum size for macOS window
        } detail: {
            Text("Select a Landmark") // iPad placeholder
        }
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
