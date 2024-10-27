///右側サイドバー(Inspector)の
///選択したKeyboardKeyの詳細な情報を表示するビュー
///
import SwiftUI

struct SelectedDetailView: View {
    
    @Binding var selectedKeyboardKey: KeyboardKey
    let selectedPreset: Preset?
    @FocusState private var isFocused_customJSON: Bool
    @FocusState private var isFocused_tapDisplaySymbol: Bool
    @FocusState private var isFocused_holdDisplaySymbol: Bool
    
    private var highLightColor_tap: Color { //レイヤー移動のキーが入ってる時の色
        LayerColor.fromIndex(selectedKeyboardKey.layerKeyNumber_tap).buttonAndHighLightColor
    }
    private var highLightColor_hold: Color { //レイヤー移動のキーが入ってる時の色
        LayerColor.fromIndex(selectedKeyboardKey.layerKeyNumber_hold).buttonAndHighLightColor
    }
    private var textColor: Color { //レイヤーに応じて色を変化
        LayerColor.fromIndex(selectedKeyboardKey.layerNumber).textColor
    }
    var body: some View {
        ZStack {
            Color.clear
                .contentShape(Rectangle())
                .frame(maxWidth: .infinity, maxHeight: .infinity) // 画面全体をカバー
                .onTapGesture {
                    isFocused_customJSON = false
                    isFocused_tapDisplaySymbol = false
                    isFocused_holdDisplaySymbol = false
                }
            if selectedKeyboardKey.isInitial {
                initialKeyboardKeyView
            } else {
                VStack {
                    if !selectedKeyboardKey.isTapHoldEnabled {
                        tapView
                    } else {
                        tapHoldView
                    }
                    Toggle(isOn: $selectedKeyboardKey.userCustomJSONEnabled) {Text("User Custom JSON")}
//                        .help("When the toggle is on, a JSON is generated including the text from the text field, ignoring other states.")
                        .toggleStyle(.switch)
                        .onChange(of: selectedKeyboardKey.userCustomJSONEnabled, initial: false) {oldValue, newValue in
                            if newValue {//トグルがオンになった時、KeyboardKeyひとつ分のJSONを返すようにする
                                let exporter = JSONExporter()
                                do {
                                    if let jsonContent = try exporter.exportKeyboardKey_userCustomJSON(
                                        selectedKeyboardKey,
                                        keyCodeRegion: selectedPreset?.keyCodeRegion ?? .ansi,
                                        vendorID: selectedPreset?.vendorID ?? "1452",
                                        productID: selectedPreset?.productID ?? "635"
                                    ) {
                                        selectedKeyboardKey.userCustomJSONContent = jsonContent
                                    } else {
                                        // JSONが生成されなかった場合（例：カスタマイズされていない場合）
                                        selectedKeyboardKey.userCustomJSONContent = "There is no customization."
                                    }
                                } catch {
                                    // エラーが発生した場合の処理
                                    print("Error generating JSON: \(error)")
                                    selectedKeyboardKey.userCustomJSONContent = "Error: Unable to generate JSON"
                                    
                                    // オプション：ユーザーにエラーを通知
                                    // showErrorAlert(message: "Failed to generate JSON. Please try again.")
                                }
                            }
                            if !newValue {//トグルがオフになった時
                                
                                isFocused_customJSON = false
                            }
                        }
                    TextEditor(text: $selectedKeyboardKey.userCustomJSONContent)
                        .disabled(!selectedKeyboardKey.userCustomJSONEnabled)
                        .focused($isFocused_customJSON)
                        .foregroundColor(selectedKeyboardKey.userCustomJSONEnabled ? .primary : .gray)
                }
                .padding()
            }
        }
        
    }
    private var initialKeyboardKeyView: some View {
        VStack {
            Text("Select any key on the keyboard view.")
                .font(.headline)
                .foregroundColor(.secondary)
                .padding()
        }
    }
    private func modifierFontSize_tap() -> CGFloat {
        var activeModifierCount = 0
        if selectedKeyboardKey.tapWithShift { activeModifierCount += 1 }
        if selectedKeyboardKey.tapWithControl { activeModifierCount += 1 }
        if selectedKeyboardKey.tapWithCommand { activeModifierCount += 1 }
        if selectedKeyboardKey.tapWithOption { activeModifierCount += 1 }
        if selectedKeyboardKey.tapWithFn { activeModifierCount += 1 }
        
        switch activeModifierCount {
        case 0:
            return 15
        case 1:
            return 15
        case 2:
            return 10
        default:
            return 6
        }
        
    }
    private func modifierFontSize_hold() -> CGFloat {
        var activeModifierCount = 0
        if selectedKeyboardKey.holdWithShift { activeModifierCount += 1 }
        if selectedKeyboardKey.holdWithControl { activeModifierCount += 1 }
        if selectedKeyboardKey.holdWithCommand { activeModifierCount += 1 }
        if selectedKeyboardKey.holdWithOption { activeModifierCount += 1 }
        if selectedKeyboardKey.holdWithFn { activeModifierCount += 1 }
        
        switch activeModifierCount {
        case 0:
            return 15
        case 1:
            return 15
        case 2:
            return 10
        default:
            return 6
        }
        
    }
    private var modifierContent_tap: some View {
        VStack(spacing: 0) {
            if selectedKeyboardKey.tapWithModifier {
                Spacer()
                HStack(spacing: 0) {
                    if selectedKeyboardKey.tapWithShift {
                        Image(systemName: "shift")
                    }
                    if selectedKeyboardKey.tapWithControl {
                        Image(systemName: "control")
                    }
                }
                HStack(spacing: 0) {
                    if selectedKeyboardKey.tapWithCommand {
                        Image(systemName: "command")
                    }
                    if selectedKeyboardKey.tapWithOption {
                        Image(systemName: "option")
                    }
                }
                if selectedKeyboardKey.tapWithFn {
                    Image(systemName: "globe")
                }
                Spacer()
            } else {
                EmptyView()
            }
        }
        .font(.system(size: modifierFontSize_tap()))
    }
    private var modifierContent_hold: some View {
        VStack(spacing: 0) {
            if selectedKeyboardKey.holdWithModifier {
                Spacer()
                HStack(spacing: 0) {
                    if selectedKeyboardKey.holdWithShift {
                        Image(systemName: "shift")
                    }
                    if selectedKeyboardKey.holdWithControl {
                        Image(systemName: "control")
                    }
                }
                HStack(spacing: 0) {
                    if selectedKeyboardKey.holdWithCommand {
                        Image(systemName: "command")
                    }
                    if selectedKeyboardKey.holdWithOption {
                        Image(systemName: "option")
                    }
                }
                if selectedKeyboardKey.holdWithFn {
                    Image(systemName: "globe")
                }
                Spacer()
            } else {
                EmptyView()
            }
        }
        .font(.system(size: modifierFontSize_hold()))
    }

    private var tapView: some View {
        VStack {
            Text("Tap Key").font(.caption)
            if selectedKeyboardKey.afterKeyOutPut != ""  {
                HStack(spacing: 0) {
                    if selectedKeyboardKey.layerKeyNumber_tap > 0 {
//                        modifierContent_tap.foregroundStyle(highLightColor)
                        symbolOrText(selectedKeyboardKey.afterDisplaySymbol, isSymbol: selectedKeyboardKey.isAfterTapSFSymbol, size: 20, color: highLightColor_tap)
                    } else {
                        modifierContent_tap.foregroundStyle(textColor)
                        symbolOrText(selectedKeyboardKey.afterDisplaySymbol, isSymbol: selectedKeyboardKey.isAfterTapSFSymbol, size: 20, color: textColor)
                    }
                }
                .frame(width: 65, height: 65)
                .background(.black)
                .cornerRadius(65 * 0.07)
                .dropDestination(for: CustomizeKey.self) { items, location in
                    guard let item = items.first else { return false }
                    selectedKeyboardKey.applyTapKeyCustomization(from: item)
                    return true
                }
            } else {
                Text("Drop here")
                    .font(.caption)
                    .foregroundColor(.white)
                    .frame(width: 65, height: 65)
                    .background(.black)
                    .cornerRadius(65 * 0.07)
                    .dropDestination(for: CustomizeKey.self) { items, location in
                        guard let item = items.first else { return false }
                        selectedKeyboardKey.applyTapKeyCustomization(from: item)
                        return true
                    }
            }
            HStack {
                Spacer()
                Text("Enable Tap Hold")
                Spacer()
                Toggle(isOn: $selectedKeyboardKey.isTapHoldEnabled) {Text("")}.toggleStyle(.switch)
                Spacer()
            }
            
            Toggle(isOn: $selectedKeyboardKey.tapWithModifier) { Text("Tap with Modifier")}.toggleStyle(.button)
            HStack {
                Toggle("⇧",isOn: $selectedKeyboardKey.tapWithShift)
                    .toggleStyle(.button)
                    .disabled(!selectedKeyboardKey.tapWithModifier || selectedKeyboardKey.isTapIncludeShift)
                Toggle("^",isOn: $selectedKeyboardKey.tapWithControl)
                    .toggleStyle(.button)
                    .disabled(!selectedKeyboardKey.tapWithModifier || selectedKeyboardKey.isTapIncludeControl)
            }
            HStack {
                Toggle("⌘",isOn: $selectedKeyboardKey.tapWithCommand)
                    .toggleStyle(.button)
                    .disabled(!selectedKeyboardKey.tapWithModifier || selectedKeyboardKey.isTapIncludeCommand)
                Toggle("⌥",isOn: $selectedKeyboardKey.tapWithOption)
                    .toggleStyle(.button)
                    .disabled(!selectedKeyboardKey.tapWithModifier || selectedKeyboardKey.isTapIncludeOption)
            }
            Toggle("fn", isOn: $selectedKeyboardKey.tapWithFn)
                .toggleStyle(.button)
                .disabled(!selectedKeyboardKey.tapWithModifier || selectedKeyboardKey.isTapIncludeFn)
            
            Toggle("SFSymbol", isOn: $selectedKeyboardKey.isAfterTapSFSymbol)
                .toggleStyle(.checkbox)
            TextField(selectedKeyboardKey.isAfterTapSFSymbol ? "SymbolName:" : "DisplayName:", text: $selectedKeyboardKey.afterDisplaySymbol)
                .focused($isFocused_tapDisplaySymbol)
                .disabled(!selectedKeyboardKey.isCustomized)
            Text("keycode: \(selectedKeyboardKey.beforeKeyOutPut) → \(selectedKeyboardKey.afterKeyOutPut)")
                .font(.caption2)

        }
    }
    private var tapHoldView: some View {
        VStack {
            HStack {
                Spacer()
                VStack {
                    Text("Tap Key").font(.caption)
                    ZStack {
                        if selectedKeyboardKey.afterKeyOutPut != "" { //すでに何かしらドロップされたあとの表示
                            HStack {
                                if selectedKeyboardKey.layerKeyNumber_tap > 0 { //holdにレイヤー移動キーが入ってる場合の表示
//                                    modifierContent_tap.foregroundStyle(highLightColor)
                                    symbolOrText(selectedKeyboardKey.afterDisplaySymbol, isSymbol: selectedKeyboardKey.isAfterTapSFSymbol, size: 20, color: highLightColor_tap)
                                } else {
                                    modifierContent_tap.foregroundStyle(textColor)
                                    symbolOrText(selectedKeyboardKey.afterDisplaySymbol, isSymbol: selectedKeyboardKey.isAfterTapSFSymbol, size: 20, color: textColor)
                                }
                            }
                        } else { //まだドロップされていない状態の時の表示
                            Text("Drop here")
                                .font(.caption2)
                                .foregroundColor(.white)
                        }
                    }
                    .frame(width: 65, height: 65)
                    .background(.black)
                    .cornerRadius(65 * 0.07)
                    .dropDestination(for: CustomizeKey.self) { items, location in
                        guard let item = items.first else { return false }
                        selectedKeyboardKey.applyTapKeyCustomization(from: item)
                        return true
                    }
                }
                Spacer()
                VStack {
                    Text("Hold Key").font(.caption)
                    ZStack {
                        if selectedKeyboardKey.holdKeyOutPut != "" {
                            HStack(spacing: 0) {
                                if selectedKeyboardKey.layerKeyNumber_hold > 0 {
//                                    modifierContent_hold.foregroundStyle(highLightColor_hold)
                                    symbolOrText(selectedKeyboardKey.holdDisplaySymbol, isSymbol: selectedKeyboardKey.isAfterHoldSFSymbol, size: 20, color: highLightColor_hold)
                                } else {
                                    modifierContent_hold.foregroundStyle(textColor)
                                    symbolOrText(selectedKeyboardKey.holdDisplaySymbol, isSymbol: selectedKeyboardKey.isAfterHoldSFSymbol, size: 20, color: textColor)
                                }
                            }
                        } else {
                            Text("Drop here")
                                .font(.caption2)
                                .foregroundColor(.white)
                        }
                    }
                    .frame(width: 65, height: 65)
                    .background(.black)
                    .cornerRadius(65 * 0.07)
                    .dropDestination(for: CustomizeKey.self) { items, location in
                        guard let item = items.first else { return false }
                        selectedKeyboardKey.applyHoldKeyCustomization(from: item)
                        return true
                    }
                }
                Spacer()
            }
            HStack {
                Spacer()
                Text("Tap Hold")
                Spacer()
                Toggle(isOn: $selectedKeyboardKey.isTapHoldEnabled) {Text("")}.toggleStyle(.switch)
                Spacer()
            }
            Picker("", selection: $selectedKeyboardKey.tapHoldType) {
                ForEach(TapHoldType.allCases, id: \.self) { type in
                    Text(type.rawValue.capitalized).tag(type)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            VStack {
                Text("Tap Hold Threshold: \(Int(selectedKeyboardKey.tapHoldThreshold)) ms")
                Slider(value: $selectedKeyboardKey.tapHoldThreshold, in: 40...500, step: 20)
                    .disabled(selectedKeyboardKey.tapHoldType != .basic)
                    .onChange(of: selectedKeyboardKey.tapHoldThreshold) {oldValue, newValue in
                        // ハプティックフィードバックを発生させる
                        //レスポンスが終わってるけど、他のビューが重いから？コメントアウトしても良い気がするな
                        NSHapticFeedbackManager.defaultPerformer.perform(.alignment , performanceTime: .now)
                    }
                    .padding(.horizontal)
            }
            HStack {
                VStack {
                    Toggle("Tap with Modifier", isOn: $selectedKeyboardKey.tapWithModifier)
                        .toggleStyle(.button)
                    
                    //Tap
                    HStack {
                        Toggle("⇧",isOn: $selectedKeyboardKey.tapWithShift)
                            .toggleStyle(.button)
                            .disabled(!selectedKeyboardKey.tapWithModifier || selectedKeyboardKey.isTapIncludeShift)
                        Toggle("^",isOn: $selectedKeyboardKey.tapWithControl)
                            .toggleStyle(.button)
                            .disabled(!selectedKeyboardKey.tapWithModifier || selectedKeyboardKey.isTapIncludeControl)
                    }
                    HStack {
                        Toggle("⌘",isOn: $selectedKeyboardKey.tapWithCommand)
                            .toggleStyle(.button)
                            .disabled(!selectedKeyboardKey.tapWithModifier || selectedKeyboardKey.isTapIncludeCommand)
                        Toggle("⌥",isOn: $selectedKeyboardKey.tapWithOption)
                            .toggleStyle(.button)
                            .disabled(!selectedKeyboardKey.tapWithModifier || selectedKeyboardKey.isTapIncludeOption)
                    }
                    Toggle("fn", isOn: $selectedKeyboardKey.tapWithFn)
                        .toggleStyle(.button)
                        .disabled(!selectedKeyboardKey.tapWithModifier || selectedKeyboardKey.isTapIncludeFn)
                }
                Divider().frame(height: 100)
                VStack {
                    Toggle("Hold with Modifier", isOn: $selectedKeyboardKey.holdWithModifier)
                        .toggleStyle(.button)
                    
                    //Hold
                    HStack {
                        Toggle("⇧",isOn: $selectedKeyboardKey.holdWithShift)
                            .toggleStyle(.button)
                            .disabled(!selectedKeyboardKey.holdWithModifier || selectedKeyboardKey.isHoldIncludeShift)
                        Toggle("^",isOn: $selectedKeyboardKey.holdWithControl)
                            .toggleStyle(.button)
                            .disabled(!selectedKeyboardKey.holdWithModifier || selectedKeyboardKey.isHoldIncludeControl)
                    }
                    HStack {
                        Toggle("⌘",isOn: $selectedKeyboardKey.holdWithCommand)
                            .toggleStyle(.button)
                            .disabled(!selectedKeyboardKey.holdWithModifier || selectedKeyboardKey.isHoldIncludeCommand)
                        Toggle("⌥",isOn: $selectedKeyboardKey.holdWithOption)
                            .toggleStyle(.button)
                            .disabled(!selectedKeyboardKey.holdWithModifier || selectedKeyboardKey.isHoldIncludeOption)
                    }
                    Toggle("fn", isOn: $selectedKeyboardKey.holdWithFn)
                        .toggleStyle(.button)
                        .disabled(!selectedKeyboardKey.holdWithModifier || selectedKeyboardKey.isHoldIncludeFn)
                }
            }
            HStack {
                VStack {
                    Toggle("SFSymbol", isOn: $selectedKeyboardKey.isAfterTapSFSymbol)
                        .toggleStyle(.checkbox)
                    TextField(selectedKeyboardKey.isAfterTapSFSymbol ? "SymbolName:": "DisplayName", text: $selectedKeyboardKey.afterDisplaySymbol)
                        .focused($isFocused_tapDisplaySymbol)
                        .disabled(!selectedKeyboardKey.isCustomized)
                    Text("Tap \(selectedKeyboardKey.beforeKeyOutPut) → \(selectedKeyboardKey.afterKeyOutPut)")
                        .font(.caption2)
                }
                VStack {
                    Toggle("SFSymbol", isOn: $selectedKeyboardKey.isAfterHoldSFSymbol)
                        .toggleStyle(.checkbox)
                    TextField(selectedKeyboardKey.isAfterHoldSFSymbol ? "SymbolName:": "DisplayName", text: $selectedKeyboardKey.holdDisplaySymbol)
                        .focused($isFocused_holdDisplaySymbol)
                        .disabled(!selectedKeyboardKey.isCustomized)
                    Text("Hold \(selectedKeyboardKey.beforeKeyOutPut) → \(selectedKeyboardKey.holdKeyOutPut)")
                        .font(.caption2)
                }
            }
        }
    }
    private func symbolOrText(_ content: String, isSymbol: Bool, size: CGFloat, color: Color) -> some View {
        Group {
            if isSymbol {
                Image(systemName: content)
                    .font(.system(size: size))
            } else {
                Text(content)
                    .font(.system(size: size))
            }
        }
        .foregroundColor(color)
    }
}

struct SelectedDetailView_PopOver: View {
    @Binding var selectedKeyboardKey: KeyboardKey
    private var highLightColor_tap: Color { //レイヤー移動のキーが入ってる時の色
        LayerColor.fromIndex(selectedKeyboardKey.layerKeyNumber_tap).buttonAndHighLightColor
    }
    private var highLightColor_hold: Color { //レイヤー移動のキーが入ってる時の色
        LayerColor.fromIndex(selectedKeyboardKey.layerKeyNumber_hold).buttonAndHighLightColor
    }
    private var textColor: Color { //レイヤーに応じて色を変化
        LayerColor.fromIndex(selectedKeyboardKey.layerNumber).textColor
    }
    
    var body: some View {
        VStack {
            if !selectedKeyboardKey.isTapHoldEnabled {
                tapView
            } else {
                tapHoldView
            }
        }
        .padding()
        .frame(width: 300)
        .padding()
    }
    private func modifierFontSize_tap() -> CGFloat {
        var activeModifierCount = 0
        if selectedKeyboardKey.tapWithShift { activeModifierCount += 1 }
        if selectedKeyboardKey.tapWithControl { activeModifierCount += 1 }
        if selectedKeyboardKey.tapWithCommand { activeModifierCount += 1 }
        if selectedKeyboardKey.tapWithOption { activeModifierCount += 1 }
        if selectedKeyboardKey.tapWithFn { activeModifierCount += 1 }
        
        switch activeModifierCount {
        case 0:
            return 15
        case 1:
            return 15
        case 2:
            return 10
        default:
            return 6
        }
    }
    private func modifierFontSize_hold() -> CGFloat {
        var activeModifierCount = 0
        if selectedKeyboardKey.holdWithShift { activeModifierCount += 1 }
        if selectedKeyboardKey.holdWithControl { activeModifierCount += 1 }
        if selectedKeyboardKey.holdWithCommand { activeModifierCount += 1 }
        if selectedKeyboardKey.holdWithOption { activeModifierCount += 1 }
        if selectedKeyboardKey.holdWithFn { activeModifierCount += 1 }
        
        switch activeModifierCount {
        case 0:
            return 15
        case 1:
            return 15
        case 2:
            return 10
        default:
            return 6
        }
    }
    
    private var modifierContent_tap: some View {
        VStack(spacing: 0) {
            if selectedKeyboardKey.tapWithModifier {
                Spacer()
                HStack(spacing: 0) {
                    if selectedKeyboardKey.tapWithShift {
                        Image(systemName: "shift")
                    }
                    if selectedKeyboardKey.tapWithControl {
                        Image(systemName: "control")
                    }
                }
                HStack(spacing: 0) {
                    if selectedKeyboardKey.tapWithCommand {
                        Image(systemName: "command")
                    }
                    if selectedKeyboardKey.tapWithOption {
                        Image(systemName: "option")
                    }
                }
                if selectedKeyboardKey.tapWithFn {
                    Image(systemName: "globe")
                }
                Spacer()
            } else {
                EmptyView()
            }
        }
        .font(.system(size: modifierFontSize_tap()))
    }
    private var modifierContent_hold: some View {
        VStack(spacing: 0) {
            if selectedKeyboardKey.holdWithModifier {
                Spacer()
                HStack(spacing: 0) {
                    if selectedKeyboardKey.holdWithShift {
                        Image(systemName: "shift")
                    }
                    if selectedKeyboardKey.holdWithControl {
                        Image(systemName: "control")
                    }
                }
                HStack(spacing: 0) {
                    if selectedKeyboardKey.holdWithCommand {
                        Image(systemName: "command")
                    }
                    if selectedKeyboardKey.holdWithOption {
                        Image(systemName: "option")
                    }
                }
                if selectedKeyboardKey.holdWithFn {
                    Image(systemName: "globe")
                }
                Spacer()
            } else {
                EmptyView()
            }
        }
        .font(.system(size: modifierFontSize_hold()))
    }

    private var tapView: some View {
        VStack {
            Text("Tap Key").font(.caption)
            HStack(spacing: 0) {
                if selectedKeyboardKey.afterKeyOutPut != "" {
                    if selectedKeyboardKey.layerKeyNumber_tap > 0 {
                        //                        modifierContent_tap.foregroundStyle(highLightColor_tap)
                        symbolOrText(selectedKeyboardKey.afterDisplaySymbol, isSymbol: selectedKeyboardKey.isAfterTapSFSymbol, size: 20, color: highLightColor_tap)
                    } else {
                        modifierContent_tap.foregroundStyle(textColor)
                        symbolOrText(selectedKeyboardKey.afterDisplaySymbol, isSymbol: selectedKeyboardKey.isAfterTapSFSymbol, size: 20, color: textColor)
                    }
                    
                } else {
                    Text("Drop here")
                        .font(.caption)
                        .foregroundColor(.white)
                    
                }
            }
            .frame(width: 65, height: 65)
            .background(.black)
            .cornerRadius(65 * 0.07)
            .dropDestination(for: CustomizeKey.self) { items, location in
                guard let item = items.first else { return false }
                selectedKeyboardKey.applyTapKeyCustomization(from: item)
                return true
            }

            HStack {
                Spacer()
                Text("Enable Tap Hold")
                Spacer()
                Toggle(isOn: $selectedKeyboardKey.isTapHoldEnabled) {Text("")}.toggleStyle(.switch)
                Spacer()
            }
            
            Toggle(isOn: $selectedKeyboardKey.tapWithModifier) { Text("Tap with Modifier")}.toggleStyle(.button)
            HStack {
                Toggle("⇧",isOn: $selectedKeyboardKey.tapWithShift)
                    .toggleStyle(.button)
                    .disabled(!selectedKeyboardKey.tapWithModifier || selectedKeyboardKey.isTapIncludeShift)
                Toggle("^",isOn: $selectedKeyboardKey.tapWithControl)
                    .toggleStyle(.button)
                    .disabled(!selectedKeyboardKey.tapWithModifier || selectedKeyboardKey.isTapIncludeControl)
            }
            HStack {
                Toggle("⌘",isOn: $selectedKeyboardKey.tapWithCommand)
                    .toggleStyle(.button)
                    .disabled(!selectedKeyboardKey.tapWithModifier || selectedKeyboardKey.isTapIncludeCommand)
                Toggle("⌥",isOn: $selectedKeyboardKey.tapWithOption)
                    .toggleStyle(.button)
                    .disabled(!selectedKeyboardKey.tapWithModifier || selectedKeyboardKey.isTapIncludeOption)
            }
            Toggle("fn", isOn: $selectedKeyboardKey.tapWithFn)
                .toggleStyle(.button)
                .disabled(!selectedKeyboardKey.tapWithModifier || selectedKeyboardKey.isTapIncludeFn)

        }
    }
    private var tapHoldView: some View {
        VStack {
            HStack {
                Spacer()
                VStack {
                    Text("Tap Key").font(.caption)
                    ZStack {
                        VStack {
                            if selectedKeyboardKey.afterKeyOutPut != "" { //すでに何かしらドロップされたあとの表示
                                HStack(spacing: 0) {
                                    if selectedKeyboardKey.layerKeyNumber_tap > 0 {
//                                        modifierContent_tap.foregroundStyle(highLightColor_tap)
                                        symbolOrText(selectedKeyboardKey.afterDisplaySymbol, isSymbol: selectedKeyboardKey.isAfterTapSFSymbol, size: 20, color: highLightColor_tap)
                                    } else {
                                        modifierContent_tap.foregroundStyle(textColor)
                                        symbolOrText(selectedKeyboardKey.afterDisplaySymbol, isSymbol: selectedKeyboardKey.isAfterTapSFSymbol, size: 20, color: textColor)
                                    }
                                }
                            } else { //まだドロップされていない状態の時の表示
                                Text("Drop here")
                                    .font(.caption2)
                                    .foregroundColor(.white)

                            }
                        }
                    }
                    .frame(width: 65, height: 65)
                    .background(.black)
                    .cornerRadius(65 * 0.07)
                    .dropDestination(for: CustomizeKey.self) { items, location in
                        guard let item = items.first else { return false }
                        selectedKeyboardKey.applyTapKeyCustomization(from: item)
                        return true
                    }
                }
                Spacer()
                VStack {
                    Text("Hold Key").font(.caption)
                    ZStack {
                        VStack {
                            if selectedKeyboardKey.holdKeyOutPut != "" {
                                HStack(spacing: 0) {
                                    if selectedKeyboardKey.layerKeyNumber_hold > 0 {
                                        modifierContent_hold.foregroundStyle(highLightColor_hold)
                                        symbolOrText(selectedKeyboardKey.holdDisplaySymbol, isSymbol: selectedKeyboardKey.isAfterHoldSFSymbol, size: 20, color: highLightColor_hold)
                                    } else {
                                        modifierContent_hold.foregroundStyle(textColor)
                                        symbolOrText(selectedKeyboardKey.holdDisplaySymbol, isSymbol: selectedKeyboardKey.isAfterHoldSFSymbol, size: 20, color: textColor)
                                    }
                                }
                            } else {
                                Text("Drop here")
                                    .foregroundColor(.white)
                                    .font(.caption2)
                            }
                        }
                    }
                    .frame(width: 65, height: 65)
                    .background(.black)
                    .cornerRadius(65 * 0.07)
                    .dropDestination(for: CustomizeKey.self) { items, location in
                        guard let item = items.first else { return false }
                        selectedKeyboardKey.applyHoldKeyCustomization(from: item)
                        return true
                    }
                }
                Spacer()
            }
            HStack {
                Spacer()
                Text("Enable Tap Hold")
                Spacer()
                Toggle(isOn: $selectedKeyboardKey.isTapHoldEnabled) {Text("")}.toggleStyle(.switch)
                Spacer()
            }
            HStack {
                VStack {
                    Toggle("Tap with Modifier", isOn: $selectedKeyboardKey.tapWithModifier)
                        .toggleStyle(.button)
                    
                    //Tap
                    HStack {
                        Toggle("⇧",isOn: $selectedKeyboardKey.tapWithShift)
                            .toggleStyle(.button)
                            .disabled(!selectedKeyboardKey.tapWithModifier || selectedKeyboardKey.isTapIncludeShift)
                        Toggle("^",isOn: $selectedKeyboardKey.tapWithControl)
                            .toggleStyle(.button)
                            .disabled(!selectedKeyboardKey.tapWithModifier || selectedKeyboardKey.isTapIncludeControl)
                    }
                    HStack {
                        Toggle("⌘",isOn: $selectedKeyboardKey.tapWithCommand)
                            .toggleStyle(.button)
                            .disabled(!selectedKeyboardKey.tapWithModifier || selectedKeyboardKey.isTapIncludeCommand)
                        Toggle("⌥",isOn: $selectedKeyboardKey.tapWithOption)
                            .toggleStyle(.button)
                            .disabled(!selectedKeyboardKey.tapWithModifier || selectedKeyboardKey.isTapIncludeOption)
                    }
                    Toggle("fn", isOn: $selectedKeyboardKey.tapWithFn)
                        .toggleStyle(.button)
                        .disabled(!selectedKeyboardKey.tapWithModifier || selectedKeyboardKey.isTapIncludeFn)
                }
                Divider().frame(height: 100)
                VStack {
                    Toggle("Hold with Modifier", isOn: $selectedKeyboardKey.holdWithModifier)
                        .toggleStyle(.button)
                    
                    //Hold
                    HStack {
                        Toggle("⇧",isOn: $selectedKeyboardKey.holdWithShift)
                            .toggleStyle(.button)
                            .disabled(!selectedKeyboardKey.holdWithModifier || selectedKeyboardKey.isHoldIncludeShift)
                        Toggle("^",isOn: $selectedKeyboardKey.holdWithControl)
                            .toggleStyle(.button)
                            .disabled(!selectedKeyboardKey.holdWithModifier || selectedKeyboardKey.isHoldIncludeControl)
                    }
                    HStack {
                        Toggle("⌘",isOn: $selectedKeyboardKey.holdWithCommand)
                            .toggleStyle(.button)
                            .disabled(!selectedKeyboardKey.holdWithModifier || selectedKeyboardKey.isHoldIncludeCommand)
                        Toggle("⌥",isOn: $selectedKeyboardKey.holdWithOption)
                            .toggleStyle(.button)
                            .disabled(!selectedKeyboardKey.holdWithModifier || selectedKeyboardKey.isHoldIncludeOption)
                    }
                    Toggle("fn", isOn: $selectedKeyboardKey.holdWithFn)
                        .toggleStyle(.button)
                        .disabled(!selectedKeyboardKey.holdWithModifier || selectedKeyboardKey.isHoldIncludeFn)
                }
            }
        }
    }
    private func symbolOrText(_ content: String, isSymbol: Bool, size: CGFloat, color: Color) -> some View {
        Group {
            if isSymbol {
                Image(systemName: content)
                    .font(.system(size: size))
            } else {
                Text(content)
                    .font(.system(size: size))
            }
        }
        .foregroundColor(color)
    }
}

//#Preview {
//    SelectedDetailView()
//}
