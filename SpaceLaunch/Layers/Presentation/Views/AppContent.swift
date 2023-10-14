//
//  ContentView.swift
//  SpaceLaunch
//
//  Created by Halit Baskurt on 14.10.2023.
//

import SwiftUI

struct AppContent: View {
    var body: some View {
        NavigationView {
            TabView {
                MainLaunchView()
                    .tabItem {
                        Text("SpaceX")
                        Image(systemName: "smallcircle.filled.circle")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppContent()
    }
}
