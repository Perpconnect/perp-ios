import Foundation

extension String {
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
    var ethAddressWithDot: String {
        return "\(self.prefix(5))  · · · ·  \(self.suffix(5))"
    }
    
}
