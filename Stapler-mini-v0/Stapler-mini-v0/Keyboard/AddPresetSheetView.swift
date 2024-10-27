///プリセットを追加する時のビュー。
///US/UK/JISから選択するか.staplerファイルをインポートする感じ。
///
///現在は本体キーボードしかないけれど、今後はKeyboardViewに柔軟性を持たせて自分の持っているキーボードを再現できるようにしていきたい。
///そのためにはちょっとクラスの書き換えが必要かなぁ？
///

import SwiftUI
// カスタムボタンスタイル
struct CustomShapeButtonStyle_Gradient<S: Shape>: ButtonStyle {
    let shape: S
    let fillColor: LinearGradient
    let frameSize: CGSize
    
    func makeBody(configuration: Configuration) -> some View {
        shape
            .fill(fillColor)
            .frame(width: frameSize.width, height: frameSize.height)
            .overlay(
                configuration.label
            )
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)  // 押した時のスケールエフェクト
//            .animation(.bouncy, value: configuration.isPressed)
    }
}

struct AddPresetSheetView: View {
    @Binding var selectedKeyboardType: KeyboardLayout?
    @Binding var isSheetPresented: Bool

    let onDecision: (KeyboardLayout?) -> Void
    let importPreset: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Text("Select Keyboard Layout")
                    .font(.headline)
                    .padding()
                Button {
                    isSheetPresented = false
                    importPreset()
                } label: {
                    Label("import Preset", systemImage: "square.and.arrow.down")
                }
            }
            VStack {
                Text("MacBook Built-in Keyboard")
                    .font(.caption)
                HStack {
                    // US キーボード
                    Button(action: {
                        selectedKeyboardType = .US
                    }) {
                        Text("US")
                            .foregroundColor(selectedKeyboardType == .US ? .accentColor : .white)
                            .font(.system(size: 20))
                    }
                    .buttonStyle(
                        CustomShapeButtonStyle_Gradient(
                            shape: RoundedRectangle(cornerRadius: 65 * 0.07),
                            fillColor: LinearGradient(colors: [.black], startPoint: .bottom, endPoint: .top),
                            frameSize: CGSize(width: 65 * 1.75 - 65 * 0.07, height: 65 - 65 * 0.07)
                        )
                    )
                    .padding(7)
                    // JIS キーボード
                    Button(action: {
                        selectedKeyboardType = .JIS
                    }) {
                        Text("JIS")
                            .foregroundColor(selectedKeyboardType == .JIS ? .accentColor : .white)
                            .font(.system(size: 20))
                    }
                    .buttonStyle(
                        CustomShapeButtonStyle_Gradient(
                            shape: EnterShape_JIS(frameValue: 65),
                            fillColor: LinearGradient(colors: [.black], startPoint: .bottom, endPoint: .top),
                            frameSize: CGSize(width: 65*1.5, height: 65*2)
                        )
                    )
                    
                    // UK キーボード
                    Button(action: {
                        selectedKeyboardType = .UK
                    }) {
                        Text("UK")
                            .foregroundColor(selectedKeyboardType == .UK ? .accentColor : .white)
                            .font(.system(size: 20))
                            .padding(.leading, 10)
                    }
                    .buttonStyle(
                        CustomShapeButtonStyle_Gradient(
                            shape: EnterShape_UK(frameValue: 65),
                            fillColor: LinearGradient(colors: [.black], startPoint: .bottom, endPoint: .top),
                            frameSize: CGSize(width: 65, height: 65*2)
                        )
                    )
                }
            }
            // 決定・キャンセルボタン
            HStack {
                Button("Cancel") {
                    isSheetPresented = false
                }
                .padding()

                Button("Create a Preset") {
                    onDecision(selectedKeyboardType)
                    isSheetPresented = false
                }
                .disabled(selectedKeyboardType == nil)
                .padding()
            }
        }
        .padding()
        .onAppear {
            selectedKeyboardType = nil
        }
    }
}
