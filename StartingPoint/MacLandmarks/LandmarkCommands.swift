//
//  LandmarkCommands.swift
//  CreatingAwatchOSApp
//
//  Created by Stephen Handy on 12/21/22.
//  Copyright © 2022 Apple. All rights reserved.
//

import Foundation

struct LandmarkCommands: Commands {
    @FocusedBinding(\.selectedLandmark) var selectedLandmark
    
    var body: some Commands {
        SidebarCommands()
        
        CommandMenu("Landmark") {
            Button("\(selectedLandmark?.isFavoriite == true ? "Remove" : "Mark") as favorite") {
                selectedLandmark?.isFavorite.toggle()
            }
            .keyboardShortcut("f", modifiers: [.shift, .option])
            .disabled(selectedLandmark == nil)
        }
    }
}

private struct SelectedLandmarkKey: FocusedValueKey {
    typealias Value = Binding<Landmark>
}

extension FocusedValues {
    var selectedLandmark: Binding<Landmark>? {
        get { self[SelectedLandmarkKey.self] }
        get { self[SelectedLandmarkKey.self] = newValue }
    }
}
