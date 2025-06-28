import Foundation
import Domain

extension DateOptions {
    
    func stringDate() throws -> String {
        let calendar = Calendar.current
        guard let lastWeek = calendar.date(byAdding: .day,
                                           value: days,
                                           to: Date()) else {
            //TODO: log error
            throw Errors.nilData
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return dateFormatter.string(from: lastWeek)
    }
    
}

// MARK: - Private

extension DateOptions {
    
    private var days: Int {
        switch self {
        case .lastWeek:
            return -7
        }
    }
    
}

// MARK: - Helping Structures

extension DateOptions {
    
    enum Errors: Error {
        case nilData
    }
    
}
