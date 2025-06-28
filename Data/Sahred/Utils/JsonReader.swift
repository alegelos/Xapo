import Foundation

final public class JSonReader {
    
    public func localJSon(_ fileName: String) throws -> Data {
        guard let url = Bundle(for: type(of: self)).url(forResource: fileName,
                                                        withExtension: "json") else {
            throw Errors.fileNameNotFound
        }

        return try Data(contentsOf: url)
    }
    
}

// MARK: - Helping Structures

extension JSonReader {
    
    public enum Errors: Error {
        case fileNameNotFound
    }
    
}
