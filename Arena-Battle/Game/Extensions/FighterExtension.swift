extension Fighter: Attackable, Blockable {
    func Attack() -> Int {
        return attack()
    }
    
    func Block() -> Int {
        return block()
    }
}
