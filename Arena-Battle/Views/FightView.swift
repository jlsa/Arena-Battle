import SwiftUI

enum FighterCardState {
    case Win
    case Loss
    case Default
}



struct FighterCard: View {
    @Binding var fighter: Fighter
    var fighterCardState: FighterCardState
    @State var progressValue: Float = 1.0
    
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
                        print((1 / self.fighter.startHealth * self.fighter.health))
                        self.progressValue = (1 / self.fighter.startHealth * self.fighter.health)
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
    
    @State var left: Fighter = Warrior(name: FighterInfo.RandomName(gender: .Male).name,
                                health: 80,
                                maxAttackPower: 26,
                                maxBlock: 10,
                                rage: 0)
    @State var right: Fighter = Assassin(name: FighterInfo.RandomName(gender: .Female).name,
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
                    FighterCard(fighter: self.$left,
                                fighterCardState: self.fightResult?.loser === self.left ? .Loss : .Default)
                    
                    FighterCard(fighter: self.$right,
                                fighterCardState: self.fightResult?.loser === self.right ? .Loss : .Default)
                }
                
                Spacer()
                
                if self.fightResult == nil {
                    HStack {
                        Button(action: {
//                            let fightResult: FightResult = FightResult(winner: self.left, loser: self.right)
//                            let fightState = Battle.GetFightState(self.left, self.right)
//                            print(self.left.health)
//                            print(self.right.health)
                            self.fightResult = self.battle.Fight(self.left, self.right)
                            self.left = self.fightResult.winner === self.left ? self.fightResult.winner : self.fightResult.loser
                            
                            self.right = self.fightResult.winner === self.right ? self.fightResult.winner : self.fightResult.loser
                            
//                            print("health of winner: \(self.fightResult.winner.health)")
                            print("Winner: \(self.fightResult.winner.name), Loser: \(self.fightResult.loser.name)")
                        }) {
                            Text("Fight")
                                .padding()
                        }
                    }
                } else {
                    HStack {
                        Button(action: {
                            self.fightResult = nil
                        }) {
                            Text("Reset")
                                .padding()
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
