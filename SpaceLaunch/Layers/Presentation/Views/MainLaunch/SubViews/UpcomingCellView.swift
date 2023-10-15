//
//  UpcomingCellView.swift
//  SpaceLaunch
//
//  Created by Halit Baskurt on 14.10.2023.
//

import SwiftUI

struct UpcomingCellView: View {
    let rocketLaunch: RocketLaunchModel
    
    var body: some View {
        NavigationLink {
            LaunchDetailView(launchNew: rocketLaunch)
        } label: {
            HStack(alignment: .bottom, spacing: 0.0) {
                HStack(spacing: 16.0) {
                    imageSection
                    titleSection
                }
            }
            .padding(12)
            .background(RoundedRectangle(cornerRadius: 0)
                .fill(.ultraThinMaterial)
            )
            .cornerRadius(15)
        }
        .buttonStyle(.plain)
    }
    
    private var imageSection: some View {
        ZStack{
            AsyncImage(url: URL(string: rocketLaunch.links?.patch?.small ?? "")) { image in
                image
                    .resizable()
                    .frame(width: 80, height: 100)
                    .cornerRadius(10)
                    .clipped()
                    .scaledToFill()
            } placeholder: {
                Image(systemName: "character.duployan")
                    .resizable()
                    .frame(width: 50, height: 50)
            }.frame(width: 80,height: 100)
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(rocketLaunch.name ?? "Unknown")
                .font(.title2)
                .fontWeight(.bold)
            Text(rocketLaunch.date_utc?.utcToLocal() ?? "UTC:-")
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
