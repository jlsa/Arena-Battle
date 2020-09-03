import SwiftUI

struct FighterDisplayView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                HStack {
                    Text("Fighters")
                        .foregroundColor(Color.blue)
                        .fontWeight(.semibold)
                        .padding(.leading, 10)
                    
                    Button(action: {}) {
                        Image("arrow-down")
                            .resizable()
                            .frame(width: 10, height: 10)
                    }.padding(.top, 5)
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image("menu")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }.padding()
                }
                .frame(height: 50)
                .padding(.leading, 10)
            
                Spacer()
            }
            
        }
    }
}

struct FighterDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        FighterDisplayView()
    }
}
