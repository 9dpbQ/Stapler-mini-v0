///キーボードのキーひとつ分のビューたち。
///長方形、JISエンター、UKエンター、Arrow上下の四種類がある。

import SwiftUI
import UniformTypeIdentifiers

// キーボードキーひとつ分のビュー。UnitSizeで横の長さを変えられるようになっている
struct KeyboardKeyView: View {
    @Binding var selectedKeyboardKey: KeyboardKey
    @State var keyboardKey: KeyboardKey
    let unitSize: Double//1uなのか、1.25uなのかを決める

    let baseSize: CGFloat// 1uの一片の長さ
    private var padding: CGFloat {baseSize * 0.07}
    private var round: CGFloat {baseSize * 0.07}
    // 全体のサイズ（パディングを含む）
    private var totalWidth: CGFloat {baseSize * unitSize}
    private var totalHeight: CGFloat {baseSize}
    // フレームのサイズ（パディングを除いた実際のシルエットのサイズ）
    private var frameWidth: CGFloat {totalWidth - (padding * 2)}
    private var frameHeiht: CGFloat {totalHeight - (padding * 2)}
    private var highLightColor_tap: Color {
        LayerColor.fromIndex(keyboardKey.layerKeyNumber_tap).textColor
    }
    private var highLightColor_hold: Color {
        LayerColor.fromIndex(keyboardKey.layerKeyNumber_hold).textColor
    }
    
    private var textColor: Color {
        LayerColor.fromIndex(keyboardKey.layerNumber).textColor
    }
    @State private var showPopOver: Bool = false
    
    var body: some View {
        ZStack {
            if selectedKeyboardKey.id == keyboardKey.id {//キーボードキーが選択されている状態の時の強調表示
                RoundedRectangle(cornerRadius: padding + round)
                    .stroke(LayerColor.fromIndex(keyboardKey.layerNumber).buttonAndHighLightColor, lineWidth: padding)
                    .frame(width: totalWidth, height: totalHeight)
            }
            ZStack {
                holdKeyView
                tapKeyView
            }
            .frame(width: frameWidth, height: frameHeiht) // 外側のフレーム（パディングを含む）
            .background(.black)
            .cornerRadius(round)
            .contextMenu {
                Button("Reset properties") {
                    keyboardKey.clearPropaties()
                }
            }
            .onTapGesture(count: 2){
                selectedKeyboardKey = keyboardKey
                showPopOver.toggle()
            }
            .onTapGesture {
                selectedKeyboardKey = keyboardKey
            }
            
            .dropDestination(for: CustomizeKey.self) { items, location in
                selectedKeyboardKey = keyboardKey
                guard let item = items.first else { return false }
                keyboardKey.applyTapKeyCustomization(from: item)
                return true
            }
            .popover(isPresented: $showPopOver) {
                SelectedDetailView_PopOver(selectedKeyboardKey: $selectedKeyboardKey)
            }
            .padding(padding)
        }
    }
    private var holdKeyView: some View {
        VStack {
            if keyboardKey.isTapHoldEnabled {
                if keyboardKey.layerKeyNumber_hold > 0 {
                    HStack(spacing: 0) {
//                        modifierContent_hold
                        symbolOrText(keyboardKey.holdDisplaySymbol,
                                     isSymbol: keyboardKey.isAfterHoldSFSymbol,
                                     size: 40,
                                     color: highLightColor_hold)
                    }
                } else {
                    HStack(spacing: 0) {
//                        modifierContent_hold
                        symbolOrText(keyboardKey.holdDisplaySymbol,
                                     isSymbol: keyboardKey.isAfterHoldSFSymbol,
                                     size: 40,
                                     color: textColor)
                    }
                }
            } else {
                EmptyView()
            }

        }
        .opacity(0.5)
    }
    private var tapKeyView: some View {
        Group {
            if keyboardKey.isCustomized {
                customizedContent
            } else {
                defaultContent
            }
        }
    }
    private var defaultContent: some View {
        
        Group {
            if keyboardKey.layerNumber > 0 {
                EmptyView()
            } else {
                symbolOrText(keyboardKey.beforeDisplaySymbol,
                             isSymbol: keyboardKey.isBeforeSFSymbol,
                             size: 20,
                             color: .white)
            }
        }
        
    }
    private var customizedContent: some View {
        Group {
            if keyboardKey.layerKeyNumber_tap > 0 {
                ZStack {
                    HStack(spacing: 0) {
//                        modifierContent_tap
                        symbolOrText(keyboardKey.afterDisplaySymbol,
                                     isSymbol: keyboardKey.isAfterTapSFSymbol,
                                     size: 20,
                                     color: highLightColor_tap)
                    }
                    if keyboardKey.layerNumber > 0 {
                        EmptyView()
                    } else {
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                symbolOrText(keyboardKey.beforeDisplaySymbol,
                                             isSymbol: keyboardKey.isBeforeSFSymbol,
                                             size: 12,
                                             color: .gray)
                                .padding(.bottom, 2)
                                .padding(.trailing, 2)
                            }
                        }
                    }
                }
                
            } else {
                ZStack {
                    HStack(spacing: 0) {
                        modifierContent_tap.foregroundStyle(textColor)
                        symbolOrText(keyboardKey.afterDisplaySymbol,
                                     isSymbol: keyboardKey.isAfterTapSFSymbol,
                                     size: 20,
                                     color: textColor)
                    }
                    if keyboardKey.layerNumber > 0 {
                        EmptyView()
                    } else {
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                symbolOrText(keyboardKey.beforeDisplaySymbol,
                                             isSymbol: keyboardKey.isBeforeSFSymbol,
                                             size: 12,
                                             color: .gray)
                                .padding(.bottom, 2)
                                .padding(.trailing, 2)
                            }
                        }
                    }
                }
                
            }
        }
    }
    private var modifierContent_tap: some View {
        VStack(spacing: 0) {
            if keyboardKey.tapWithModifier {
                Spacer()
                HStack(spacing: 0) {
                    if keyboardKey.tapWithShift {
                        Image(systemName: "shift")
                    }
                    if keyboardKey.tapWithControl {
                        Image(systemName: "control")
                    }
                }
                HStack(spacing: 0) {
                    if keyboardKey.tapWithCommand {
                        Image(systemName: "command")
                    }
                    if keyboardKey.tapWithOption {
                        Image(systemName: "option")
                    }
                }
                if keyboardKey.tapWithFn {
                    Image(systemName: "globe")
                }
                Spacer()
            } else {
                EmptyView()
            }
        }
        .font(.system(size: modifierFontSize_tap()))
    }
    private func modifierFontSize_tap() -> CGFloat {
        var activeModifierCount = 0
        if keyboardKey.tapWithShift { activeModifierCount += 1 }
        if keyboardKey.tapWithControl { activeModifierCount += 1 }
        if keyboardKey.tapWithCommand { activeModifierCount += 1 }
        if keyboardKey.tapWithOption { activeModifierCount += 1 }
        if keyboardKey.tapWithFn { activeModifierCount += 1 }
        
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
    private var modifierContent_hold: some View {
        VStack(spacing: 0) {
            if keyboardKey.holdWithModifier {
                Spacer()
                HStack(spacing: 0) {
                    if keyboardKey.holdWithShift {
                        Image(systemName: "shift")
                    }
                    if keyboardKey.holdWithControl {
                        Image(systemName: "control")
                    }
                }
                HStack(spacing: 0) {
                    if keyboardKey.holdWithCommand {
                        Image(systemName: "command")
                    }
                    if keyboardKey.holdWithOption {
                        Image(systemName: "option")
                    }
                }
                if keyboardKey.holdWithFn {
                    Image(systemName: "globe")
                }
                Spacer()
            } else {
                EmptyView()
            }
        }
        .font(.system(size: modifierFontSize_hold()))
    }
    private func modifierFontSize_hold() -> CGFloat {
        var activeModifierCount = 0
        if keyboardKey.holdWithShift { activeModifierCount += 1 }
        if keyboardKey.holdWithControl { activeModifierCount += 1 }
        if keyboardKey.holdWithCommand { activeModifierCount += 1 }
        if keyboardKey.holdWithOption { activeModifierCount += 1 }
        if keyboardKey.holdWithFn { activeModifierCount += 1 }
        
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
//    @Previewable @State var previewSelectedKey: KeyboardKey = .initial
//    KeyboardKeyView(selectedKeyboardKey: $previewSelectedKey, keyboardKey: KeyboardKey(beforeDisplaySymbol: "A", beforeKeyOutPut: "A"), unitSize: 1, baseSize: 100, highLightColor: .red)
//}

struct KeyboardKeyView_enter_JIS: View {
    @Binding var selectedKeyboardKey: KeyboardKey
    @State var keyboardKey: KeyboardKey
    @State private var showPopOver: Bool = false
    let baseSize: CGFloat // 1uの全体サイズ
    private var frameWidth: CGFloat {baseSize * 1.5}
    private var frameHeight: CGFloat {baseSize * 2}
    private var highLightFrameWidth: CGFloat {baseSize * 1.5}
    private var highLightFrameHeight: CGFloat {baseSize * 2}
    private var highLightColor_tap: Color {
        LayerColor.fromIndex(keyboardKey.layerKeyNumber_tap).textColor
    }
    private var highLightColor_hold: Color {
        LayerColor.fromIndex(keyboardKey.layerKeyNumber_hold).textColor
    }
    private var textColor: Color {
        LayerColor.fromIndex(keyboardKey.layerNumber).textColor
    }
    var body: some View {
        ZStack {
            if selectedKeyboardKey.id == keyboardKey.id {
                EnterShape_JIS_HighLight(frameValue: baseSize)
                    .stroke(LayerColor.fromIndex(keyboardKey.layerNumber).buttonAndHighLightColor, lineWidth: baseSize * 0.07)
                    .frame(width: highLightFrameWidth, height: highLightFrameHeight)
                
            }
            ZStack {
                holdKeyView
                tapKeyView
            }
            .frame(width: frameWidth, height: frameHeight)
            .background(Color.black)
            .clipShape(EnterShape_JIS(frameValue: baseSize)) // カスタムシェイプをクリップシェイプとして使用
            .contentShape(EnterShape_JIS(frameValue: baseSize)) // 当たり判定をカスタムシェイプに適用
            .contextMenu {
                Button("Reset properties") {
                    keyboardKey.clearPropaties()
                }
            }
            .onTapGesture(count: 2){
                selectedKeyboardKey = keyboardKey
                showPopOver.toggle()
            }
            .onTapGesture {
                selectedKeyboardKey = keyboardKey
            }
            .dropDestination(for: CustomizeKey.self) { items, location in
                selectedKeyboardKey = keyboardKey
                guard let item = items.first else { return false }
                keyboardKey.applyTapKeyCustomization(from: item)
                return true
            }
            .popover(isPresented: $showPopOver) {
                SelectedDetailView_PopOver(selectedKeyboardKey: $selectedKeyboardKey)
            }
        }
    }
    private var holdKeyView: some View {
        VStack {
            if keyboardKey.isTapHoldEnabled {
                if keyboardKey.layerKeyNumber_hold > 0 {
                    HStack(spacing: 0) {
//                        modifierContent_hold
                        symbolOrText(keyboardKey.holdDisplaySymbol,
                                     isSymbol: keyboardKey.isAfterHoldSFSymbol,
                                     size: 40,
                                     color: highLightColor_hold)
                    }
                } else {
                    HStack(spacing: 0) {
//                        modifierContent_hold
                        symbolOrText(keyboardKey.holdDisplaySymbol,
                                     isSymbol: keyboardKey.isAfterHoldSFSymbol,
                                     size: 40,
                                     color: textColor)
                    }
                }
            } else {
                EmptyView()
            }

        }
        .opacity(0.5)
    }
    private var tapKeyView: some View {
        Group {
            if keyboardKey.isCustomized {
                customizedContent
            } else {
                defaultContent
            }
        }
    }
    private var defaultContent: some View {
        Group {
            if keyboardKey.layerNumber > 0 {
                EmptyView()
            } else {
                symbolOrText(keyboardKey.beforeDisplaySymbol,
                             isSymbol: keyboardKey.isBeforeSFSymbol,
                             size: 20,
                             color: .white)
            }
        }
    }
    private var customizedContent: some View {
        Group {
            if keyboardKey.layerKeyNumber_tap > 0 {
                ZStack {
                    HStack(spacing: 0) {
//                        modifierContent_tap.foregroundStyle(highLightColor_tap)
                        symbolOrText(keyboardKey.afterDisplaySymbol,
                                     isSymbol: keyboardKey.isAfterTapSFSymbol,
                                     size: 20,
                                     color: LayerColor.fromIndex(keyboardKey.layerKeyNumber_tap).textColor)
                    }
                    if keyboardKey.layerNumber > 0 {
                        EmptyView()
                    } else {
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                symbolOrText(keyboardKey.beforeDisplaySymbol,
                                             isSymbol: keyboardKey.isBeforeSFSymbol,
                                             size: 12,
                                             color: .gray)
                                .padding(.bottom, 2 + 65 * 0.07)
                                .padding(.trailing, 2 + 65 * 0.07)
                            }
                        }
                    }
                }
            } else {
                ZStack {
                    HStack(spacing: 0) {
                        modifierContent_tap.foregroundStyle(textColor)
                        symbolOrText(keyboardKey.afterDisplaySymbol,
                                     isSymbol: keyboardKey.isAfterTapSFSymbol,
                                     size: 20,
                                     color: textColor)
                    }
                    if keyboardKey.layerNumber > 0 {
                        EmptyView()
                    } else {
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                symbolOrText(keyboardKey.beforeDisplaySymbol,
                                             isSymbol: keyboardKey.isBeforeSFSymbol,
                                             size: 12,
                                             color: .gray)
                                .padding(.bottom, 2 + 65 * 0.07)
                                .padding(.trailing, 2 + 65 * 0.07)
                            }
                        }
                    }
                }
                
            }
        }
    }
    private var modifierContent_tap: some View {
        VStack(spacing: 0) {
            if keyboardKey.tapWithModifier {
                Spacer()
                HStack(spacing: 0) {
                    if keyboardKey.tapWithShift {
                        Image(systemName: "shift")
                    }
                    if keyboardKey.tapWithControl {
                        Image(systemName: "control")
                    }
                }
                HStack(spacing: 0) {
                    if keyboardKey.tapWithCommand {
                        Image(systemName: "command")
                    }
                    if keyboardKey.tapWithOption {
                        Image(systemName: "option")
                    }
                }
                if keyboardKey.tapWithFn {
                    Image(systemName: "globe")
                }
                Spacer()
            } else {
                EmptyView()
            }
        }
        .font(.system(size: modifierFontSize_tap()))
    }
    private func modifierFontSize_tap() -> CGFloat {
        var activeModifierCount = 0
        if keyboardKey.tapWithShift { activeModifierCount += 1 }
        if keyboardKey.tapWithControl { activeModifierCount += 1 }
        if keyboardKey.tapWithCommand { activeModifierCount += 1 }
        if keyboardKey.tapWithOption { activeModifierCount += 1 }
        if keyboardKey.tapWithFn { activeModifierCount += 1 }
        
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
    private var modifierContent_hold: some View {
        VStack(spacing: 0) {
            if keyboardKey.holdWithModifier {
                Spacer()
                HStack(spacing: 0) {
                    if keyboardKey.holdWithShift {
                        Image(systemName: "shift")
                    }
                    if keyboardKey.holdWithControl {
                        Image(systemName: "control")
                    }
                }
                HStack(spacing: 0) {
                    if keyboardKey.holdWithCommand {
                        Image(systemName: "command")
                    }
                    if keyboardKey.holdWithOption {
                        Image(systemName: "option")
                    }
                }
                if keyboardKey.holdWithFn {
                    Image(systemName: "globe")
                }
                Spacer()
            } else {
                EmptyView()
            }
        }
        .font(.system(size: modifierFontSize_hold()))
    }
    private func modifierFontSize_hold() -> CGFloat {
        var activeModifierCount = 0
        if keyboardKey.holdWithShift { activeModifierCount += 1 }
        if keyboardKey.holdWithControl { activeModifierCount += 1 }
        if keyboardKey.holdWithCommand { activeModifierCount += 1 }
        if keyboardKey.holdWithOption { activeModifierCount += 1 }
        if keyboardKey.holdWithFn { activeModifierCount += 1 }
        
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
//    @Previewable @State var previewSelectedKey = KeyboardKey(beforeDisplaySymbol: "", beforeKeyOutPut: "")
//    return KeyboardKeyView_enter_JIS(selectedKeyboardKey: $previewSelectedKey, keyboardKey: KeyboardKey(beforeDisplaySymbol: "A", beforeKeyOutPut: "A"))
//}

struct KeyboardKeyView_enter_UK: View {
    @Binding var selectedKeyboardKey: KeyboardKey
    @State var keyboardKey: KeyboardKey
    @State private var showPopOver: Bool = false
    
    let baseSize: CGFloat // 1uの全体サイズ
    private var frameWidth: CGFloat {baseSize}
    private var frameHeight: CGFloat {baseSize * 2}
    private var highLightColor_tap: Color {
        LayerColor.fromIndex(keyboardKey.layerKeyNumber_tap).textColor
    }
    private var highLightColor_hold: Color {
        LayerColor.fromIndex(keyboardKey.layerKeyNumber_hold).textColor
    }
    private var textColor: Color {
        LayerColor.fromIndex(keyboardKey.layerNumber).textColor
    }
    var body: some View {
        ZStack {
            if selectedKeyboardKey == keyboardKey {
                EnterShape_UK_HighLight(frameValue: baseSize)
                    .stroke(LayerColor.fromIndex(keyboardKey.layerNumber).buttonAndHighLightColor, lineWidth: baseSize * 0.07)
                    .frame(width: frameWidth, height: frameHeight)
                
            }
            ZStack {
                holdKeyView
                tapKeyView
            }
            .frame(width: frameWidth, height: frameHeight)
            .background(Color.black)
            .clipShape(EnterShape_UK(frameValue: baseSize)) // カスタムシェイプをクリップシェイプとして使用
            .contentShape(EnterShape_UK(frameValue: baseSize)) // 当たり判定をカスタムシェイプに適用
            .contextMenu {
                Button("Reset properties") {
                    keyboardKey.clearPropaties()
                }
            }
            .onTapGesture(count: 2){
                selectedKeyboardKey = keyboardKey
                showPopOver.toggle()
            }
            .onTapGesture {
                selectedKeyboardKey = keyboardKey
            }
            .dropDestination(for: CustomizeKey.self) { items, location in
                selectedKeyboardKey = keyboardKey
                guard let item = items.first else { return false }
                keyboardKey.applyTapKeyCustomization(from: item)
                return true
            }
            .popover(isPresented: $showPopOver) {
                SelectedDetailView_PopOver(selectedKeyboardKey: $selectedKeyboardKey)
            }
        }
    }
    
    private var holdKeyView: some View {
        VStack {
            if keyboardKey.isTapHoldEnabled {
                if keyboardKey.layerKeyNumber_hold > 0 {
                    HStack(spacing: 0) {
//                        modifierContent_hold
                        symbolOrText(keyboardKey.holdDisplaySymbol,
                                     isSymbol: keyboardKey.isAfterHoldSFSymbol,
                                     size: 40,
                                     color: highLightColor_hold)
                    }
                } else {
                    HStack(spacing: 0) {
//                        modifierContent_hold
                        symbolOrText(keyboardKey.holdDisplaySymbol,
                                     isSymbol: keyboardKey.isAfterHoldSFSymbol,
                                     size: 40,
                                     color: textColor)
                    }
                }
            } else {
                EmptyView()
            }
            
        }
        .opacity(0.5)
    }
    private var tapKeyView: some View {
        Group {
            if keyboardKey.isCustomized {
                customizedContent
            } else {
                defaultContent
            }
        }
    }
    private var defaultContent: some View {
        Group {
            if keyboardKey.layerNumber > 0 {
                EmptyView()
            } else {
                symbolOrText(keyboardKey.beforeDisplaySymbol,
                             isSymbol: keyboardKey.isBeforeSFSymbol,
                             size: 20,
                             color: .white)
            }
        }
        
    }
    private var customizedContent: some View {
        Group {
            if keyboardKey.layerKeyNumber_tap > 0 {
                ZStack {
                    HStack(spacing: 0) {
//                        modifierContent_tap
                        symbolOrText(keyboardKey.afterDisplaySymbol,
                                     isSymbol: keyboardKey.isAfterTapSFSymbol,
                                     size: 20,
                                     color: highLightColor_tap)
                    }
                    if keyboardKey.layerNumber > 0 {
                        EmptyView()
                    } else {
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                symbolOrText(keyboardKey.beforeDisplaySymbol,
                                             isSymbol: keyboardKey.isBeforeSFSymbol,
                                             size: 12,
                                             color: .gray)
                                .padding(.bottom, 2 + 65 * 0.07)
                                .padding(.trailing, 2 + 65 * 0.07)
                            }
                        }
                    }
                }
                
            } else {
                ZStack {
                    HStack(spacing: 0) {
                        modifierContent_tap.foregroundStyle(textColor)
                        symbolOrText(keyboardKey.afterDisplaySymbol,
                                     isSymbol: keyboardKey.isAfterTapSFSymbol,
                                     size: 20,
                                     color: textColor)
                    }
                    if keyboardKey.layerNumber > 0 {
                        EmptyView()
                    } else {
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                symbolOrText(keyboardKey.beforeDisplaySymbol,
                                             isSymbol: keyboardKey.isBeforeSFSymbol,
                                             size: 12,
                                             color: .gray)
                                .padding(.bottom, 2 + 65 * 0.07)
                                .padding(.trailing, 2 + 65 * 0.07)
                            }
                        }
                    }
                }
                
            }
        }
    }
    private var modifierContent_tap: some View {
        VStack(spacing: 0) {
            if keyboardKey.tapWithModifier {
                Spacer()
                HStack(spacing: 0) {
                    if keyboardKey.tapWithShift {
                        Image(systemName: "shift")
                    }
                    if keyboardKey.tapWithControl {
                        Image(systemName: "control")
                    }
                }
                HStack(spacing: 0) {
                    if keyboardKey.tapWithCommand {
                        Image(systemName: "command")
                    }
                    if keyboardKey.tapWithOption {
                        Image(systemName: "option")
                    }
                }
                if keyboardKey.tapWithFn {
                    Image(systemName: "globe")
                }
                Spacer()
            } else {
                EmptyView()
            }
        }
        .font(.system(size: modifierFontSize_tap()))
        .foregroundStyle(textColor)
    }
    private func modifierFontSize_tap() -> CGFloat {
        var activeModifierCount = 0
        if keyboardKey.tapWithShift { activeModifierCount += 1 }
        if keyboardKey.tapWithControl { activeModifierCount += 1 }
        if keyboardKey.tapWithCommand { activeModifierCount += 1 }
        if keyboardKey.tapWithOption { activeModifierCount += 1 }
        if keyboardKey.tapWithFn { activeModifierCount += 1 }
        
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
    private var modifierContent_hold: some View {
        VStack(spacing: 0) {
            if keyboardKey.holdWithModifier {
                Spacer()
                HStack(spacing: 0) {
                    if keyboardKey.holdWithShift {
                        Image(systemName: "shift")
                    }
                    if keyboardKey.holdWithControl {
                        Image(systemName: "control")
                    }
                }
                HStack(spacing: 0) {
                    if keyboardKey.holdWithCommand {
                        Image(systemName: "command")
                    }
                    if keyboardKey.holdWithOption {
                        Image(systemName: "option")
                    }
                }
                if keyboardKey.holdWithFn {
                    Image(systemName: "globe")
                }
                Spacer()
            } else {
                EmptyView()
            }
        }
        .font(.system(size: modifierFontSize_hold()))
        .foregroundStyle(textColor)
    }
    private func modifierFontSize_hold() -> CGFloat {
        var activeModifierCount = 0
        if keyboardKey.holdWithShift { activeModifierCount += 1 }
        if keyboardKey.holdWithControl { activeModifierCount += 1 }
        if keyboardKey.holdWithCommand { activeModifierCount += 1 }
        if keyboardKey.holdWithOption { activeModifierCount += 1 }
        if keyboardKey.holdWithFn { activeModifierCount += 1 }
        
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
//    @Previewable @State var previewSelectedKey = KeyboardKey(beforeDisplaySymbol: "", beforeKeyOutPut: "")
//    KeyboardKeyView_enter_UK(selectedKeyboardKey: $previewSelectedKey, keyboardKey: KeyboardKey(beforeDisplaySymbol: "A", beforeKeyOutPut: "A"), baseSize: 70)
//}

struct KeyboardKeyView_arrow: View {
    @Binding var selectedKeyboardKey: KeyboardKey
    @State var keyboardKey: KeyboardKey
    @State private var showPopOver: Bool = false
    let unitSize: Double
    let baseSize: CGFloat// 1uの全体サイズ
    private var padding: CGFloat {baseSize * 0.07}
    private var round: CGFloat {baseSize * 0.07}
    // 全体のサイズ（パディングを含む）
    private var totalWidth: CGFloat {baseSize * unitSize}
    
    private var totalHeight: CGFloat {baseSize * 0.5}
    // フレームのサイズ（パディングを除いた実際の表示サイズ）
    private var frameWidth: CGFloat {totalWidth - (padding * 2)}
    private var frameHeight: CGFloat {totalHeight - (padding * 2)}
    private var highLightColor_tap: Color {
        LayerColor.fromIndex(keyboardKey.layerKeyNumber_tap).textColor
    }
    private var highLightColor_hold: Color {
        LayerColor.fromIndex(keyboardKey.layerKeyNumber_hold).textColor
    }
    private var textColor: Color {
        LayerColor.fromIndex(keyboardKey.layerNumber).textColor
    }
    var body: some View {
        ZStack {
            if selectedKeyboardKey.id == keyboardKey.id {
                RoundedRectangle(cornerRadius: padding + round)
                    .stroke(LayerColor.fromIndex(keyboardKey.layerNumber).buttonAndHighLightColor, lineWidth: padding)
                    .frame(width: totalWidth, height: totalHeight)
            }
            ZStack {
                holdKeyView
                tapKeyView
            }
            
            .frame(width: frameWidth, height: frameHeight) // 外側のフレーム（パディングを含む）
            .background(Color.black)
            .cornerRadius(5)
            .contextMenu {
                Button("Reset properties") {
                    keyboardKey.clearPropaties()
                }
            }
            .onTapGesture(count: 2){
                selectedKeyboardKey = keyboardKey
                showPopOver.toggle()
            }
            .onTapGesture {
                selectedKeyboardKey = keyboardKey
            }
            .dropDestination(for: CustomizeKey.self) { items, location in
                selectedKeyboardKey = keyboardKey
                guard let item = items.first else { return false }
                keyboardKey.applyTapKeyCustomization(from: item)
                return true
            }
            .popover(isPresented: $showPopOver) {
                SelectedDetailView_PopOver(selectedKeyboardKey: $selectedKeyboardKey)
            }
            .padding(padding)
        }
    }
    private var holdKeyView: some View {
        VStack {
            if keyboardKey.isTapHoldEnabled {
                if keyboardKey.layerKeyNumber_hold > 0 {
                    HStack(spacing: 0) {
//                        modifierContent_hold
                        symbolOrText(keyboardKey.holdDisplaySymbol,
                                     isSymbol: keyboardKey.isAfterHoldSFSymbol,
                                     size: 25,
                                     color: highLightColor_hold)
                    }
                } else {
                    HStack(spacing: 0) {
//                        modifierContent_hold
                        symbolOrText(keyboardKey.holdDisplaySymbol,
                                     isSymbol: keyboardKey.isAfterHoldSFSymbol,
                                     size: 25,
                                     color: textColor)
                    }
                }
            } else {
                EmptyView()
            }
            
        }
        .opacity(0.5)
    }
    private var tapKeyView: some View {
        Group {
            if keyboardKey.isCustomized {
                customizedContent
            } else {
                defaultContent
            }
        }
    }
    private var defaultContent: some View {
        Group {
            if keyboardKey.layerNumber > 0 {
                EmptyView()
            } else {
                symbolOrText(keyboardKey.beforeDisplaySymbol,
                             isSymbol: keyboardKey.isBeforeSFSymbol,
                             size: 20,
                             color: .white)
            }
        }
        
    }
    private var customizedContent: some View {
        Group {
            if keyboardKey.layerKeyNumber_tap > 0 {
                ZStack {
                    HStack(spacing: 0) {
//                        modifierContent_tap.foregroundStyle()
                        symbolOrText(keyboardKey.afterDisplaySymbol,
                                     isSymbol: keyboardKey.isAfterTapSFSymbol,
                                     size: 20,
                                     color: highLightColor_tap)
                    }
                    if keyboardKey.layerNumber > 0 {
                        EmptyView()
                    } else {
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                symbolOrText(keyboardKey.beforeDisplaySymbol,
                                             isSymbol: keyboardKey.isBeforeSFSymbol,
                                             size: 12,
                                             color: .gray)
                                .padding(.bottom, 2)
                                .padding(.trailing, 2)
                            }
                        }
                    }
                }
                
            } else {
                ZStack {
                    HStack(spacing: 0) {
                        modifierContent_tap
                        symbolOrText(keyboardKey.afterDisplaySymbol,
                                     isSymbol: keyboardKey.isAfterTapSFSymbol,
                                     size: 20,
                                     color: textColor)
                    }
                    if keyboardKey.layerNumber > 0 {
                        EmptyView()
                    } else {
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                symbolOrText(keyboardKey.beforeDisplaySymbol,
                                             isSymbol: keyboardKey.isBeforeSFSymbol,
                                             size: 12,
                                             color: .gray)
                                .padding(.bottom, 2)
                                .padding(.trailing, 2)
                            }
                        }
                    }
                }
                
            }
        }
    }
    private var modifierContent_tap: some View {
        VStack(spacing: 0) {
            if keyboardKey.tapWithModifier {
                Spacer()
                HStack(spacing: 0) {
                    if keyboardKey.tapWithShift {
                        Image(systemName: "shift")
                    }
                    if keyboardKey.tapWithControl {
                        Image(systemName: "control")
                    }
                }
                HStack(spacing: 0) {
                    if keyboardKey.tapWithCommand {
                        Image(systemName: "command")
                    }
                    if keyboardKey.tapWithOption {
                        Image(systemName: "option")
                    }
                }
                if keyboardKey.tapWithFn {
                    Image(systemName: "globe")
                }
                Spacer()
            } else {
                EmptyView()
            }
        }
        .font(.system(size: modifierFontSize_tap()))
    }
    private func modifierFontSize_tap() -> CGFloat {
        var activeModifierCount = 0
        if keyboardKey.tapWithShift { activeModifierCount += 1 }
        if keyboardKey.tapWithControl { activeModifierCount += 1 }
        if keyboardKey.tapWithCommand { activeModifierCount += 1 }
        if keyboardKey.tapWithOption { activeModifierCount += 1 }
        if keyboardKey.tapWithFn { activeModifierCount += 1 }
        
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
    private var modifierContent_hold: some View {
        VStack(spacing: 0) {
            if keyboardKey.holdWithModifier {
                Spacer()
                HStack(spacing: 0) {
                    if keyboardKey.holdWithShift {
                        Image(systemName: "shift")
                    }
                    if keyboardKey.holdWithControl {
                        Image(systemName: "control")
                    }
                }
                HStack(spacing: 0) {
                    if keyboardKey.holdWithCommand {
                        Image(systemName: "command")
                    }
                    if keyboardKey.holdWithOption {
                        Image(systemName: "option")
                    }
                }
                if keyboardKey.holdWithFn {
                    Image(systemName: "globe")
                }
                Spacer()
            } else {
                EmptyView()
            }
        }
        .font(.system(size: modifierFontSize_hold()))
    }
    private func modifierFontSize_hold() -> CGFloat {
        var activeModifierCount = 0
        if keyboardKey.holdWithShift { activeModifierCount += 1 }
        if keyboardKey.holdWithControl { activeModifierCount += 1 }
        if keyboardKey.holdWithCommand { activeModifierCount += 1 }
        if keyboardKey.holdWithOption { activeModifierCount += 1 }
        if keyboardKey.holdWithFn { activeModifierCount += 1 }
        
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




