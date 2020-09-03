//
//  ContentView.swift
//  Arena-Battle
//
//  Created by Joel Hoekstra on 02/09/2020.
//  Copyright © 2020 Joel Hoekstra. All rights reserved.
//

import SwiftUI

struct ActivityIndicator: View {

  @State private var isAnimating: Bool = false

  var body: some View {
    GeometryReader { (geometry: GeometryProxy) in
      ForEach(0..<5) { index in
        Group {
          Circle()
            .frame(width: geometry.size.width / 5, height: geometry.size.height / 5)
            .scaleEffect(!self.isAnimating ? 1 - CGFloat(index) / 5 : 0.2 + CGFloat(index) / 5)
            .offset(y: geometry.size.width / 10 - geometry.size.height / 2)
          }.frame(width: geometry.size.width, height: geometry.size.height)
            .rotationEffect(!self.isAnimating ? .degrees(0) : .degrees(360))
            .animation(Animation
              .timingCurve(0.5, 0.15 + Double(index) / 5, 0.25, 1, duration: 1.5)
              .repeatForever(autoreverses: false))
        }
      }
    .aspectRatio(1, contentMode: .fit)
    .onAppear {
        self.isAnimating = true
    }
  }
}

struct Indicator: View {

    @State var animateTrimPath = false
    @State var rotaeInfinity = false

    var body: some View {

        ZStack {
//            Color.black
//                .edgesIgnoringSafeArea(.all)
            ZStack {
                Path { path in
                    path.addLines([
                        .init(x: 2, y: 1),
                        .init(x: 1, y: 0),
                        .init(x: 0, y: 1),
                        .init(x: 1, y: 2),
                        .init(x: 3, y: 0),
                        .init(x: 4, y: 1),
                        .init(x: 3, y: 2),
                        .init(x: 2, y: 1)
                    ])
                }
                .trim(from: animateTrimPath ? 1/0.99 : 0, to: animateTrimPath ? 1/0.99 : 1)
                .scale(50, anchor: .topLeading)
                .stroke(Color.yellow, lineWidth: 20)
                .offset(x: 110, y: 350)
                .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
                .onAppear() {
                    self.animateTrimPath.toggle()
                }
            }
            .rotationEffect(.degrees(rotaeInfinity ? 0 : -360))
            .scaleEffect(0.3, anchor: .center)
            .animation(Animation.easeInOut(duration: 1.5)
            .repeatForever(autoreverses: false))
            .onAppear(){
                self.rotaeInfinity.toggle()
            }
        }
    }
}

struct ContentView: View {
    @State private var progress = 0.5
    
    var body: some View {
        FightView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
