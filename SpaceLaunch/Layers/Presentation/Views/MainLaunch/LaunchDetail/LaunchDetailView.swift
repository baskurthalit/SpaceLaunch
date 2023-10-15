//
//  LaunchDetailView.swift
//  SpaceLaunch
//
//  Created by Halit Baskurt on 14.10.2023.
//

import SwiftUI

struct LaunchDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var launchNew: RocketLaunchModel?
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    LaunchCoverView(imageURL: launchNew?.links?.patch?.small)
                        .frame(height: 250)
                    Section {
                        let rocketName : String = launchNew?.name ?? ""
                        Text("\(rocketName) DETAILS")
                            .font(.title)
                            .hAlign(.leading)
                            .fontWeight(.bold)
                        if let detailsText = launchNew?.details {
                            Text(detailsText)
                                .hAlign(.leading)
                        } else {
                            Text("Not detail info found..")
                            Image(systemName: "waveform.and.magnifyingglass")
                                .resizable()
                                .frame(width: 70,height: 50)
                        }
                    }.padding()
                }.frame(maxWidth: .infinity)
            }
            .overlay(alignment: .topLeading) {
                backButton
            }
        }
        .clipped()
        .navigationBarBackButtonHidden(true)
        
    }
    
    
    private var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .foregroundColor(.primary)
                .padding(16)
                .background(.ultraThickMaterial)
                .cornerRadius(10)
                .shadow(radius: 4)
                .padding()
        }
    }
}


