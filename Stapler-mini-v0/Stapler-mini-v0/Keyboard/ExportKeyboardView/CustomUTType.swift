///.staplerファイルの定義とロードとエンコードの処理
///

import Foundation
import UniformTypeIdentifiers
import SwiftUI

extension UTType {
    public static let stapler = UTType(exportedAs: "com.example.stapler")
}

func exportPreset(_ preset: Preset) {
    let savePanel = NSSavePanel()
    savePanel.allowedContentTypes = [.stapler] // カスタムUTType
    savePanel.nameFieldStringValue = "\(preset.presetName).stapler"
    savePanel.begin { response in
        if response == .OK, let url = savePanel.url {
            do {
                let jsonData = try JSONEncoder().encode(preset) // PresetをJSONにエンコード
                try jsonData.write(to: url) // ファイルに書き込み
                print("Preset saved to \(url)")
                NSWorkspace.shared.activateFileViewerSelecting([url])
            } catch {
                print("Failed to save preset: \(error)")
            }
        }
    }
}

func loadPreset(completion: @escaping (Preset?) -> Void) {
    let openPanel = NSOpenPanel()
//    openPanel.allowedContentTypes = [.stapler]//ここうまく動かない。下のパターンでもだめ。何が原因か探る必要あり。
//    openPanel.allowedFileTypes = ["stapeler"]
    openPanel.begin { response in
        if response == .OK, let url = openPanel.url {
            do {
                let jsonData = try Data(contentsOf: url)
                let loadedPreset = try JSONDecoder().decode(Preset.self, from: jsonData)
                print("Preset loaded: \(loadedPreset)")
                completion(loadedPreset) // 成功時にPresetを返す
            } catch {
                print("Failed to load preset: \(error)")
                completion(nil) // エラー時にはnilを返す
            }
        } else {
            completion(nil) // キャンセルされた場合
        }
    }
}

