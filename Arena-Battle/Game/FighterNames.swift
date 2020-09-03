enum Gender {
    case Male
    case Female
    case Other
}

struct FighterName {
    var gender: Gender
    var name: String
}

struct FighterInfo {
    static let fighterNames: [FighterName] = [
        FighterName(gender: .Male, name: "Khiro"),
        FighterName(gender: .Male, name: "Duncan"),
        FighterName(gender: .Female, name: "Zelda"),
        FighterName(gender: .Male, name: "Link"),
        FighterName(gender: .Male, name: "Mario"),
        FighterName(gender: .Male, name: "Connery"),
        FighterName(gender: .Female, name: "Bellatrix"),
        FighterName(gender: .Female, name: "Louisa"),
        FighterName(gender: .Female, name: "Maia"),
        FighterName(gender: .Female, name: "Brunhilda"),
        FighterName(gender: .Other, name: "Ajax"),
        FighterName(gender: .Other, name: "Atlas"),
        FighterName(gender: .Other, name: "Hayden"),
        FighterName(gender: .Other, name: "Rowan"),
        FighterName(gender: .Other, name: "Sage")
        
    ]
    
    static func RandomName(gender: Gender) -> FighterName {
        return fighterNames.filter{ $0.gender == gender }.randomElement()!
    }
}
