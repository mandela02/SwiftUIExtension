//
//  LoadingView.swift
//  Cinder
//
//  Created by TriBQ on 04/09/2022.
//

import SwiftUI

public struct LoadingView: View {
    public init(backgroundColor: Color, foregroundColor: Color) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
    }
    
    @State
    private var isAnimating = false
    
    let backgroundColor: Color
    let foregroundColor: Color
        
    public var body: some View {
        ZStack {
            Circle()
                .stroke(backgroundColor,
                        style: StrokeStyle(lineWidth: 15,
                                           lineCap: .round,
                                           lineJoin: .round))
            
            Circle()
                .trim(from: 0, to: 0.25)
                .stroke(foregroundColor,
                        style: StrokeStyle(lineWidth: 10,
                                           lineCap: .round,
                                           lineJoin: .round))
                .rotationEffect(.init(degrees: isAnimating ? 0 : 360))

        }
        .onAppear(perform: {
            isAnimating = true
        })
        .animation(.linear.repeatForever(autoreverses: false),
                   value: isAnimating)
    }
}
