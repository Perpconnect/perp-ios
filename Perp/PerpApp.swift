import SwiftUI
import SDWebImage
import SDWebImageSVGCoder

@main
struct PerpApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Session())
                .onAppear {
                    SDImageCodersManager.shared.addCoder(SDImageSVGCoder.shared)
                }
        }
    }
}
