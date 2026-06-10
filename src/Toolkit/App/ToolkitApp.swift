import Explorer
import SwiftUI

@main
struct ToolkitApp: App {
    init() {}

    var body: some Scene {
        WindowGroup("Toolkit") {
            Text(String(HelloWorld()))
        }
    }
}
