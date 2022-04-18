import Foundation

struct Market: Codable, Identifiable {
    var id: UUID
    let name: String
    var price: Double
    let percentChange24H: Double
    
    init(
        id: UUID = UUID(),
        name: String,
        price: Double? = 0.0,
        percentChange24H: Double? = 0.0
    ) {
        self.id = id
        self.name = name
        self.price = price ?? 0.0
        self.percentChange24H = percentChange24H ?? 0.0
    }
    
    func updatePrice(price: Double) -> Market {
        return Market(
            id: self.id,
            name: self.name,
            price: price,
            percentChange24H: self.percentChange24H
        )
    }
    
    func updatePercent(percentChange24H: Double) -> Market {
        return Market(
            id: self.id,
            name: self.name,
            price: self.price,
            percentChange24H: percentChange24H
        )
    }
    
}
