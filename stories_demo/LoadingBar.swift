//
//  LoadingBar.swift
//  stories_demo
//
//  Created by amr ibrahim on 12/01/2025.
//

import SwiftUI

struct LoadingBar: View {
    var progress : CGFloat
    var body: some View {
        GeometryReader { geometry in ZStack(alignment: .leading){
            Rectangle().foregroundColor(Color.white.opacity(0.5)).cornerRadius(5)
            Rectangle().frame( width :  geometry.size.width * self.progress , height : nil , alignment: .leading).foregroundColor(.white).cornerRadius(5)
        }
        }    }
}

#Preview {
    LoadingBar( progress: 0.1)
}
