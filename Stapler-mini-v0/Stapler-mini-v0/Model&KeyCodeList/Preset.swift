///PresetやKeyboardKeyクラスの定義。
///
///Preset：KeyboardKeyの配列をふくむキーボード全体の情報と、書き換えのレイアウトUS/UK/JIS、
///キーコードのANSI・JISなどのタイプ、Vendor IDなど。最終的にこのクラスの状態をもとにjsonを出力する。
///
///KeyboardKey：キーの書き換えひとつ分の情報を持つクラス。

import Foundation
import SwiftData
import SwiftUI
// キーボードの種類を定義するenum
enum KeyboardLayout:String, CaseIterable, Codable {
    case JIS
    case US
    case UK
}

extension Preset {
    enum CodingKeys: String, CodingKey {
        case id
        case presetName
        case keyboardLayout
        case keyCodeRegion
        case vendorID
        case productID
        case layer0
        case layer1
        case layer2
        case layer3
        case layer4
        case layer5
        case layer6
        case layer7
        case layer8

        case _layer0
        case _layer1
        case _layer2
        case _layer3
        case _layer4
        case _layer5
        case _layer6
        case _layer7
        case _layer8

        case idsInOrderLayer0
        case idsInOrderLayer1
        case idsInOrderLayer2
        case idsInOrderLayer3
        case idsInOrderLayer4
        case idsInOrderLayer5
        case idsInOrderLayer6
        case idsInOrderLayer7
        case idsInOrderLayer8

    }
}

///Preset
///ユーザーが作る一つ一つのプリセットを保存する。SwiftDataで保存。
///プリセットを追加するときにはレイアウトを選択するようになっていて、レイアウトごとのKeyboardKeyの配列が入るようになっています。
///SwiftDataのバグか仕様かわからないんですが、SwiftDataでクラスを保存するとき、そのクラスの子配列は順序がぐちゃぐちゃに保存されます。
///UUIDの配列とかはそれを調節するためのものです。

@Model
final class Preset: Identifiable, Codable, ObservableObject {
    
    static let testPresetUS: Preset = Preset(presetName: "us", keyboardLayout: .US)
    static let testPresetJIS: Preset = Preset(presetName: "jis", keyboardLayout: .JIS)
    static let testPresetUK: Preset = Preset(presetName: "uk", keyboardLayout: .UK)
    
    var presetName: String
    var keyboardLayout: KeyboardLayout//US JIS UK
    var keyCodeRegion: KeyCodeRegion//書き出し後のキーコードRegion。ANSI JIS ISO
    
    var id: UUID
    var vendorID: String = "1452"//デフォルトはMac Book本体キーボード
    var productID: String = "635"//外部をカスタムする場合テキストエディタに入力してもらう
    
    private var _layer0: [KeyboardKey]
    private var _layer1: [KeyboardKey]
    private var _layer2: [KeyboardKey]
    private var _layer3: [KeyboardKey]
    private var _layer4: [KeyboardKey]
    private var _layer5: [KeyboardKey]
    private var _layer6: [KeyboardKey]
    private var _layer7: [KeyboardKey]
    private var _layer8: [KeyboardKey]

    private var idsInOrderLayer0: [UUID]
    private var idsInOrderLayer1: [UUID]
    private var idsInOrderLayer2: [UUID]
    private var idsInOrderLayer3: [UUID]
    private var idsInOrderLayer4: [UUID]
    private var idsInOrderLayer5: [UUID]
    private var idsInOrderLayer6: [UUID]
    private var idsInOrderLayer7: [UUID]
    private var idsInOrderLayer8: [UUID]


    var layer0: [KeyboardKey] {//外部から呼び出せる順序のソートの済んだ配列
        get {
            return getSortedLayer(from: _layer0, using: idsInOrderLayer0)
        }
        set {
            idsInOrderLayer0 = newValue.map { $0.id }
            _layer0 = newValue
        }
    }
    
    var layer1: [KeyboardKey] {
        get {
            return getSortedLayer(from: _layer1, using: idsInOrderLayer1)
        }
        set {
            idsInOrderLayer1 = newValue.map { $0.id }
            _layer1 = newValue
        }
    }
    
    var layer2: [KeyboardKey] {
        get {
            return getSortedLayer(from: _layer2, using: idsInOrderLayer2)
        }
        set {
            idsInOrderLayer2 = newValue.map { $0.id }
            _layer2 = newValue
        }
    }
    var layer3: [KeyboardKey] {
        get {
            return getSortedLayer(from: _layer3, using: idsInOrderLayer3)
        }
        set {
            idsInOrderLayer3 = newValue.map { $0.id }
            _layer3 = newValue
        }
    }
    var layer4: [KeyboardKey] {
        get {
            return getSortedLayer(from: _layer4, using: idsInOrderLayer4)
        }
        set {
            idsInOrderLayer4 = newValue.map { $0.id }
            _layer4 = newValue
        }
    }
    var layer5: [KeyboardKey] {
        get {
            return getSortedLayer(from: _layer5, using: idsInOrderLayer5)
        }
        set {
            idsInOrderLayer5 = newValue.map { $0.id }
            _layer5 = newValue
        }
    }
    var layer6: [KeyboardKey] {
        get {
            return getSortedLayer(from: _layer6, using: idsInOrderLayer6)
        }
        set {
            idsInOrderLayer6 = newValue.map { $0.id }
            _layer6 = newValue
        }
    }
    var layer7: [KeyboardKey] {
        get {
            return getSortedLayer(from: _layer7, using: idsInOrderLayer7)
        }
        set {
            idsInOrderLayer7 = newValue.map { $0.id }
            _layer7 = newValue
        }
    }
    var layer8: [KeyboardKey] {
        get {
            return getSortedLayer(from: _layer8, using: idsInOrderLayer8)
        }
        set {
            idsInOrderLayer8 = newValue.map { $0.id }
            _layer8 = newValue
        }
    }
    
    init(presetName: String, keyboardLayout: KeyboardLayout) {
        self.id = UUID()
        self.presetName = presetName
        self.keyboardLayout = keyboardLayout
        switch keyboardLayout {
        case .US:
            self.keyCodeRegion = KeyCodeRegion.ansi
        case .JIS:
            self.keyCodeRegion = KeyCodeRegion.jis
        case .UK:
            self.keyCodeRegion = KeyCodeRegion.iso
        }
        
        let tempLayer0 = Preset.createLayerKeys(layerNumber: 0, for: keyboardLayout)
        let tempLayer1 = Preset.createLayerKeys(layerNumber: 1, for: keyboardLayout)
        let tempLayer2 = Preset.createLayerKeys(layerNumber: 2, for: keyboardLayout)
        let tempLayer3 = Preset.createLayerKeys(layerNumber: 3, for: keyboardLayout)
        let tempLayer4 = Preset.createLayerKeys(layerNumber: 4, for: keyboardLayout)
        let tempLayer5 = Preset.createLayerKeys(layerNumber: 5, for: keyboardLayout)
        let tempLayer6 = Preset.createLayerKeys(layerNumber: 6, for: keyboardLayout)
        let tempLayer7 = Preset.createLayerKeys(layerNumber: 7, for: keyboardLayout)
        let tempLayer8 = Preset.createLayerKeys(layerNumber: 8, for: keyboardLayout)

        self._layer0 = tempLayer0
        self.idsInOrderLayer0 = tempLayer0.map { $0.id }
        
        self._layer1 = tempLayer1
        self.idsInOrderLayer1 = tempLayer1.map { $0.id }
        
        self._layer2 = tempLayer2
        self.idsInOrderLayer2 = tempLayer2.map { $0.id }
        
        self._layer3 = tempLayer3
        self.idsInOrderLayer3 = tempLayer3.map { $0.id }
        
        self._layer4 = tempLayer4
        self.idsInOrderLayer4 = tempLayer4.map { $0.id }
        
        self._layer5 = tempLayer5
        self.idsInOrderLayer5 = tempLayer5.map { $0.id }
        
        self._layer6 = tempLayer6
        self.idsInOrderLayer6 = tempLayer6.map { $0.id }
        
        self._layer7 = tempLayer7
        self.idsInOrderLayer7 = tempLayer7.map { $0.id }
        
        self._layer8 = tempLayer8
        self.idsInOrderLayer8 = tempLayer8.map { $0.id }
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = UUID()//UUIDは新規で生成
        self.presetName = try container.decode(String.self, forKey: .presetName)
        self.keyboardLayout = try container.decode(KeyboardLayout.self, forKey: .keyboardLayout)
        self.keyCodeRegion = try container.decode(KeyCodeRegion.self, forKey: .keyCodeRegion)
        self.vendorID = try container.decode(String.self, forKey: .vendorID)
        self.productID = try container.decode(String.self, forKey: .productID)
        
        // 各レイヤーをデコード
        let decodedLayer0 = try container.decode([KeyboardKey].self, forKey: .layer0)
        let decodedLayer1 = try container.decode([KeyboardKey].self, forKey: .layer1)
        let decodedLayer2 = try container.decode([KeyboardKey].self, forKey: .layer2)
        let decodedLayer3 = try container.decode([KeyboardKey].self, forKey: .layer3)
        let decodedLayer4 = try container.decode([KeyboardKey].self, forKey: .layer4)
        let decodedLayer5 = try container.decode([KeyboardKey].self, forKey: .layer5)
        let decodedLayer6 = try container.decode([KeyboardKey].self, forKey: .layer6)
        let decodedLayer7 = try container.decode([KeyboardKey].self, forKey: .layer7)
        let decodedLayer8 = try container.decode([KeyboardKey].self, forKey: .layer8)
        
        
        // 各レイヤーを内部配列に保存
        self._layer0 = decodedLayer0
        self._layer1 = decodedLayer1
        self._layer2 = decodedLayer2
        self._layer3 = decodedLayer3
        self._layer4 = decodedLayer4
        self._layer5 = decodedLayer5
        self._layer6 = decodedLayer6
        self._layer7 = decodedLayer7
        self._layer8 = decodedLayer8
        
        // 新規IDに基づいてソート用の配列を再作成
        self.idsInOrderLayer0 = decodedLayer0.map { $0.id }
        self.idsInOrderLayer1 = decodedLayer1.map { $0.id }
        self.idsInOrderLayer2 = decodedLayer2.map { $0.id }
        self.idsInOrderLayer3 = decodedLayer3.map { $0.id }
        self.idsInOrderLayer4 = decodedLayer4.map { $0.id }
        self.idsInOrderLayer5 = decodedLayer5.map { $0.id }
        self.idsInOrderLayer6 = decodedLayer6.map { $0.id }
        self.idsInOrderLayer7 = decodedLayer7.map { $0.id }
        self.idsInOrderLayer8 = decodedLayer8.map { $0.id }

    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(presetName, forKey: .presetName)
        try container.encode(keyboardLayout, forKey: .keyboardLayout)
        try container.encode(keyCodeRegion, forKey: .keyCodeRegion)
        try container.encode(vendorID, forKey: .vendorID)
        try container.encode(productID, forKey: .productID)
        
        try container.encode(layer0 ,forKey: .layer0)
        try container.encode(layer1 ,forKey: .layer1)
        try container.encode(layer2 ,forKey: .layer2)
        try container.encode(layer3 ,forKey: .layer3)
        try container.encode(layer4 ,forKey: .layer4)
        try container.encode(layer5 ,forKey: .layer5)
        try container.encode(layer6 ,forKey: .layer6)
        try container.encode(layer7 ,forKey: .layer7)
        try container.encode(layer8 ,forKey: .layer8)
        
        try container.encode(_layer0, forKey: ._layer0)
        try container.encode(_layer1, forKey: ._layer1)
        try container.encode(_layer2, forKey: ._layer2)
        try container.encode(_layer3, forKey: ._layer3)
        try container.encode(_layer4, forKey: ._layer4)
        try container.encode(_layer5, forKey: ._layer5)
        try container.encode(_layer6, forKey: ._layer6)
        try container.encode(_layer7, forKey: ._layer7)
        try container.encode(_layer8, forKey: ._layer8)
        
        try container.encode(idsInOrderLayer0, forKey: .idsInOrderLayer0)
        try container.encode(idsInOrderLayer1, forKey: .idsInOrderLayer1)
        try container.encode(idsInOrderLayer2, forKey: .idsInOrderLayer2)
        try container.encode(idsInOrderLayer3, forKey: .idsInOrderLayer3)
        try container.encode(idsInOrderLayer4, forKey: .idsInOrderLayer4)
        try container.encode(idsInOrderLayer5, forKey: .idsInOrderLayer5)
        try container.encode(idsInOrderLayer6, forKey: .idsInOrderLayer6)
        try container.encode(idsInOrderLayer7, forKey: .idsInOrderLayer7)
        try container.encode(idsInOrderLayer8, forKey: .idsInOrderLayer8)

        }
    //SwiftDataで順序を整えた配列を作るための関数
    private func getSortedLayer(from layer: [KeyboardKey], using order: [UUID]) -> [KeyboardKey] {
        var sortedLayer = [KeyboardKey]()
        var elementsToCheck = layer
        
        for id in order {
            guard let idx = elementsToCheck.firstIndex(where: { $0.id == id }) else { continue }
            sortedLayer.append(elementsToCheck[idx])
            elementsToCheck.remove(at: idx)
        }
        
        return sortedLayer
    }
    // キー配列を生成する
    private static func createLayerKeys(layerNumber: Int, for layout: KeyboardLayout) -> [KeyboardKey] {
        let keys: [KeyboardKey]
        
        switch layout {
        case .US:
            keys = [
                //Row1
                KeyboardKey(beforeDisplaySymbol: "esc", beforeKeyOutPut: "esc", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F1", beforeKeyOutPut: "F1", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F2", beforeKeyOutPut: "F2", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F3", beforeKeyOutPut: "F3", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F4", beforeKeyOutPut: "F4", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F5", beforeKeyOutPut: "F5", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F6", beforeKeyOutPut: "F6", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F7", beforeKeyOutPut: "F7", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F8", beforeKeyOutPut: "F8", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F9", beforeKeyOutPut: "F9", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F10", beforeKeyOutPut: "F10", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F11", beforeKeyOutPut: "F11", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F12", beforeKeyOutPut: "F12", layerNumber: layerNumber),
                //Row2
                KeyboardKey(beforeDisplaySymbol: "`", beforeKeyOutPut: "`", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "1", beforeKeyOutPut: "1", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "2", beforeKeyOutPut: "2", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "3", beforeKeyOutPut: "3", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "4", beforeKeyOutPut: "4", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "5", beforeKeyOutPut: "5", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "6", beforeKeyOutPut: "6", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "7", beforeKeyOutPut: "7", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "8", beforeKeyOutPut: "8", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "9", beforeKeyOutPut: "9", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "0", beforeKeyOutPut: "0", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "-", beforeKeyOutPut: "-", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "=", beforeKeyOutPut: "=", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "delete", beforeKeyOutPut: "BS", layerNumber: layerNumber),
                //Row3
                KeyboardKey(beforeDisplaySymbol: "tab", beforeKeyOutPut: "tab", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "Q", beforeKeyOutPut: "q", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "W", beforeKeyOutPut: "w", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "E", beforeKeyOutPut: "e", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "R", beforeKeyOutPut: "r", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "T", beforeKeyOutPut: "t", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "Y", beforeKeyOutPut: "y", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "U", beforeKeyOutPut: "u", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "I", beforeKeyOutPut: "i", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "O", beforeKeyOutPut: "o", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "P", beforeKeyOutPut: "p", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "[", beforeKeyOutPut: "[", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "]", beforeKeyOutPut: "]", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "\\", beforeKeyOutPut: "\\", layerNumber: layerNumber),
                //Row4
                KeyboardKey(beforeDisplaySymbol: "caps lock", beforeKeyOutPut: "caps", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "A", beforeKeyOutPut: "a", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "S", beforeKeyOutPut: "s", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "D", beforeKeyOutPut: "d", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F", beforeKeyOutPut: "f", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "G", beforeKeyOutPut: "g", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "H", beforeKeyOutPut: "h", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "J", beforeKeyOutPut: "j", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "K", beforeKeyOutPut: "k", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "L", beforeKeyOutPut: "l", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: ";", beforeKeyOutPut: ";", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "'", beforeKeyOutPut: "'", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "return", beforeKeyOutPut: "return", layerNumber: layerNumber),
                //Row5
                KeyboardKey(beforeDisplaySymbol: "shift", beforeKeyOutPut: "left_shift", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "Z", beforeKeyOutPut: "z", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "X", beforeKeyOutPut: "x", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "C", beforeKeyOutPut: "c", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "V", beforeKeyOutPut: "v", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "B", beforeKeyOutPut: "b", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "N", beforeKeyOutPut: "n", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "M", beforeKeyOutPut: "m", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: ",", beforeKeyOutPut: ",", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: ".", beforeKeyOutPut: ".", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "/", beforeKeyOutPut: "/", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "shift", beforeKeyOutPut: "right_shift", layerNumber: layerNumber),
                //Row6
                KeyboardKey(beforeDisplaySymbol: "fn", beforeKeyOutPut: "fn", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "control", beforeKeyOutPut: "left_control", layerNumber: layerNumber, isBeforeSFSymbol: true),
                KeyboardKey(beforeDisplaySymbol: "option", beforeKeyOutPut: "left_option", layerNumber: layerNumber, isBeforeSFSymbol: true),
                KeyboardKey(beforeDisplaySymbol: "command", beforeKeyOutPut: "left_command", layerNumber: layerNumber, isBeforeSFSymbol: true),
                KeyboardKey(beforeDisplaySymbol: "␣", beforeKeyOutPut: "spacebar", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "command", beforeKeyOutPut: "right_command", layerNumber: layerNumber, isBeforeSFSymbol: true),
                KeyboardKey(beforeDisplaySymbol: "option", beforeKeyOutPut: "right_option", layerNumber: layerNumber, isBeforeSFSymbol: true),
                KeyboardKey(beforeDisplaySymbol: "←", beforeKeyOutPut: "left_arrow", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "↑", beforeKeyOutPut: "up_arrow", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "↓", beforeKeyOutPut: "down_arrow", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "→", beforeKeyOutPut: "right_arrow", layerNumber: layerNumber)
            ]
            
        case .JIS:
            keys = [
                //Row1
                KeyboardKey(beforeDisplaySymbol: "esc", beforeKeyOutPut: "esc", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F1", beforeKeyOutPut: "F1", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F2", beforeKeyOutPut: "F2", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F3", beforeKeyOutPut: "F3", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F4", beforeKeyOutPut: "F4", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F5", beforeKeyOutPut: "F5", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F6", beforeKeyOutPut: "F6", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F7", beforeKeyOutPut: "F7", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F8", beforeKeyOutPut: "F8", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F9", beforeKeyOutPut: "F9", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F10", beforeKeyOutPut: "F10", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F11", beforeKeyOutPut: "F11", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F12", beforeKeyOutPut: "F12", layerNumber: layerNumber),
                //Row2
                KeyboardKey(beforeDisplaySymbol: "1", beforeKeyOutPut: "1", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "2", beforeKeyOutPut: "2", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "3", beforeKeyOutPut: "3", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "4", beforeKeyOutPut: "4", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "5", beforeKeyOutPut: "5", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "6", beforeKeyOutPut: "6", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "7", beforeKeyOutPut: "7", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "8", beforeKeyOutPut: "8", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "9", beforeKeyOutPut: "9", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "0", beforeKeyOutPut: "0", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "-", beforeKeyOutPut: "-", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "^", beforeKeyOutPut: "^_JIS", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "¥", beforeKeyOutPut: "international3", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "delete.left", beforeKeyOutPut: "BS", layerNumber: layerNumber, isBeforeSFSymbol: true),
                //Row3
                KeyboardKey(beforeDisplaySymbol: "arrow.right.to.line", beforeKeyOutPut: "tab", layerNumber: layerNumber, isBeforeSFSymbol: true),
                KeyboardKey(beforeDisplaySymbol: "Q", beforeKeyOutPut: "q", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "W", beforeKeyOutPut: "w", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "E", beforeKeyOutPut: "e", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "R", beforeKeyOutPut: "r", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "T", beforeKeyOutPut: "t", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "Y", beforeKeyOutPut: "y", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "U", beforeKeyOutPut: "u", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "I", beforeKeyOutPut: "i", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "O", beforeKeyOutPut: "o", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "P", beforeKeyOutPut: "p", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "@", beforeKeyOutPut: "@_JIS", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "[", beforeKeyOutPut: "[_JIS", layerNumber: layerNumber),
                //Row4
                KeyboardKey(beforeDisplaySymbol: "control", beforeKeyOutPut: "left_control", layerNumber: layerNumber, isBeforeSFSymbol: true),
                KeyboardKey(beforeDisplaySymbol: "A", beforeKeyOutPut: "a", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "S", beforeKeyOutPut: "s", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "D", beforeKeyOutPut: "d", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F", beforeKeyOutPut: "f", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "G", beforeKeyOutPut: "g", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "H", beforeKeyOutPut: "h", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "J", beforeKeyOutPut: "j", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "K", beforeKeyOutPut: "k", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "L", beforeKeyOutPut: "l", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: ";", beforeKeyOutPut: ";", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: ":", beforeKeyOutPut: ":_JIS", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "]", beforeKeyOutPut: "]_JIS",layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "return", beforeKeyOutPut: "return", layerNumber: layerNumber, isBeforeSFSymbol: true),
                //Row5
                KeyboardKey(beforeDisplaySymbol: "shift", beforeKeyOutPut: "left_shift", layerNumber: layerNumber, isBeforeSFSymbol: true),
                KeyboardKey(beforeDisplaySymbol: "Z", beforeKeyOutPut: "z", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "X", beforeKeyOutPut: "x", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "C", beforeKeyOutPut: "c", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "V", beforeKeyOutPut: "v", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "B", beforeKeyOutPut: "b", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "N", beforeKeyOutPut: "n", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "M", beforeKeyOutPut: "m", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: ",", beforeKeyOutPut: ",", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: ".", beforeKeyOutPut: ".", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "/", beforeKeyOutPut: "/", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "_", beforeKeyOutPut: "international1", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "shift", beforeKeyOutPut: "right_shift", layerNumber: layerNumber, isBeforeSFSymbol: true),
                //Row6
                KeyboardKey(beforeDisplaySymbol: "capslock", beforeKeyOutPut: "caps", layerNumber: layerNumber, isBeforeSFSymbol: true),
                KeyboardKey(beforeDisplaySymbol: "option", beforeKeyOutPut: "left_option", layerNumber: layerNumber, isBeforeSFSymbol: true),
                KeyboardKey(beforeDisplaySymbol: "command", beforeKeyOutPut: "left_command", layerNumber: layerNumber, isBeforeSFSymbol: true),
                KeyboardKey(beforeDisplaySymbol: "英数", beforeKeyOutPut: "英数", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "␣", beforeKeyOutPut: "␣", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "かな", beforeKeyOutPut: "かな", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "command", beforeKeyOutPut: "right_command", layerNumber: layerNumber, isBeforeSFSymbol: true),
                KeyboardKey(beforeDisplaySymbol: "fn", beforeKeyOutPut: "fn", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "←", beforeKeyOutPut: "left_arrow", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "↑", beforeKeyOutPut: "up_arrow", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "↓", beforeKeyOutPut: "down_arrow", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "→", beforeKeyOutPut: "right_arrow", layerNumber: layerNumber)
            ]
            
        case .UK:
            keys = [
                //Row1
                KeyboardKey(beforeDisplaySymbol: "esc", beforeKeyOutPut: "esc", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F1", beforeKeyOutPut: "F1", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F2", beforeKeyOutPut: "F2", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F3", beforeKeyOutPut: "F3", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F4", beforeKeyOutPut: "F4", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F5", beforeKeyOutPut: "F5", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F6", beforeKeyOutPut: "F6", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F7", beforeKeyOutPut: "F7", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F8", beforeKeyOutPut: "F8", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F9", beforeKeyOutPut: "F9", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F10", beforeKeyOutPut: "F10", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F11", beforeKeyOutPut: "F11", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F12", beforeKeyOutPut: "F12", layerNumber: layerNumber),
                //Row2
                KeyboardKey(beforeDisplaySymbol: "§", beforeKeyOutPut: "§_UK", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "1", beforeKeyOutPut: "1", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "2", beforeKeyOutPut: "2", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "3", beforeKeyOutPut: "3", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "4", beforeKeyOutPut: "4", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "5", beforeKeyOutPut: "5", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "6", beforeKeyOutPut: "6", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "7", beforeKeyOutPut: "7", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "8", beforeKeyOutPut: "8", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "9", beforeKeyOutPut: "9", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "0", beforeKeyOutPut: "0", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "-", beforeKeyOutPut: "-", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "=", beforeKeyOutPut: "=", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "delete.left", beforeKeyOutPut: "BS", layerNumber: layerNumber, isBeforeSFSymbol: true),
                //Row3
                KeyboardKey(beforeDisplaySymbol: "arrow.right.to.line", beforeKeyOutPut: "tab", layerNumber: layerNumber, isBeforeSFSymbol: true),
                KeyboardKey(beforeDisplaySymbol: "Q", beforeKeyOutPut: "q", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "W", beforeKeyOutPut: "w", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "E", beforeKeyOutPut: "e", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "R", beforeKeyOutPut: "r", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "T", beforeKeyOutPut: "t", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "Y", beforeKeyOutPut: "y", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "U", beforeKeyOutPut: "u", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "I", beforeKeyOutPut: "i", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "O", beforeKeyOutPut: "o", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "P", beforeKeyOutPut: "p", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "[", beforeKeyOutPut: "[", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "]", beforeKeyOutPut: "]", layerNumber: layerNumber),
                //Row4
                KeyboardKey(beforeDisplaySymbol: "capslock", beforeKeyOutPut: "caps", layerNumber: layerNumber, isBeforeSFSymbol: true),
                KeyboardKey(beforeDisplaySymbol: "A", beforeKeyOutPut: "a", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "S", beforeKeyOutPut: "s", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "D", beforeKeyOutPut: "d", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "F", beforeKeyOutPut: "f", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "G", beforeKeyOutPut: "g", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "H", beforeKeyOutPut: "h", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "J", beforeKeyOutPut: "j", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "K", beforeKeyOutPut: "k", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "L", beforeKeyOutPut: "l", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: ";", beforeKeyOutPut: ";", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "'", beforeKeyOutPut: "'", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "\\", beforeKeyOutPut: "\\", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "return", beforeKeyOutPut: "return", layerNumber: layerNumber, isBeforeSFSymbol: true),
                //Row5
                KeyboardKey(beforeDisplaySymbol: "shift", beforeKeyOutPut: "left_shift", layerNumber: layerNumber, isBeforeSFSymbol: true),
                KeyboardKey(beforeDisplaySymbol: "`", beforeKeyOutPut: "`_UK", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "Z", beforeKeyOutPut: "z", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "X", beforeKeyOutPut: "x", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "C", beforeKeyOutPut: "c", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "V", beforeKeyOutPut: "v", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "B", beforeKeyOutPut: "b", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "N", beforeKeyOutPut: "n", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "M", beforeKeyOutPut: "m", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: ",", beforeKeyOutPut: ",", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: ".", beforeKeyOutPut: ".", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "/", beforeKeyOutPut: "/", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "shift", beforeKeyOutPut: "right_shift", layerNumber: layerNumber, isBeforeSFSymbol: true),
                //Row6
                KeyboardKey(beforeDisplaySymbol: "fn", beforeKeyOutPut: "fn", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "control", beforeKeyOutPut: "left_control", layerNumber: layerNumber, isBeforeSFSymbol: true),
                KeyboardKey(beforeDisplaySymbol: "option", beforeKeyOutPut: "left_option", layerNumber: layerNumber, isBeforeSFSymbol: true),
                KeyboardKey(beforeDisplaySymbol: "command", beforeKeyOutPut: "left_command", layerNumber: layerNumber, isBeforeSFSymbol: true),
                KeyboardKey(beforeDisplaySymbol: "␣", beforeKeyOutPut: "spacebar", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "command", beforeKeyOutPut: "right_command", layerNumber: layerNumber, isBeforeSFSymbol: true),
                KeyboardKey(beforeDisplaySymbol: "option", beforeKeyOutPut: "right_option", layerNumber: layerNumber, isBeforeSFSymbol: true),
                KeyboardKey(beforeDisplaySymbol: "←", beforeKeyOutPut: "left_arrow", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "↑", beforeKeyOutPut: "up_arrow", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "↓", beforeKeyOutPut: "down_arrow", layerNumber: layerNumber),
                KeyboardKey(beforeDisplaySymbol: "→", beforeKeyOutPut: "right_arrow", layerNumber: layerNumber)
            ]
        }
        return keys
    }
    
}

///キーボードのキーをひとつ分書き換えるの情報を持つKeyboardKeyクラス
///前の出力・表示→後の出力・表示・修飾キーetc…
@Model
final class KeyboardKey: Identifiable, ObservableObject, Codable {
    

    var id: UUID
    var isCustomized: Bool = false//書き換えをするかどうか。出力関数でここで書き換えをしない奴を弾く。
    //書き換え前
    var beforeDisplaySymbol: String//UIの表示に使うString
    var isBeforeSFSymbol:Bool = false//UIでSFシンボル表示にするかどうか
    var beforeKeyOutPut: String//キーを押して入力される文字、キーコードリスト辞書の鍵の値
    var layerNumber: Int//レイヤー情報。0、1、2が入る予定
    
    
    //書き換え後
    var layerKeyNumber_tap: Int = 0 // レイヤー移行のキーをドロップした時にここにレイヤーナンバーが入る。それを元に色を調節する
    var layerKeyNumber_hold: Int = 0 // レイヤー移行のキーをドロップした時にここにレイヤーナンバーが入る。それを元に色を調節する
    
    var afterDisplaySymbol: String = ""//UIの表示に使うString。ユーザーが自分で変えられるようにしても良いのかも？
    var isAfterTapSFSymbol:Bool = false
    var afterKeyOutPut: String = ""//書き換え後の入力される文字、キーコードリスト辞書の鍵の値

    var tapWithModifier: Bool = false//タップに修飾キーを含めるか
    
    var tapWithShift: Bool = false
    var isTapIncludeShift: Bool = false//タップにシフトを含んだ記号などを入れた場合、上のブール値のトグルビューをDisableするためのブール値
    var tapWithControl: Bool = false
    var isTapIncludeControl: Bool = false
    var tapWithOption: Bool = false
    var isTapIncludeOption: Bool = false
    var tapWithCommand: Bool = false
    var isTapIncludeCommand: Bool = false
    var tapWithFn: Bool = false
    var isTapIncludeFn: Bool = false
    
    var isTapHoldEnabled: Bool = false//タップホールドの有効化
    var tapHoldThreshold: Double = 200.0//basic時のスレッショルドに使う
    var tapHoldType: TapHoldType = TapHoldType.basic//タップホールドの詳細な挙動
    var holdDisplaySymbol: String = ""//ホールドのUI表示用
    var isAfterHoldSFSymbol:Bool = false
    var holdKeyOutPut: String = ""//ホールドの入力される文字。キーコードリスト辞書の鍵
    
    var holdWithModifier: Bool = false//ホールドに修飾キーを含めるか
    var holdWithShift: Bool = false
    var isHoldIncludeShift: Bool = false
    var holdWithControl: Bool = false
    var isHoldIncludeControl: Bool = false
    var holdWithOption: Bool = false
    var isHoldIncludeOption: Bool = false
    var holdWithCommand: Bool = false
    var isHoldIncludeCommand: Bool = false
    var holdWithFn: Bool = false
    var isHoldIncludeFn: Bool = false
    //テキストエディタでユーザーが手打ちするカスタムjson
    var userCustomJSONEnabled: Bool = false
    var userCustomJSONContent: String = ""
    // 初期状態を表す静的プロパティ
    static let initial = KeyboardKey(
        beforeDisplaySymbol: "",
        beforeKeyOutPut: ""
    )
    
    //A-> ･⇧B -⇧^Command
    static let test = KeyboardKey(id: UUID(), isCustomized: true, beforeDisplaySymbol: "A", beforeKeyOutPut: "a", layerNumber: 2, layerKeyNumber_tap: 0, layerKeyNumber_hold: 0, afterDisplaySymbol: "B", isAfterTapSFSymbol: false, afterKeyOutPut: "b", tapWithModifier: true, tapWithShift: true, tapWithControl: true,  isTapHoldEnabled: true, tapHoldThreshold: 200, tapHoldType: .basic, holdDisplaySymbol: "command", isAfterHoldSFSymbol: true, holdKeyOutPut: "left_command", holdWithModifier: true, holdWithShift: true, holdWithControl: true)
    
    // 選択されていない状態かどうかを判断するプロパティ
    var isInitial: Bool {
        self == .initial
    }
    
    //普通のイニシャライザ
    init(beforeDisplaySymbol: String, beforeKeyOutPut: String, layerNumber: Int = 0, isBeforeSFSymbol: Bool = false) {
        self.id = UUID()
        self.beforeDisplaySymbol = beforeDisplaySymbol
        self.beforeKeyOutPut = beforeKeyOutPut
        self.layerNumber = layerNumber
        self.isBeforeSFSymbol = isBeforeSFSymbol
    }
    //全部入りイニシャライザ。テスト用
    init(id: UUID, isCustomized: Bool = false, beforeDisplaySymbol: String, isBeforeSFSymbol: Bool = false, beforeKeyOutPut: String, layerNumber: Int, layerKeyNumber_tap: Int, layerKeyNumber_hold: Int, afterDisplaySymbol: String, isAfterTapSFSymbol: Bool = false, afterKeyOutPut: String, tapWithModifier: Bool = false, tapWithShift: Bool = false, isTapIncludeShift: Bool = false, tapWithControl: Bool = false, isTapIncludeControl: Bool = false, tapWithOption: Bool = false, isTapIncludeOption: Bool = false, tapWithCommand: Bool = false, isTapIncludeCommand: Bool = false, tapWithFn: Bool = false, isTapIncludeFn: Bool = false, isTapHoldEnabled: Bool = false, tapHoldThreshold: Double, tapHoldType: TapHoldType, holdDisplaySymbol: String, isAfterHoldSFSymbol: Bool = false, holdKeyOutPut: String, holdWithModifier: Bool = false, holdWithShift: Bool = false, isHoldIncludeShift: Bool = false, holdWithControl: Bool = false, isHoldIncludeControl: Bool = false, holdWithOption: Bool = false, isHoldIncludeOption: Bool = false, holdWithCommand: Bool = false, isHoldIncludeCommand: Bool = false, holdWithFn: Bool = false, isHoldIncludeFn: Bool = false, userCustomJSONEnabled: Bool = false, userCustomJSONContent: String = "") {
        self.id = id
        self.isCustomized = isCustomized
        self.beforeDisplaySymbol = beforeDisplaySymbol
        self.isBeforeSFSymbol = isBeforeSFSymbol
        self.beforeKeyOutPut = beforeKeyOutPut
        self.layerNumber = layerNumber
        self.layerKeyNumber_tap = layerKeyNumber_tap
        self.layerKeyNumber_hold = layerKeyNumber_hold
        self.afterDisplaySymbol = afterDisplaySymbol
        self.isAfterTapSFSymbol = isAfterTapSFSymbol
        self.afterKeyOutPut = afterKeyOutPut
        self.tapWithModifier = tapWithModifier
        self.tapWithShift = tapWithShift
        self.isTapIncludeShift = isTapIncludeShift
        self.tapWithControl = tapWithControl
        self.isTapIncludeControl = isTapIncludeControl
        self.tapWithOption = tapWithOption
        self.isTapIncludeOption = isTapIncludeOption
        self.tapWithCommand = tapWithCommand
        self.isTapIncludeCommand = isTapIncludeCommand
        self.tapWithFn = tapWithFn
        self.isTapIncludeFn = isTapIncludeFn
        self.isTapHoldEnabled = isTapHoldEnabled
        self.tapHoldThreshold = tapHoldThreshold
        self.tapHoldType = tapHoldType
        self.holdDisplaySymbol = holdDisplaySymbol
        self.isAfterHoldSFSymbol = isAfterHoldSFSymbol
        self.holdKeyOutPut = holdKeyOutPut
        self.holdWithModifier = holdWithModifier
        self.holdWithShift = holdWithShift
        self.isHoldIncludeShift = isHoldIncludeShift
        self.holdWithControl = holdWithControl
        self.isHoldIncludeControl = isHoldIncludeControl
        self.holdWithOption = holdWithOption
        self.isHoldIncludeOption = isHoldIncludeOption
        self.holdWithCommand = holdWithCommand
        self.isHoldIncludeCommand = isHoldIncludeCommand
        self.holdWithFn = holdWithFn
        self.isHoldIncludeFn = isHoldIncludeFn
        self.userCustomJSONEnabled = userCustomJSONEnabled
        self.userCustomJSONContent = userCustomJSONContent
    }
    
    required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
//            self.id = try container.decode(UUID.self, forKey: .id)
            self.id = UUID()
            self.isCustomized = try container.decode(Bool.self, forKey: .isCustomized)
            self.beforeDisplaySymbol = try container.decode(String.self, forKey: .beforeDisplaySymbol)
            self.isBeforeSFSymbol = try container.decode(Bool.self, forKey: .isBeforeSFSymbol)
            self.beforeKeyOutPut = try container.decode(String.self, forKey: .beforeKeyOutPut)
            self.layerNumber = try container.decode(Int.self, forKey: .layerNumber)
            self.layerKeyNumber_tap = try container.decode(Int.self, forKey: .layerKeyNumber_tap)
            self.layerKeyNumber_hold = try container.decode(Int.self, forKey: .layerKeyNumber_hold)
            self.afterDisplaySymbol = try container.decode(String.self, forKey: .afterDisplaySymbol)
            self.isAfterTapSFSymbol = try container.decode(Bool.self, forKey: .isAfterTapSFSymbol)
            self.afterKeyOutPut = try container.decode(String.self, forKey: .afterKeyOutPut)
            self.tapWithModifier = try container.decode(Bool.self, forKey: .tapWithModifier)
            self.tapWithShift = try container.decode(Bool.self, forKey: .tapWithShift)
            self.isTapIncludeShift = try container.decode(Bool.self, forKey: .isTapIncludeShift)
            self.tapWithControl = try container.decode(Bool.self, forKey: .tapWithControl)
            self.isTapIncludeControl = try container.decode(Bool.self, forKey: .isTapIncludeControl)
            self.tapWithOption = try container.decode(Bool.self, forKey: .tapWithOption)
            self.isTapIncludeOption = try container.decode(Bool.self, forKey: .isTapIncludeOption)
            self.tapWithCommand = try container.decode(Bool.self, forKey: .tapWithCommand)
            self.isTapIncludeCommand = try container.decode(Bool.self, forKey: .isTapIncludeCommand)
            self.tapWithFn = try container.decode(Bool.self, forKey: .tapWithFn)
            self.isTapIncludeFn = try container.decode(Bool.self, forKey: .isTapIncludeFn)
            self.isTapHoldEnabled = try container.decode(Bool.self, forKey: .isTapHoldEnabled)
            self.tapHoldThreshold = try container.decode(Double.self, forKey: .tapHoldThreshold)
            self.tapHoldType = try container.decode(TapHoldType.self, forKey: .tapHoldType)
            self.holdDisplaySymbol = try container.decode(String.self, forKey: .holdDisplaySymbol)
            self.isAfterHoldSFSymbol = try container.decode(Bool.self, forKey: .isAfterHoldSFSymbol)
            self.holdKeyOutPut = try container.decode(String.self, forKey: .holdKeyOutPut)
            self.holdWithModifier = try container.decode(Bool.self, forKey: .holdWithModifier)
            self.holdWithShift = try container.decode(Bool.self, forKey: .holdWithShift)
            self.isHoldIncludeShift = try container.decode(Bool.self, forKey: .isHoldIncludeShift)
            self.holdWithControl = try container.decode(Bool.self, forKey: .holdWithControl)
            self.isHoldIncludeControl = try container.decode(Bool.self, forKey: .isHoldIncludeControl)
            self.holdWithOption = try container.decode(Bool.self, forKey: .holdWithOption)
            self.isHoldIncludeOption = try container.decode(Bool.self, forKey: .isHoldIncludeOption)
            self.holdWithCommand = try container.decode(Bool.self, forKey: .holdWithCommand)
            self.isHoldIncludeCommand = try container.decode(Bool.self, forKey: .isHoldIncludeCommand)
            self.holdWithFn = try container.decode(Bool.self, forKey: .holdWithFn)
            self.isHoldIncludeFn = try container.decode(Bool.self, forKey: .isHoldIncludeFn)
            self.userCustomJSONEnabled = try container.decode(Bool.self, forKey: .userCustomJSONEnabled)
            self.userCustomJSONContent = try container.decode(String.self, forKey: .userCustomJSONContent)
        }
    
    
    func clearPropaties() {//何も書き換えしてない状態に戻す
        self.isCustomized = false
        self.layerKeyNumber_tap = 0
        self.layerKeyNumber_hold = 0
        self.afterDisplaySymbol = ""
        self.isAfterTapSFSymbol = false
        self.afterKeyOutPut = ""
        self.isAfterTapSFSymbol = false
        self.tapWithModifier = false
        self.tapWithShift = false
        self.isTapIncludeShift = false
        self.tapWithControl = false
        self.isTapIncludeControl = false
        self.tapWithOption = false
        self.isTapIncludeOption = false
        self.tapWithCommand = false
        self.isTapIncludeCommand = false
        self.tapWithFn = false
        self.isTapIncludeFn = false
        self.isTapHoldEnabled = false
        self.tapHoldThreshold = 200.0
        self.tapHoldType = TapHoldType.basic
        self.holdDisplaySymbol = ""
        self.isAfterHoldSFSymbol = false
        self.holdKeyOutPut = ""
        self.holdWithModifier = false
        self.holdWithShift = false
        self.isHoldIncludeShift = false
        self.holdWithControl = false
        self.isHoldIncludeControl = false
        self.holdWithOption = false
        self.isHoldIncludeOption = false
        self.holdWithCommand = false
        self.isHoldIncludeCommand = false
        self.holdWithFn = false
        self.isHoldIncludeFn = false
        self.userCustomJSONEnabled = false
        self.userCustomJSONContent = ""
        
    }
}

extension KeyboardKey {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(isCustomized, forKey: .isCustomized)
        try container.encode(beforeDisplaySymbol, forKey: .beforeDisplaySymbol)
        try container.encode(isBeforeSFSymbol, forKey: .isBeforeSFSymbol)
        try container.encode(beforeKeyOutPut, forKey: .beforeKeyOutPut)
        try container.encode(layerNumber, forKey: .layerNumber)
        try container.encode(layerKeyNumber_tap, forKey: .layerKeyNumber_tap)
        try container.encode(layerKeyNumber_hold, forKey: .layerKeyNumber_hold)
        try container.encode(afterDisplaySymbol, forKey: .afterDisplaySymbol)
        try container.encode(isAfterTapSFSymbol, forKey: .isAfterTapSFSymbol)
        try container.encode(afterKeyOutPut, forKey: .afterKeyOutPut)
        try container.encode(tapWithModifier, forKey: .tapWithModifier)
        try container.encode(tapWithShift, forKey: .tapWithShift)
        try container.encode(isTapIncludeShift, forKey: .isTapIncludeShift)
        try container.encode(tapWithControl, forKey: .tapWithControl)
        try container.encode(isTapIncludeControl, forKey: .isTapIncludeControl)
        try container.encode(tapWithOption, forKey: .tapWithOption)
        try container.encode(isTapIncludeOption, forKey: .isTapIncludeOption)
        try container.encode(tapWithCommand, forKey: .tapWithCommand)
        try container.encode(isTapIncludeCommand, forKey: .isTapIncludeCommand)
        try container.encode(tapWithFn, forKey: .tapWithFn)
        try container.encode(isTapIncludeFn, forKey: .isTapIncludeFn)
        try container.encode(isTapHoldEnabled, forKey: .isTapHoldEnabled)
        try container.encode(tapHoldThreshold, forKey: .tapHoldThreshold)
        try container.encode(tapHoldType, forKey: .tapHoldType)
        try container.encode(holdDisplaySymbol, forKey: .holdDisplaySymbol)
        try container.encode(isAfterHoldSFSymbol, forKey: .isAfterHoldSFSymbol)
        try container.encode(holdKeyOutPut, forKey: .holdKeyOutPut)
        try container.encode(holdWithModifier, forKey: .holdWithModifier)
        try container.encode(holdWithShift, forKey: .holdWithShift)
        try container.encode(isHoldIncludeShift, forKey: .isHoldIncludeShift)
        try container.encode(holdWithControl, forKey: .holdWithControl)
        try container.encode(isHoldIncludeControl, forKey: .isHoldIncludeControl)
        try container.encode(holdWithOption, forKey: .holdWithOption)
        try container.encode(isHoldIncludeOption, forKey: .isHoldIncludeOption)
        try container.encode(holdWithCommand, forKey: .holdWithCommand)
        try container.encode(isHoldIncludeCommand, forKey: .isHoldIncludeCommand)
        try container.encode(holdWithFn, forKey: .holdWithFn)
        try container.encode(isHoldIncludeFn, forKey: .isHoldIncludeFn)
        try container.encode(userCustomJSONEnabled, forKey: .userCustomJSONEnabled)
        try container.encode(userCustomJSONContent, forKey: .userCustomJSONContent)
    }
    enum CodingKeys: String, CodingKey {
        case id
        case isCustomized
        case beforeDisplaySymbol
        case isBeforeSFSymbol
        case beforeKeyOutPut
        case layerNumber
        case layerKeyNumber_tap
        case layerKeyNumber_hold
        case afterDisplaySymbol
        case isAfterTapSFSymbol
        case afterKeyOutPut
        case tapWithModifier
        case tapWithShift
        case isTapIncludeShift
        case tapWithControl
        case isTapIncludeControl
        case tapWithOption
        case isTapIncludeOption
        case tapWithCommand
        case isTapIncludeCommand
        case tapWithFn
        case isTapIncludeFn
        case isTapHoldEnabled
        case tapHoldThreshold
        case tapHoldType
        case holdDisplaySymbol
        case isAfterHoldSFSymbol
        case holdKeyOutPut
        case holdWithModifier
        case holdWithShift
        case isHoldIncludeShift
        case holdWithControl
        case isHoldIncludeControl
        case holdWithOption
        case isHoldIncludeOption
        case holdWithCommand
        case isHoldIncludeCommand
        case holdWithFn
        case isHoldIncludeFn
        case userCustomJSONEnabled
        case userCustomJSONContent
    }
    
}

//ドロップの処理
extension KeyboardKey {
    func applyTapKeyCustomization(from item: CustomizeKey) {
        self.layerKeyNumber_tap = item.layerKeyNumber
        self.afterDisplaySymbol = item.afterDisplaySymbol
        self.isAfterTapSFSymbol = item.isUsingSFSymbol
        self.afterKeyOutPut = item.afterKeyOutPut
        self.isCustomized = item.isCustomized
        self.tapWithModifier = item.tapWithModifier
        self.tapWithShift = item.tapWithShift
        self.isTapIncludeShift = item.isTapIncludeShift
        self.tapWithControl = item.tapWithControl
        self.isTapIncludeControl = item.isTapIncludeControl
        self.tapWithOption = item.tapWithOption
        self.isTapIncludeOption = item.isTapIncludeOption
        self.tapWithCommand = item.isTapIncludeCommand
        self.isTapIncludeCommand = item.isTapIncludeCommand
        self.userCustomJSONEnabled = item.userCustomJSONEnabled
        self.userCustomJSONContent = item.userCustomJSONContent
    }
    func applyHoldKeyCustomization(from item: CustomizeKey) {
        self.layerKeyNumber_hold = item.layerKeyNumber
        self.holdDisplaySymbol = item.afterDisplaySymbol
        self.isAfterHoldSFSymbol = item.isUsingSFSymbol
        self.holdKeyOutPut = item.afterKeyOutPut
        self.isCustomized = item.isCustomized
        self.holdWithModifier = item.tapWithModifier
        self.holdWithShift = item.tapWithShift
        self.isHoldIncludeShift = item.isTapIncludeShift
        self.holdWithControl = item.tapWithControl
        self.isHoldIncludeControl = item.isTapIncludeControl
        self.holdWithOption = item.tapWithOption
        self.isHoldIncludeOption = item.isTapIncludeOption
        self.holdWithCommand = item.isTapIncludeCommand
        self.isHoldIncludeCommand = item.isTapIncludeCommand
    }
    
}

enum TapHoldType: String, Codable, CaseIterable{
    case basic//閾値をもつタイプ
    case chord//組み合わせでホールドになるタイプ
    case repeated//連打でリピートできるようになるタイプ
}



