//
//  LatestLaunchView.swift
//  SpaceLaunch
//
//  Created by Halit Baskurt on 14.10.2023.
//

import SwiftUI

struct MainLaunchView: View {
    @StateObject var viewModel: MainLaunchViewModel = .init()
    @State var launchNewDetail: LaunchNewsModel = .init(launchType: "", rocketLaunch: nil)
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                HStack(spacing: 10) {
                    ForEach(viewModel.launchNews) { launchNew in
                        LaunchNewView(launchNewModel: launchNew)
                            .frame(maxWidth: .infinity)
                            .frame(height: proxy.size.width * 3/4)
                            .background(.ultraThinMaterial)
                            .cornerRadius(10)
                    }
                }
            }
        }
        .padding()
            .onAppear {
                viewModel.fetchLaunchNews()
            }
        
    }
}

struct LatestLaunchView_Previews: PreviewProvider {
    static var previews: some View {
        MainLaunchView(launchNewDetail: .init(launchType: "", rocketLaunch: nil))
    }
}
