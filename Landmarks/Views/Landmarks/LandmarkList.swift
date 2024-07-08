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
    @State private var filter = FilterCategory.all
    @State private var selectedLandmark: Landmark?
    
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
        
        var id: FilterCategory { self }
    }
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
                && (filter == .all || filter.rawValue == landmark.category.rawValue)
        }
    }
    
    var title: String {
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return showFavoritesOnly ? "Favorite \(title)" : title
    }
    
    var index: Int? {
        modelData.landmarks.firstIndex(where: { $0.id == selectedLandmark?.id })
    }
    
    var body: some View {
        @Bindable var modelData = modelData
        
        NavigationSplitView {
            List(selection: $selectedLandmark) {
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                    .tag(landmark)
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle(title)
            .frame(minWidth: 300) // minimum size for macOS window
            .toolbar {
                ToolbarItem {
                    Menu {
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(.inline)
                        
                        Toggle(isOn: $showFavoritesOnly) { // $ prefix to add binding to state variable
                            Text("Favorites only")
                        }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3");
                    }
                }
            }
        } detail: {
            Text("Select a Landmark") // iPad placeholder
        }
        .focusedValue(\.selectedLandmark, $modelData.landmarks[index ?? 0])
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
