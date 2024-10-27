//Navigation用のラベルビュー。テキストをクリックしたり、右クリしたりしてリネーム、デリートが行えるような感じ。
import SwiftUI

struct PresetLabelView: View {
    let preset: Preset
    @Binding var isEditing: Bool
    @Binding var selectedPresetID: UUID?
    @FocusState.Binding var isFocused: Bool
    
    var onDelete: () -> Void
    
    var body: some View {
        if isEditing && selectedPresetID == preset.id {
            // 1. テキスト編集中のラベル
            HStack {
                TextField("Preset Name",
                          text: Binding(
                            get: { preset.presetName },
                            set: { newName in
                                preset.presetName = newName
                            })
                )
                .background(.clear)
                .focused($isFocused)
                .onAppear {
                    isFocused = true
                }
                .onSubmit {
                    isEditing = false
                }
            }
        } else if selectedPresetID == preset.id {
            // 2. 選択中の要素のラベル
            ZStack {
                HStack {
                    Text(preset.presetName)
                        .onTapGesture(count: 1) {//テキストをクリックすると編集状態に移行する。
                            isEditing = true
//                            print("isEditing is true now!")
                        }
                        .contextMenu {
                            Button("Rename") {
                                isEditing = true
                            }
                            Button("Delete", role: .destructive) {
                                onDelete()
                            }.keyboardShortcut(.delete, modifiers: .command)
                        }
                    Spacer()
                }
                HStack(alignment: .bottom) {
                    Spacer()
                    Text("\(preset.keyboardLayout)")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }
            }
        } else {
            // 3. 選択されていないラベル
            ZStack {
                HStack {
                    Text(preset.presetName)
                    Spacer()
                }
                HStack(alignment: .bottom) {
                    Spacer()
                    Text("\(preset.keyboardLayout)")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }
            }
        }
            
        
    }
}
