class Battle {
    func Fight(_ fighter1: Fighter, _ fighter2: Fighter) -> FightResult {
        fighter1.health = fighter1.startHealth
        fighter2.health = fighter2.startHealth
        
        while true {
            if (Battle.GetFightState(fighter1, fighter2) == .Done) {
                return FightResult(winner: fighter1, loser: fighter2)
            }

            if (Battle.GetFightState(fighter2, fighter1) == .Done) {
                return FightResult(winner: fighter2, loser: fighter1)
            }
        }
    }
    
    static func GetFightState(_ fighterOne: Fighter, _ fighterTwo: Fighter) -> FightState {
        
        var damageDoneToOpponent: Float = fighterOne.Attack() - fighterTwo.Block()
        
        damageDoneToOpponent = damageDoneToOpponent <= 0 ? 0 : damageDoneToOpponent
        
        fighterTwo.health = fighterTwo.health - damageDoneToOpponent
        
        if fighterTwo.health <= 0 {
            return FightState.Done
        }
        return FightState.Fighting
    }
}
