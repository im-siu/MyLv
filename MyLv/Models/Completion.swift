import Foundation

enum Completion: Codable, Sendable, Equatable {
    case pending
    case completed(reward: Int, completedAt: Date)
}
