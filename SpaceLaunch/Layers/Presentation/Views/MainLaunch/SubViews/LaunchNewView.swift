//
//  LaunchNewView.swift
//  SpaceLaunch
//
//  Created by Halit Baskurt on 14.10.2023.
//

import SwiftUI


struct LaunchNewView : View {
    @State var isLaunchDetailPresented: Bool = false
    @State var launchNewModel : LaunchNewsModel
    
    var body: some View {
        VStack {
            Text(launchNewModel.launchType)
                .font(.headline)
                .foregroundColor(.white)
                .fillView(.black)
            Spacer()
            LaunchCoverView(imageURL: launchNewModel.rocketLaunch?.links?.patch?.small)
            Spacer()
            Text(launchNewModel.rocketLaunch?.name ?? "Elon Musk")
                .padding()
        }
        .onTapGesture { isLaunchDetailPresented.toggle() }
        .fullScreenCover(isPresented: $isLaunchDetailPresented) {
            LaunchDetailView(launchNew: $launchNewModel)
        }
    }
}
