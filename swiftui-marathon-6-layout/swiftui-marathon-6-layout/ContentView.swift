//
//  ContentView.swift
//  swiftui-marathon-6-layout
//
//  Created by Vladislav Shakhray on 14/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State var isHorizontal = false
    let nSquares = 7
    var body: some View {
        let layout = isHorizontal
        ? AnyLayout(HStackLayout(spacing: 12.0))
        : AnyLayout(VStackLayout(spacing: 0.0))
        
        GeometryReader(content: { geometry in
            layout {
                let elementsArray = isHorizontal ? Array(0...nSquares - 1) : Array(0...nSquares - 1).reversed()
                ForEach(elementsArray, id: \.self) { index in
                    
                    let verticalSquareSize = geometry.size.height / CGFloat(nSquares)
                    
                    Button {
                        withAnimation {
                            isHorizontal.toggle()
                        }
                    } label: {
                        Color.blue
                        
                    }
                    .aspectRatio(1.0, contentMode: .fit)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .offset(x: isHorizontal
                            ? CGFloat(0.0)
                            : 0.0 + CGFloat(index) * (geometry.size.width - verticalSquareSize) / CGFloat(nSquares - 1),
                            y: isHorizontal ? geometry.size.height / 2.0 : CGFloat(0.0))
                    
                }
            }
        })
        .background(.white)
    }
}

#Preview {
    ContentView()
}
