import SwiftUI

struct FightView: View {
    
    let left: Fighter = Warrior(name: "Warrior",
                                health: 80,
                                maxAttackPower: 26,
                                maxBlock: 10,
                                rage: 0)
    let right: Fighter = Assassin(name: "Assassin",
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
                    ZStack {
                        Rectangle()
                            .fill(self.fightResult?.loser === self.left ? Color.red : Color.green)
                            .frame(width: 150, height: 250)
                            .scaleEffect(self.fightResult?.loser === self.left ? 0.75 : 1.0)
                        Text(self.left.name)
                    }
                    
                    ZStack {
                        Rectangle()
                            .fill(self.fightResult?.loser === self.right ? Color.red : Color.green)
                            .frame(width: 150, height: 250)
                            .scaleEffect(self.fightResult?.loser === self.right ? 0.75 : 1.0)
                        Text(self.right.name)
                    }
                }
                
                Spacer()
                
                if self.fightResult == nil {
                    HStack {
                        Button(action: {
                            self.fightResult = self.battle.Fight(self.left, self.right)
                            
                            print("Winner: \(self.fightResult.winner.name), Loser: \(self.fightResult.loser.name)")
                        }) {
                            Text("Fight")
                                .animation(.spring())
                        }
                    }
                } else {
                    HStack {
                        Button(action: {
                            self.fightResult = nil
                        }) {
                            Text("Reset")
                                .animation(.spring())
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
