//
//  View+Ext.swift
//  SpaceLaunch
//
//  Created by Halit Baskurt on 14.10.2023.
//

import SwiftUI


extension View {
    func hAlign(_ alignment: Alignment) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    func vAlign(_ alignment: Alignment) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
    
    func border(_ width: CGFloat,_ color: Color) -> some View {
        self
            .padding(.horizontal,15)
            .padding(.vertical,10)
            .background {
                RoundedRectangle(cornerRadius: 5,style: .continuous)
                    .stroke(color,lineWidth: width)
            }
    }
    
    func fillView(_ color: Color, cornerRadius: CGFloat = 5) -> some View {
        self
            .padding(.horizontal,15)
            .padding(.vertical,10)
            .background {
                RoundedRectangle(cornerRadius: cornerRadius,style: .continuous)
                    .fill(color)
            }
    }
    
    func fillView(_ material: Material, cornerRadius: CGFloat = 5) -> some View {
        self
            .padding(.horizontal,15)
            .padding(.vertical,10)
            .background(material)
            .cornerRadius(cornerRadius)
    }
}
