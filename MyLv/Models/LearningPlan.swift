import Foundation

struct LearningPlan: Codable, Sendable, Equatable {
    let goal: String
    let character: Character
    private(set) var skills: [Skill]
    private(set) var todos: [Todo]
}
