class Warrior: Fighter {
    var rage: Int = 0
    
    init(name: String, health: Int, maxAttackPower: Int, maxBlock: Int, rage: Int) {
        super.init(name, health, maxAttackPower, maxBlock)
        self.rage = rage
    }
}
