//
//  LaunchCoverView.swift
//  SpaceLaunch
//
//  Created by Halit Baskurt on 14.10.2023.
//

import SwiftUI

struct LaunchCoverView: View {
    let imageURL: String?
    
    var body: some View {
        VStack {
            if let launchImage = imageURL {
                AsyncImage(url: URL(string: launchImage)) { image in
                    image
                        .resizable()
                        .padding()
                } placeholder: {
                    ProgressView()
                }
            }
            else {
                Image(systemName: "questionmark.diamond")
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
        }
    }
}

struct LaunchCoverView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchCoverView(imageURL: "")
    }
}
