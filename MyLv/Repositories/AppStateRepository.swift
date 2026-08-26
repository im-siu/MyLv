import Foundation

protocol AppStateRepository {
    func load() throws -> AppState
    func save(_ state: AppState) throws
    func reset() throws
}
