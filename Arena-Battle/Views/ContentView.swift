//
//  ContentView.swift
//  Arena-Battle
//
//  Created by Joel Hoekstra on 02/09/2020.
//  Copyright © 2020 Joel Hoekstra. All rights reserved.
//

import SwiftUI

struct BindingTestView: View {
    @State var showingAddUser = false
    
    var body: some View {
        Button(action: {
            self.showingAddUser.toggle()
        }) {
            Text("Show Add User")
        }
        .sheet(isPresented: $showingAddUser) {
            AddView(isPresented: self.$showingAddUser)
        }
    }
}

struct AddView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        HStack {
            Text("Adding a user")
            Button("Dismiss") {
                self.isPresented = false
            }
        }
    }
}


struct ContentView: View {
    @State private var progress = 0.5
    
    var body: some View {
        ZStack {
            Color(.systemTeal).edgesIgnoringSafeArea(.all)
//            BindingTestView()
            FightView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
