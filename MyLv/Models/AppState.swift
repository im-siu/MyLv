import Foundation

enum AppState: Codable, Sendable, Equatable {
    case onboarding(selectedCharacter: Character?)
    case ready(LearningPlan)
}
