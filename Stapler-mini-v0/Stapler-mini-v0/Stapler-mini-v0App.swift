

import SwiftUI
import SwiftData

@main
struct Stapler_mini_v0_App: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    init() {
        NSWindow.allowsAutomaticWindowTabbing = false
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onReceive(NotificationCenter.default.publisher(for: NSApplication.didFinishLaunchingNotification)) { _ in
                    Task { @MainActor in
                        guard let modelContainer = try? await prepareModelContainer() else { return }
                        appDelegate.modelContainer = modelContainer
                    }
                }
        }
        .modelContainer(for: [Preset.self], isUndoEnabled: true)
        .commands {
            CommandGroup(replacing: .newItem) {} //File>NewWindow
            // Editメニューのカスタマイズ
            CommandGroup(replacing: .pasteboard) {} // Edit>Copy Paste...
//            CommandGroup(replacing: .textEditing) {} // Edit>AutoFill,Start Dictation, Emoji & Symbolsがわからないが、必要なさそうだから消したい。


            CommandGroup(replacing: .help) {
                Button("アプリの使い方") {
                    // ヘルプを表示するアクション
                    NSWorkspace.shared.open(URL(string: "https://note.com/9dpb/n/n471a998bdef8")!)
                }
                Button("Discordコミュニティで質問する") {
                    // ヘルプを表示するアクション
                    NSWorkspace.shared.open(URL(string: "https://discord.gg/yVhZfsE2zS")!)
                }
            }
        }
    }
    
    @MainActor
    private func prepareModelContainer() async throws -> ModelContainer {
        let schema = Schema([Preset.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        return try ModelContainer(for: schema, configurations: [modelConfiguration])
    }
}
