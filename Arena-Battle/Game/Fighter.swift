import Foundation

class Fighter {
    var name: String = "Unknown Fighter"
    var startHealth: Int = 100
    var health: Int = 100
    var maxAttackPower: Int = 10
    var maxBlock: Int = 10
    
    init(_ name: String, _ health: Int, _ maxAttackPower: Int, _ maxBlock: Int) {
        self.name = name
        self.health = health
        self.maxBlock = maxBlock
        self.startHealth = health
        self.maxAttackPower = maxAttackPower
    }
    
    func attack() -> Int {
        return Int.random(in: 1...self.maxAttackPower)
    }
    
    func block() -> Int {
        return Int.random(in: 1...self.maxBlock)
    }
}
