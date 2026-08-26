import Foundation
import SwiftData

@Model
final class AppStateRecord {
    static let mainID = "main"

    var id: String
    var data: Data

    init(id: String = AppStateRecord.mainID, data: Data) {
        self.id = id
        self.data = data
    }
}
