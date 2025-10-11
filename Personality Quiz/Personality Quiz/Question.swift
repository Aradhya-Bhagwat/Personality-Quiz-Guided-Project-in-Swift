//
//  Question.swift
//  Personality Quiz
//
//  Created by SDC-USER on 11/09/25.
//

import Foundation

struct Question {
    var text: String
    var type: ResposneType
    var answers: [Answer]
    
    enum ResposneType {
        case single, multiple, ranged
    }
}

struct Answer {
    var text: String
    var type: AnimalType
}
    
enum AnimalType: Character {
        case lion = "🦁", cat = "🐱", rabbit = "🐰", turtle = "🐢"
        
        var definition: String {
            switch self {
            case .lion:
                return "You are incredibly outgoing. You surround yourself with people you love and enjoy activities with your friends."
            case .cat:
                return "Mischevous, yet mild-tempered, you enjoy doing things on your own terms."
            case .rabbit:
                return "You love everything thats soft. You are healthy and full of energy."
            case .turtle:
                return "You are wise beyond your years, and you focus on the details. Slow and steady wins the race."
            }
        }
}
