import Foundation

public struct Page {
    
    public var number: Int
    public let items: Int
    
    public init(number: Int, 
                items: Int = 20) {
        self.number = number
        self.items = items
    }
    
}
