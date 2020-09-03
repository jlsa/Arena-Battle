class Assassin: Fighter {
    var energy: Int = 0
    var agility: Int = 0
    
    init(name: String, health: Int, maxAttackPower: Int, maxBlock: Int, energy: Int, agility: Int) {
        super.init(name, health, maxAttackPower, maxBlock)
        self.agility = agility
        self.energy = energy
    }
    
    override func block() -> Int {
        let randomDodgeAmount = Int.random(in: 1...100)
        if randomDodgeAmount < self.agility {
            return 10000
        } else {
            return super.block()
        }
    }
}
