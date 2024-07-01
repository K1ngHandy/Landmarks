//
//  ContentView.swift
//  MacLandmarks
//
//  Created by Steve Handy on 2024.07.01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
            .frame(minWidth: 700, minHeight: 300)
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
