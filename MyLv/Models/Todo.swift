import Foundation

struct Todo: Identifiable, Codable, Sendable, Equatable {
    let id: UUID
    var title: String
    var skillID: UUID
    private(set) var completion: Completion
}
