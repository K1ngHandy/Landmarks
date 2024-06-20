//
//  ContentView.swift
//  WatchLandmarks Watch App
//
//  Created by Steve Handy on 2024.06.20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
