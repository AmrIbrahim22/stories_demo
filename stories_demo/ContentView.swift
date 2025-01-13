//
//  ContentView.swift
//  stories_demo
//
//  Created by amr ibrahim on 12/01/2025.
//

import SwiftUI

struct ContentView: View {
    var images: [String] = ["image1", "image2",  "image4", "image5"]
    @ObservedObject var countTimer: CountTimer = CountTimer(items: 4, interval: 5.0)
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                // Image View
                Image(images[Int(countTimer.progress)])
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
                    .frame(width: geometry.size.width)
                    
                
                VStack {
                    // Progress Bars
                    HStack(alignment: .center, spacing: 4) {
                        ForEach(images.indices, id: \.self) { index in
                            LoadingBar(
                                progress: min(
                                    max(
                                        CGFloat(countTimer.progress) - CGFloat(index),
                                        0.0
                                    ),
                                    1.0
                                )
                            )
                            .frame(height: 2)
                            .animation(.linear, value: countTimer.progress)
                        }
                    }
                    .padding()
                    
                    Spacer()
                    
                    // Navigation Controls
                    HStack(alignment: .center, spacing: 0) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                countTimer.advancePage(by: -1)
                            }
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                countTimer.advancePage(by: 1)
                            }
                    }
                }
            }
        }
        .onAppear {
            countTimer.start()
        }
    }
}

#Preview {
    ContentView()
}
