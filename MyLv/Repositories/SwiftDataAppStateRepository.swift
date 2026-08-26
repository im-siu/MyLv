import Foundation
import SwiftData

final class SwiftDataAppStateRepository: AppStateRepository {
    private let context: ModelContext
    private let encoder: JSONEncoder
    private let decoder: JSONDecoder

    init(
        context: ModelContext,
        encoder: JSONEncoder = JSONEncoder(),
        decoder: JSONDecoder = JSONDecoder()
    ) {
        self.context = context
        self.encoder = encoder
        self.decoder = decoder
    }

    func load() throws -> AppState {
        guard let record = try fetchMainRecord() else {
            return .onboarding(selectedCharacter: nil)
        }

        return try decoder.decode(AppState.self, from: record.data)
    }

    func save(_ state: AppState) throws {
        let data = try encoder.encode(state)

        if let record = try fetchMainRecord() {
            record.data = data
        } else {
            let record = AppStateRecord(data: data)
            context.insert(record)
        }

        try saveIfNeeded()
    }

    func reset() throws {
        let records = try context.fetch(FetchDescriptor<AppStateRecord>())

        for record in records {
            context.delete(record)
        }

        try saveIfNeeded()
    }

    private func fetchMainRecord() throws -> AppStateRecord? {
        let mainID = AppStateRecord.mainID
        var descriptor = FetchDescriptor<AppStateRecord>(
            predicate: #Predicate { record in
                record.id == mainID
            }
        )
        descriptor.fetchLimit = 1

        return try context.fetch(descriptor).first
    }

    private func saveIfNeeded() throws {
        if context.hasChanges {
            try context.save()
        }
    }
}
