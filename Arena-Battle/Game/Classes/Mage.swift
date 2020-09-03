class Mage: Fighter {
    var mana: Int = 0
    
    init(name: String, health: Int, maxAttackPower: Int, maxBlock: Int, mana: Int) {
        super.init(name, health, maxAttackPower, maxBlock)
        self.mana = mana
    }
}
