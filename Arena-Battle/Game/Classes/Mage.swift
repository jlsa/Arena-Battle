class Mage: Fighter {
    var mana: Float = 0
    
    init(name: String, health: Float, maxAttackPower: Float, maxBlock: Float, mana: Float) {
        super.init(name, health, maxAttackPower, maxBlock)
        self.mana = mana
    }
}
