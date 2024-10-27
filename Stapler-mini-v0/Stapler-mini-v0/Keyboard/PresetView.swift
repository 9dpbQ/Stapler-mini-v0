///PresetView：Presetを引数にとるビュー。
///KeyboardView：Presetのレイアウトで分岐してそれぞれのレイアウトを表示する
///CustomizeKeytab View：ドラッグ元のビュー。


import SwiftUI

//class FocusManager: ObservableObject {
//    @FocusState var isNameFocused: Bool = false//これでもダメだった。どうやってみんなフォーカスステート管理してるん？
//    @Published var isVendorFocused: Bool = false
//    @Published var isProductFocused: Bool = false
//    @Published var isSearchFocused: Bool = false
//    
//    func escapeAllFocus() {
//        isNameFocused = false
//        isVendorFocused = false
//        isProductFocused = false
//        isSearchFocused = false
//    }
//}


struct PresetView: View {
    @Binding var preset: Preset
    @Binding var selectedKeyboardKey: KeyboardKey
    @FocusState var nameFocus: Bool
    @FocusState var vendorFocus: Bool
    @FocusState var productFocus: Bool
//    @State var searchFieldFocus: Bool
    
    @State var pickerIndex: Int = 0

    var body: some View {
        ZStack {
            Color.clear
                .contentShape(Rectangle())
                .frame(maxWidth: .infinity, maxHeight: .infinity) // 画面全体をカバー
                .onTapGesture {
                    escape()
                }
            VStack {
                presetDetailView.padding()
                KeyboardView(preset: $preset, selectedKeyboardKey: $selectedKeyboardKey)
                CustomizeKeyTabView(/*externalSearchFieldFocuse: $searchFieldFocus*/)
            }
            
        }
        .onAppear {
            escape()
        }
        
    }
    private var presetDetailView: some View {
        VStack {
            HStack {//プリセット名、ベンダーID、ANSIかJISかなどをここに
                Spacer()
                TextField("Preset Name", text: $preset.presetName)
                    .focused($nameFocus)
                    .onSubmit {
                        nameFocus = false
                    }
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 300)
                Text("VendorID:")
                TextField("Vendor ID", text: $preset.vendorID)
                    .focused($vendorFocus)
                    .onSubmit {
                        vendorFocus = false
                    }
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 100)
                Text("ProductID:")
                TextField("Product ID", text: $preset.productID)
                    .focused($productFocus)
                    .onSubmit {
                        productFocus = false
                    }
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 100)
                Picker("", selection: $preset.keyCodeRegion) {
                    Text("ANSI").tag(KeyCodeRegion.ansi)
                    Text("JIS").tag(KeyCodeRegion.jis)
                    Text("ISO").tag(KeyCodeRegion.iso)
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 200)
                Spacer()
            }
        }
    }
    private func escape() {
        selectedKeyboardKey = .initial
        nameFocus = false
        vendorFocus = false
        productFocus = false
//        searchFieldFocus = false
    }
}


class LayerColorManager: ObservableObject {
    @Published var currentLayerColor: LayerColor = .layer0
}

struct KeyboardView: View {
    @Binding var preset: Preset
    @Binding var selectedKeyboardKey: KeyboardKey
    @State private var selectedLayer = 0
    
    @State private var selectedLayerColor: LayerColor = .layer0
    private let keySize: CGFloat = 65
    var body: some View {
        VStack {
            HStack {
                Spacer()
                ForEach(0..<9) { index in
                    Button(action: {
                        selectedLayer = index
                        selectedLayerColor = colorForTab(index: selectedLayer)

                    }) {
                        if index == 0 {
                            Text("Default")
                                .bold()
                                .frame(width: 80, height: 25)
                        } else {
                            Text("Layer \(index)")
                                .frame(width: 80, height: 25)
                        }
                    }
                    .buttonStyle(ParallelogramButtonStyle(isSelected: selectedLayer == index, tabIndex: index))
                    .padding(.horizontal, 5)
                    
                }
                
                Spacer()

            }
            .padding(.horizontal)
            
            VStack{
                switch preset.keyboardLayout {
                case .US:
                    // レイヤーによって表示されるキーボードレイアウトを切り替える
                    switch selectedLayer {
                    case 0:
                        BuiltInKeyboardLayerView_US(selectedKeyboardKey: $selectedKeyboardKey, keySize: keySize, layer: preset.layer0)
                    case 1:
                        BuiltInKeyboardLayerView_US(selectedKeyboardKey: $selectedKeyboardKey, keySize: keySize, layer: preset.layer1)
                    case 2:
                        BuiltInKeyboardLayerView_US(selectedKeyboardKey: $selectedKeyboardKey, keySize: keySize, layer: preset.layer2)
                    case 3:
                        BuiltInKeyboardLayerView_US(selectedKeyboardKey: $selectedKeyboardKey, keySize: keySize, layer: preset.layer3)
                    case 4:
                        BuiltInKeyboardLayerView_US(selectedKeyboardKey: $selectedKeyboardKey, keySize: keySize, layer: preset.layer4)
                    case 5:
                        BuiltInKeyboardLayerView_US(selectedKeyboardKey: $selectedKeyboardKey, keySize: keySize, layer: preset.layer5)
                    case 6:
                        BuiltInKeyboardLayerView_US(selectedKeyboardKey: $selectedKeyboardKey, keySize: keySize, layer: preset.layer6)
                    case 7:
                        BuiltInKeyboardLayerView_US(selectedKeyboardKey: $selectedKeyboardKey, keySize: keySize, layer: preset.layer7)
                    case 8:
                        BuiltInKeyboardLayerView_US(selectedKeyboardKey: $selectedKeyboardKey, keySize: keySize, layer: preset.layer8)

                    default:
                        EmptyView()
                    }
                case .UK:
                    switch selectedLayer {
                    case 0:
                        BuiltInKeyboardLayerView_UK(selectedKeyboardKey: $selectedKeyboardKey, keySize: keySize, layer: preset.layer0)
                    case 1:
                        BuiltInKeyboardLayerView_UK(selectedKeyboardKey: $selectedKeyboardKey, keySize: keySize, layer: preset.layer1)
                    case 2:
                        BuiltInKeyboardLayerView_UK(selectedKeyboardKey: $selectedKeyboardKey, keySize: keySize, layer: preset.layer2)
                    case 3:
                        BuiltInKeyboardLayerView_UK(selectedKeyboardKey: $selectedKeyboardKey, keySize: keySize, layer: preset.layer3)
                    case 4:
                        BuiltInKeyboardLayerView_UK(selectedKeyboardKey: $selectedKeyboardKey, keySize: keySize, layer: preset.layer4)
                    case 5:
                        BuiltInKeyboardLayerView_UK(selectedKeyboardKey: $selectedKeyboardKey, keySize: keySize, layer: preset.layer5)
                    case 6:
                        BuiltInKeyboardLayerView_UK(selectedKeyboardKey: $selectedKeyboardKey, keySize: keySize, layer: preset.layer6)
                    case 7:
                        BuiltInKeyboardLayerView_UK(selectedKeyboardKey: $selectedKeyboardKey, keySize: keySize, layer: preset.layer7)
                    case 8:
                        BuiltInKeyboardLayerView_UK(selectedKeyboardKey: $selectedKeyboardKey, keySize: keySize, layer: preset.layer8)

                    default:
                        EmptyView()
                    }
                case .JIS:
                    switch selectedLayer {
                    case 0:
                        BuiltInKeyboardLayerView_JIS(selectedKeyboardKey: $selectedKeyboardKey, keySize: keySize, layer: preset.layer0)
                    case 1:
                        BuiltInKeyboardLayerView_JIS(selectedKeyboardKey: $selectedKeyboardKey, keySize: keySize, layer: preset.layer1)
                    case 2:
                        BuiltInKeyboardLayerView_JIS(selectedKeyboardKey: $selectedKeyboardKey, keySize: keySize, layer: preset.layer2)
                    case 3:
                        BuiltInKeyboardLayerView_JIS(selectedKeyboardKey: $selectedKeyboardKey, keySize: keySize, layer: preset.layer3)
                    case 4:
                        BuiltInKeyboardLayerView_JIS(selectedKeyboardKey: $selectedKeyboardKey, keySize: keySize, layer: preset.layer4)
                    case 5:
                        BuiltInKeyboardLayerView_JIS(selectedKeyboardKey: $selectedKeyboardKey, keySize: keySize, layer: preset.layer5)
                    case 6:
                        BuiltInKeyboardLayerView_JIS(selectedKeyboardKey: $selectedKeyboardKey, keySize: keySize, layer: preset.layer6)
                    case 7:
                        BuiltInKeyboardLayerView_JIS(selectedKeyboardKey: $selectedKeyboardKey, keySize: keySize, layer: preset.layer7)
                    case 8:
                        BuiltInKeyboardLayerView_JIS(selectedKeyboardKey: $selectedKeyboardKey, keySize: keySize, layer: preset.layer8)
                    default:
                        EmptyView()
                    }
                }
            }
            .padding(keySize * 0.035)
            .background(.gray.opacity(0.5))
            .cornerRadius(keySize * 0.14 + keySize * 0.035)
            .padding()
            
        }
    }
    // タブのインデックスに応じたレイヤーの色を取得
        private func colorForTab(index: Int) -> LayerColor {
            switch index {
            case 1:
                return .layer1
            case 2:
                return .layer2
            case 3:
                return .layer3
            case 4:
                return .layer4
            case 5:
                return .layer5
            case 6:
                return .layer6
            case 7:
                return .layer7
            case 8:
                return .layer8
            default:
                return .layer0
            }
        }
}

struct ParallelogramShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let skewAmount: CGFloat = rect.maxX * 0.15
        
        path.move(to: CGPoint(x: skewAmount, y: rect.minY))//左上から時計まわりに
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - skewAmount, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: skewAmount, y: rect.minY))
        
        return path
    }
}
struct ParallelogramButtonStyle: ButtonStyle {
    let isSelected: Bool
    let tabIndex: Int
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .background(
                ParallelogramShape()
                    .fill(backgroundColor(isSelected: isSelected,
                                         tabIndex: tabIndex,
                                         isPressed: configuration.isPressed))
            )
            .scaleEffect(configuration.isPressed ? 0.90 : 1.0)
//            .animation(.bouncy, value: configuration.isPressed)
    }
    
    // 背景色を決定する関数
    private func backgroundColor(isSelected: Bool, tabIndex: Int, isPressed: Bool) -> Color {
        if isSelected {
            if tabIndex == 0 {
                return .black
            } else {
                return LayerColor.fromIndex(tabIndex).buttonAndHighLightColor
            }
        } else {
            return isPressed ? Color(red: 80/255, green: 80/255, blue: 88/255/*, opacity: 0.4*/) : Color(red: 96/255, green: 96/255, blue: 104/255)
        }
    }
}

enum LayerColor {
    case layer0
    case layer1
    case layer2
    case layer3
    case layer4
    case layer5
    case layer6
    case layer7
    case layer8
    
    var buttonAndHighLightColor: Color {
        switch self {
        case .layer0:
            return .primary
        case .layer1:
            return .orange
        case .layer2:
            return .green
        case .layer3:
            return .purple
        case .layer4:
            return .blue
        case.layer5:
            return .yellow
        case .layer6:
            return .red
        case.layer7:
            return .cyan
        case .layer8:
            return .indigo
            
        }
    }
    var textColor: Color {
        switch self {
        case .layer0:
            return .white
        case .layer1:
            return .orange
        case .layer2:
            return .green
        case .layer3:
            return .purple
        case .layer4:
            return .blue
        case.layer5:
            return .yellow
        case .layer6:
            return .red
        case.layer7:
            return .cyan
        case .layer8:
            return .indigo
        }
    }
    var textColor_export: Color {
        switch self {
        case .layer0:
            return .gray
        case .layer1:
            return .orange
        case .layer2:
            return .green
        case .layer3:
            return .purple
        case .layer4:
            return .blue
        case.layer5:
            return .yellow
        case .layer6:
            return .red
        case.layer7:
            return .cyan
        case .layer8:
            return .indigo
        }
    }
    var customizeKeyBackGroundColor: Color {
        switch self {
        case .layer0:
            return .black
        case .layer1:
            return .orange
        case .layer2:
            return .green
        case .layer3:
            return .purple
        case .layer4:
            return .blue
        case.layer5:
            return .yellow
        case .layer6:
            return .red
        case.layer7:
            return .cyan
        case .layer8:
            return .indigo
        }
    }
    
    static func fromIndex(_ index: Int) -> LayerColor {
        switch index {
        case 1:
            return .layer1
        case 2:
            return .layer2
        case 3:
            return .layer3
        case 4:
            return .layer4
        case 5:
            return .layer5
        case 6:
            return .layer6
        case 7:
            return .layer7
        case 8:
            return .layer8
        default:
            return .layer0
        }
    }
}
//#Preview {
//    KeyboardView()
//}
