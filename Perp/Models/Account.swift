import Foundation

struct Account: Codable {
    let accountValue: Float?
    let freeCollatral: Float?
    var address: String?
    
    init(accountValue: Float? = 0, freeCollatral: Float? = 0, address: String? = "") {
        self.accountValue = accountValue
        self.freeCollatral = freeCollatral
        self.address = address
    }
}
