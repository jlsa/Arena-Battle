class Warrior: Fighter {
    var rage: Float = 0
    
    init(name: String, health: Float, maxAttackPower: Float, maxBlock: Float, rage: Float) {
        super.init(name, health, maxAttackPower, maxBlock)
        self.rage = rage
    }
}
