//
//  LaunchDetailView.swift
//  SpaceLaunch
//
//  Created by Halit Baskurt on 14.10.2023.
//

import SwiftUI

struct LaunchDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var launchNew: LaunchNewsModel
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    LaunchCoverView(imageURL: launchNew.rocketLaunch?.links?.patch?.small)
                    Section {
                        Text("LAUNCH DETAILS")
                            .font(.largeTitle)
                            .hAlign(.leading)
                            .fontWeight(.bold)
                        Text(launchNew.rocketLaunch?.details ?? "NO-DETAIL-INFO")
                            .hAlign(.leading)
                    }.padding()
                }.frame(maxWidth: .infinity)
            }
            .overlay(alignment: .topLeading) {
                backButton
            }
        }.clipped()
        
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


