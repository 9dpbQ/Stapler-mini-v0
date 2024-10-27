///ウィンドウを閉じたらアプリが終了したり、そういうバックグラウンド処理のクラス。
///使い方が合ってるかよくわからない
import Foundation
import Cocoa
import SwiftData
import UniformTypeIdentifiers

class AppDelegate: NSObject, NSApplicationDelegate {
    @MainActor
    var modelContainer: ModelContainer?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // SwiftData のモデルコンテナは @main struct で設定されるため、ここでは不要
    }

    ///以下🦑アイコンへ.staplerファイルをドロップした時の処理をAIとやってみたけど、全く動かない。
    ///ドキュメントタイプのファイルアイコンを設定しても反映されてなかったり、Allowed
    /// ContentTypeで.staplerをフィルターにかけれなかったり、そもそもUTTypeの定義に何かしら足りないものがあるからなのかも？
    /// それかそもそもこの方法がとんちんかんなのかも
    func application(_ sender: NSApplication, openFile filename: String) -> Bool {
        let url = URL(fileURLWithPath: filename)
        if UTType(filenameExtension: url.pathExtension) == .stapler {
            loadPreset(from: url) { preset in
                if let preset = preset {
                    Task { @MainActor in
                        await self.addPresetToContext(preset)
                    }
                    print("Loaded and added preset from dock: \(preset.presetName)")
                } else {
                    print("Failed to load preset from dock")
                }
            }
            return true
        }
        return false
    }

    func application(_ application: NSApplication, open urls: [URL]) {
        for url in urls where UTType(filenameExtension: url.pathExtension) == .stapler {
            loadPreset(from: url) { preset in
                if let preset = preset {
                    Task { @MainActor in
                        await self.addPresetToContext(preset)
                    }
                    print("Loaded and added preset from dock: \(preset.presetName)")
                } else {
                    print("Failed to load preset from dock")
                }
            }
        }
    }

    private func loadPreset(from url: URL, completion: @escaping (Preset?) -> Void) {
        do {
            let jsonData = try Data(contentsOf: url)
            let loadedPreset = try JSONDecoder().decode(Preset.self, from: jsonData)
            completion(loadedPreset)
        } catch {
            print("Failed to load preset: \(error)")
            completion(nil)
        }
    }

    @MainActor
    private func addPresetToContext(_ preset: Preset) async {
        guard let modelContext = modelContainer?.mainContext else { return }
        modelContext.insert(preset)
        do {
            try modelContext.save()
        } catch {
            print("Failed to save context after adding preset: \(error)")
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // アプリケーション終了時の処理
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {//ウィンドウを閉じたらアプリが終了するような処理
        NSApplication.shared.terminate(self)
        return true
    }
}


