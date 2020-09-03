import Foundation

class Fighter {
    var name: String = "Unknown Fighter"
    var startHealth: Float = 100
    var health: Float = 100
    var maxAttackPower: Float = 10
    var maxBlock: Float = 10
    
    init(_ name: String, _ health: Float, _ maxAttackPower: Float, _ maxBlock: Float) {
        self.name = name
        self.health = health
        self.maxBlock = maxBlock
        self.startHealth = health
        self.maxAttackPower = maxAttackPower
    }
    
    func attack() -> Float {
        return Float.random(in: 1...self.maxAttackPower)
    }
    
    func block() -> Float {
        return Float.random(in: 1...self.maxBlock)
    }
}
