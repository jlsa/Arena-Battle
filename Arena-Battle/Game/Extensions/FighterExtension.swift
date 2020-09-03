extension Fighter: Attackable, Blockable {
    func Attack() -> Float {
        return attack()
    }
    
    func Block() -> Float {
        return block()
    }
}
