import SwiftUI

enum FighterCardState {
    case Win
    case Loss
    case Default
}

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

struct FighterCard: View {
    
    var fighter: Fighter
    var fighterCardState: FighterCardState
    @State var progressValue: Float = 0.0
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(self.fighterCardState == .Loss ? Color.gray : Color.green)
                .frame(width: 150, height: 250)
            
            VStack {
                HStack {
                    Text(self.fighter.name)
                    
                    Spacer()
                    
                    Button(action: {
                        print("Lala")
                    }) {
                        Circle()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color.black)
                            .overlay(Image("times")
                                .resizable()
                                .frame(width: 10, height: 10)
                                .foregroundColor(Color.white))
                    }
                }.padding(.horizontal, 25)
                
                ZStack {
                    Image("\(String(describing: self.fighter))")
                        .resizable()
                        .frame(width: 125, height: 125)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 3)
                        .frame(width: 125, height: 125)
                        .foregroundColor(Color.white)
                    
                }
                
                HStack {
                    Text("HP:")
                    
                    HealthBar(progressValue: (1 / self.fighter.startHealth * self.fighter.health))
                }
            }
            
        }.scaleEffect(self.fighterCardState == .Loss ? 0.75 : 1.0)
    }
}

struct FightView: View {
    
    let left: Fighter = Warrior(name: "Duncan",
                                health: 80,
                                maxAttackPower: 26,
                                maxBlock: 10,
                                rage: 0)
    let right: Fighter = Assassin(name: "Bellatrix",
                                  health: 50,
                                  maxAttackPower: 18,
                                  maxBlock: 8,
                                  energy: 100,
                                  agility: 60)
    
    let battle:Battle = Battle()
    
    @State private var fightResult: FightResult!
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                HStack {
                    FighterCard(fighter: self.left,
                                fighterCardState: self.fightResult?.loser === self.left ? .Loss : .Default)
                    
                    FighterCard(fighter: self.right,
                                fighterCardState: self.fightResult?.loser === self.right ? .Loss : .Default)
                }
                
                Spacer()
                
                if self.fightResult == nil {
                    HStack {
                        Button(action: {
                            self.fightResult = self.battle.Fight(self.left, self.right)
                            
                            print("Winner: \(self.fightResult.winner.name), Loser: \(self.fightResult.loser.name)")
                        }) {
                            Text("Fight")
                        }
                    }
                } else {
                    HStack {
                        Button(action: {
                            self.fightResult = nil
                        }) {
                            Text("Reset")
                        }
                    }
                }
                Spacer()
            }
        }
    }
}

struct FightView_Previews: PreviewProvider {
    static var previews: some View {
        FightView()
    }
}
