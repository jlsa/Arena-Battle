//
//  HealthBar.swift
//  Arena-Battle
//
//  Created by Joel Hoekstra on 04/09/2020.
//  Copyright © 2020 Joel Hoekstra. All rights reserved.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width, height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(UIColor.systemTeal))
                
                Rectangle().frame(width: min(CGFloat(self.value) * geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color(UIColor.systemBlue))
                    .animation(.linear)
            }
            .cornerRadius(45.0)
        }
    }
}

struct HealthBar: View {
    @State var progressValue: Float = 0.0
    
    var body: some View {
        ZStack {
            ProgressBar(value: $progressValue).frame(width: 80, height: 20)
        }
    }
}

struct HealthBar_Previews: PreviewProvider {
    static var previews: some View {
        HealthBar(progressValue: 0.34)
    }
}
