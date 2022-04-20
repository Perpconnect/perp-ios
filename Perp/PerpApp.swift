import SwiftUI
import SDWebImage
import SDWebImageSVGCoder

@main
struct PerpApp: App {
    
    init() {
        SDImageCodersManager.shared.addCoder(SDImageSVGCoder.shared)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Session())
                .preferredColorScheme(.dark)
        }
    }
}
