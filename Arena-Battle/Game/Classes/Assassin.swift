class Assassin: Fighter {
    var energy: Float = 0
    var agility: Float = 0
    
    init(name: String, health: Float, maxAttackPower: Float, maxBlock: Float, energy: Float, agility: Float) {
        super.init(name, health, maxAttackPower, maxBlock)
        self.agility = agility
        self.energy = energy
    }
    
    override func block() -> Float {
        let randomDodgeAmount = Float.random(in: 1...100)
        if randomDodgeAmount < self.agility {
            return 10000.0
        } else {
            return super.block()
        }
    }
}
