///PresetやKeyboardKeyを受け取って最終的にKarabinerElementsで使えるようなjsonの中身を出力する関数群。


import Foundation
import SwiftUI

enum JSONExporterError: Error {
    case invalidKeyMapping
    case invalidKeyMappingWithKey(key: KeyboardKey)
    case noHoldKey(key:KeyboardKey)
    case emptyPreset

    var localizedDescription: String {
        switch self {
        case .invalidKeyMapping:
            return "There is a key that does not exist in the key code list."
        case .invalidKeyMappingWithKey(let key):
            return "Tap-Hold is enabled, but the Tap key is empty, or a key does not exist in the key code list: \(key.beforeDisplaySymbol)→\(key.afterDisplaySymbol) of layer\(key.layerNumber)."
        case .noHoldKey(let key):
            return "Tap-Hold is enabled, but the Hold key is empty: \(key.beforeDisplaySymbol)→\(key.afterDisplaySymbol) of layer\(key.layerNumber)"
        case .emptyPreset:
            return "This preset doesn't contain any customised keys."
        }
    }
}

struct JSONExporter {
    // 1. KeyboardKeyとPresetの出力KeyCodeType、vendorIDなどを引数に取ってStringを返す関数
    func exportKeyboardKey(_ key: KeyboardKey, keyCodeRegion: KeyCodeRegion, vendorID: String, productID: String) throws -> String? {
        //カスタマイズされてない場合はnilを返し、それ以外の場合は以下の処理を行う
        
        if !key.isCustomized { return nil } else {
            // KeyCodeMappingから「書き換え前」と「書き換え後」を取得
            guard let beforeKeyInfo: KeyCodeInfo = KeyMappings.getKeyMapping(for: keyCodeRegion, key: key.beforeKeyOutPut),
                  let afterKeyInfo: KeyCodeInfo = KeyMappings.getKeyMapping(for: keyCodeRegion, key: key.afterKeyOutPut)
            else {
                //リストにないアウトプットが出た場合の処理。アプリを普通に使う分には起こり得ないようにリストを作る
                print("unknown key here\(key.beforeKeyOutPut) to \(key.afterKeyOutPut)")
                print("beforekeyDetail: \(key.beforeDisplaySymbol), \(key.beforeKeyOutPut)")
                print("afterKeyDetail: \(key.afterDisplaySymbol), \(key.afterKeyOutPut)")
                throw JSONExporterError.invalidKeyMapping
            }
            let afterHoldKeyInfo: KeyCodeInfo
            if key.isTapHoldEnabled {
                //ここはかなりあり得るエラー。タップにドラッグ済みで、ホールドタップをトグルしたは良いが、ホールドの方にドロップしないとこの処理が発火される
                guard let holdKeyInfo = KeyMappings.getKeyMapping(for: keyCodeRegion, key: key.holdKeyOutPut) else {
                    print("unknown key here \(key.beforeKeyOutPut) to tap:\(key.afterKeyOutPut) hold:\(key.holdKeyOutPut)")
                    throw JSONExporterError.noHoldKey(key: key)
                }
                afterHoldKeyInfo = holdKeyInfo
            } else {
                //リストにないホールドアウトプットが出た場合の処理、リストを完備すれば起こり得ないはず。
                afterHoldKeyInfo = KeyCodeInfo(functionType: .keyCode, keyCodeString: "vk_none")
            }
            
            //””でくくる処理
            let beforeKeyFunctionType = "\"\(beforeKeyInfo.functionType.rawValue)\""
            let beforeKeyCode = "\"\(beforeKeyInfo.keyCodeString)\""
            
            let afterKeyFunctionType: String
            let afterKeyCode: String
            let afterKeyIncludeModifier: Bool
            //書き換え後Tap
            if afterKeyInfo.functionType == .layer {//タップにレイヤーが入ってる時は""で括らない、そしてアフターキーアップの処理を追加
                afterKeyFunctionType = "\"\(afterKeyInfo.functionType.rawValue)\""
                afterKeyCode = afterKeyInfo.keyCodeString//括らない
                
            } else if afterKeyInfo.functionType == .mouse {
                afterKeyFunctionType = "\"\(afterKeyInfo.functionType.rawValue)\""
                afterKeyCode = afterKeyInfo.keyCodeString//括らない
            } else {//それ以外の場合は””でくくる
                afterKeyFunctionType = "\"\(afterKeyInfo.functionType.rawValue)\""
                afterKeyCode = "\"\(afterKeyInfo.keyCodeString)\""
            }
            
            if afterKeyInfo.includeShift || afterKeyInfo.includeCommand || afterKeyInfo.includeOption || afterKeyInfo.includeControl || afterKeyInfo.includeFn {
                afterKeyIncludeModifier = true
            } else {
                afterKeyIncludeModifier = false
            }
            
            
            let afterHoldKeyFunctionType: String
            let afterHoldKeyCode: String
            let afterHoldKeyIncludeModifier: Bool
            //書き換え後Hold
            if afterHoldKeyInfo.functionType == . layer {
                afterHoldKeyFunctionType = "\"\(afterHoldKeyInfo.functionType.rawValue)\""
                afterHoldKeyCode = afterHoldKeyInfo.keyCodeString
            } else {
                afterHoldKeyFunctionType = "\"\(afterHoldKeyInfo.functionType.rawValue)\""
                afterHoldKeyCode = "\"\(afterHoldKeyInfo.keyCodeString)\""
            }
            //Holdが修飾キーを含む記号などであった場合
            if afterHoldKeyInfo.includeShift || afterHoldKeyInfo.includeCommand || afterHoldKeyInfo.includeOption || afterHoldKeyInfo.includeControl || afterHoldKeyInfo.includeFn {
                afterHoldKeyIncludeModifier = true
            } else {
                afterHoldKeyIncludeModifier = false
            }
            
            //ここに最終的な文字列が入る
            let singleKeyJSON: String
            
            if key.userCustomJSONEnabled {
                singleKeyJSON = key.userCustomJSONContent
                return singleKeyJSON
            }
            
            if key.isTapHoldEnabled {
                //タップホールドを使う場合
                switch key.tapHoldType {
                case .basic:
                    //ベーシックなタップホールド
                    let tapWithModifiers: String
                    if afterKeyIncludeModifier || key.tapWithModifier {
                        // 修飾キーを配列に集める
                        var tapModifiers: [String] = []
                        if afterKeyInfo.includeShift || key.tapWithShift { tapModifiers.append("\"left_shift\"") }//"left_shift"が入るように
                        if afterKeyInfo.includeCommand || key.tapWithCommand { tapModifiers.append("\"left_command\"") }
                        if afterKeyInfo.includeOption || key.tapWithOption { tapModifiers.append("\"left_option\"") }
                        if afterKeyInfo.includeControl || key.tapWithControl { tapModifiers.append("\"left_control\"") }
                        if afterKeyInfo.includeFn || key.tapWithFn { tapModifiers.append("\"fn\"") }
                        
                        // 修飾キーがない場合は空文字列、それ以外の場合は結合して文字列に変換
                        if tapModifiers.isEmpty || afterKeyInfo.functionType == .layer {
                            tapWithModifiers = "" // 修飾キーがない場合
                        } else {
                            let modifiersString = tapModifiers.joined(separator: ", ")
                            tapWithModifiers = """
,"modifiers": [\(modifiersString)]
"""
                        }
                    } else {
                        tapWithModifiers = "" // 修飾キーが使われない場合
                    }
                    let holdWithModifiers: String
                    if afterHoldKeyIncludeModifier || key.holdWithModifier {
                        // 修飾キーを配列に集める
                        var holdModifiers: [String] = []
                        if afterHoldKeyInfo.includeShift || key.holdWithShift { holdModifiers.append("\"left_shift\"") }
                        if afterHoldKeyInfo.includeCommand || key.holdWithCommand { holdModifiers.append("\"left_command\"") }
                        if afterHoldKeyInfo.includeOption || key.holdWithOption { holdModifiers.append("\"left_option\"") }
                        if afterHoldKeyInfo.includeControl || key.holdWithControl { holdModifiers.append("\"left_control\"") }
                        if afterHoldKeyInfo.includeFn || key.holdWithFn { holdModifiers.append("\"fn\"") }
                        
                        // 修飾キーがない場合は空文字列、それ以外の場合は結合して文字列に変換
                        if holdModifiers.isEmpty || afterHoldKeyInfo.functionType == .layer {
                            holdWithModifiers = "" // 修飾キーがない場合
                        } else {
                            let modifiersString = holdModifiers.joined(separator: ", ")
                            holdWithModifiers = """
,"modifiers": [\(modifiersString)]
"""
                        }
                    } else {
                        holdWithModifiers = "" // 修飾キーが使われない場合
                    }
                    
                    let afterKeyUpCode: String
                    if afterKeyInfo.functionType == .layer && afterHoldKeyInfo.functionType == .layer {
                        //タップとホールド両方にレイヤーが入ってた時の処理。まぁそんなことしてもちょっと用途を思いつけないけど変数が戻るようにしないと
                        afterKeyUpCode = """
,"to_after_key_up": [{"set_variable": [{"name": "layer\(key.layerKeyNumber_tap)","value": 0},{"name": "layer\(key.layerKeyNumber_hold)","value": 0}]}]
"""
                    }else if afterKeyInfo.functionType == .layer {
                        //書き換え後タップがレイヤーの時にAfterKeyUpを加える
                        afterKeyUpCode = """
,"to_after_key_up": [{"set_variable": {"name": "layer\(key.layerKeyNumber_tap)","value": 0}}]
"""
                    } else if afterHoldKeyInfo.functionType == .layer {
                        //書き換え後ホールドがレイヤーの時にAfterKeyUpを加える
                        afterKeyUpCode = """
,"to_after_key_up": [{"set_variable": {"name": "layer\(key.layerKeyNumber_hold)","value": 0}}]
"""
                    } else {
                        afterKeyUpCode = ""
                    }
                    
                    let layerCondition: String
                    if key.layerNumber == 0 {
                        layerCondition = ""
                    } else {
                        layerCondition = """
,{"type": "variable_if","name": "layer\(key.layerNumber)","value": 1}
"""
                    }
                    singleKeyJSON = """
{
    "type": "basic",
    "from": {\(beforeKeyFunctionType): \(beforeKeyCode),"modifiers": { "optional": ["any"] }},
    "conditions": [
        {"identifiers":  [{"vendor_id": \(vendorID),"product_id": \(productID)}],"type": "device_if"}
        \(layerCondition)
    ],
    "parameters": {
        "basic.to_if_alone_timeout_milliseconds": \(Int(key.tapHoldThreshold)),
        "basic.to_if_held_down_threshold_milliseconds": \(Int(key.tapHoldThreshold))
    },
    "to_if_alone": [{"halt": true, \(afterKeyFunctionType): \(afterKeyCode) \(tapWithModifiers)}],
    "to_delayed_action": {
        "to_if_canceled": [{\(afterKeyFunctionType): \(afterKeyCode) \(tapWithModifiers)}]
    },
    "to_if_held_down": [{\(afterHoldKeyFunctionType): \(afterHoldKeyCode) \(holdWithModifiers)}]
    \(afterKeyUpCode)
}
"""
                case .chord :
                    //chordタップホールドタイプ
                    let tapWithModifiers: String
                    if afterKeyIncludeModifier || key.tapWithModifier {
                        // 修飾キーを配列に集める
                        var tapModifiers: [String] = []
                        if afterKeyInfo.includeShift || key.tapWithShift { tapModifiers.append("\"left_shift\"") }//"left_shift"が入るように
                        if afterKeyInfo.includeCommand || key.tapWithCommand { tapModifiers.append("\"left_command\"") }
                        if afterKeyInfo.includeOption || key.tapWithOption { tapModifiers.append("\"left_option\"") }
                        if afterKeyInfo.includeControl || key.tapWithControl { tapModifiers.append("\"left_control\"") }
                        if afterKeyInfo.includeFn || key.tapWithFn { tapModifiers.append("\"fn\"") }
                        
                        // 修飾キーがない場合は空文字列、それ以外の場合は結合して文字列に変換
                        if tapModifiers.isEmpty || afterKeyInfo.functionType == .layer {
                            tapWithModifiers = "" // 修飾キーがない場合
                        } else {
                            let modifiersString = tapModifiers.joined(separator: ", ")
                            tapWithModifiers = """
,"modifiers": [\(modifiersString)]
"""
                        }
                    } else {
                        tapWithModifiers = "" // 修飾キーが使われない場合
                    }
                    let holdWithModifiers: String
                    if afterHoldKeyIncludeModifier || key.holdWithModifier {
                        // 修飾キーを配列に集める
                        var holdModifiers: [String] = []
                        if afterHoldKeyInfo.includeShift || key.holdWithShift { holdModifiers.append("\"left_shift\"") }
                        if afterHoldKeyInfo.includeCommand || key.holdWithCommand { holdModifiers.append("\"left_command\"") }
                        if afterHoldKeyInfo.includeOption || key.holdWithOption { holdModifiers.append("\"left_option\"") }
                        if afterHoldKeyInfo.includeControl || key.holdWithControl { holdModifiers.append("\"left_control\"") }
                        if afterHoldKeyInfo.includeFn || key.holdWithFn { holdModifiers.append("\"fn\"") }
                        
                        // 修飾キーがない場合は空文字列、それ以外の場合は結合して文字列に変換
                        if holdModifiers.isEmpty || afterHoldKeyInfo.functionType == .layer {
                            holdWithModifiers = "" // 修飾キーがない場合
                        } else {
                            let modifiersString = holdModifiers.joined(separator: ", ")
                            holdWithModifiers = """
,"modifiers": [\(modifiersString)]
"""
                        }
                    } else {
                        holdWithModifiers = "" // 修飾キーが使われない場合
                    }
                    
                    let afterKeyUpCode: String
                    if afterKeyInfo.functionType == .layer && afterHoldKeyInfo.functionType == .layer {
                        afterKeyUpCode = """
,"to_after_key_up": [{"set_variable": {"name": "layer\(key.layerKeyNumber_tap)","value": 0},{"name": "layer\(key.layerKeyNumber_hold)","value": 0}}]
"""
                    }else if afterKeyInfo.functionType == .layer {
                        //書き換え後のキーがレイヤーの時にAfterKeyUpを加えるための変数追加
                        afterKeyUpCode = """
,"to_after_key_up": [{"set_variable": {"name": "layer\(key.layerKeyNumber_tap)","value": 0}}]
"""
                    } else if afterHoldKeyInfo.functionType == .layer {
                        afterKeyUpCode = """
,"to_after_key_up": [{"set_variable": {"name": "layer\(key.layerKeyNumber_hold)","value": 0}}]
"""
                    } else {
                        afterKeyUpCode = ""
                    }
                    
                    let layerCondition: String
                    if key.layerNumber == 0 {
                        layerCondition = ""
                    } else {
                        layerCondition = """
,{"type": "variable_if","name": "layer\(key.layerNumber)","value": 1}
"""
                    }
                    singleKeyJSON = """
{
    "type": "basic",
    "from": {\(beforeKeyFunctionType): \(beforeKeyCode),"modifiers": { "optional": ["any"] }},
    "conditions": [
        {"identifiers":  [{"vendor_id": \(vendorID),"product_id": \(productID)}],"type": "device_if"}
        \(layerCondition)
    ],
    "to_if_alone": [{\(afterKeyFunctionType): \(afterKeyCode) \(tapWithModifiers)}],
    "to": [{\(afterHoldKeyFunctionType): \(afterHoldKeyCode) \(holdWithModifiers)}]
    \(afterKeyUpCode)\(holdWithModifiers)
}
"""
                case .repeated:
                    //Repeatタップホールドの場合
                    let tapWithModifiers: String
                    if afterKeyIncludeModifier || key.tapWithModifier {
                        // 修飾キーを配列に集める
                        var tapModifiers: [String] = []
                        if afterKeyInfo.includeShift || key.tapWithShift { tapModifiers.append("\"left_shift\"") }//"left_shift"が入るように
                        if afterKeyInfo.includeCommand || key.tapWithCommand { tapModifiers.append("\"left_command\"") }
                        if afterKeyInfo.includeOption || key.tapWithOption { tapModifiers.append("\"left_option\"") }
                        if afterKeyInfo.includeControl || key.tapWithControl { tapModifiers.append("\"left_control\"") }
                        if afterKeyInfo.includeFn || key.tapWithFn { tapModifiers.append("\"fn\"") }
                        
                        // 修飾キーがない場合は空文字列、それ以外の場合は結合して文字列に変換
                        if tapModifiers.isEmpty || afterKeyInfo.functionType == .layer {
                            tapWithModifiers = "" // 修飾キーがない場合
                        } else {
                            let modifiersString = tapModifiers.joined(separator: ", ")
                            tapWithModifiers = """
,"modifiers": [\(modifiersString)]
"""
                        }
                    } else {
                        tapWithModifiers = "" // 修飾キーが使われない場合
                    }
                    let holdWithModifiers: String
                    if afterHoldKeyIncludeModifier || key.holdWithModifier {
                        // 修飾キーを配列に集める
                        var holdModifiers: [String] = []
                        if afterHoldKeyInfo.includeShift || key.holdWithShift { holdModifiers.append("\"left_shift\"") }
                        if afterHoldKeyInfo.includeCommand || key.holdWithCommand { holdModifiers.append("\"left_command\"") }
                        if afterHoldKeyInfo.includeOption || key.holdWithOption { holdModifiers.append("\"left_option\"") }
                        if afterHoldKeyInfo.includeControl || key.holdWithControl { holdModifiers.append("\"left_control\"") }
                        if afterHoldKeyInfo.includeFn || key.holdWithFn { holdModifiers.append("\"fn\"") }
                        
                        // 修飾キーがない場合は空文字列、それ以外の場合は結合して文字列に変換
                        if holdModifiers.isEmpty || afterHoldKeyInfo.functionType == .layer {
                            holdWithModifiers = "" // 修飾キーがない場合
                        } else {
                            let modifiersString = holdModifiers.joined(separator: ", ")
                            holdWithModifiers = """
,"modifiers": [\(modifiersString)]
"""
                        }
                    } else {
                        holdWithModifiers = "" // 修飾キーが使われない場合
                    }
                    
                    let afterKeyUpCode: String
                    if afterKeyInfo.functionType == .layer && afterHoldKeyInfo.functionType == .layer {
                        afterKeyUpCode = """
,"to_after_key_up": [{"set_variable": {"name": "layer\(key.layerKeyNumber_tap)","value": 0},{"name": "layer\(key.layerKeyNumber_hold)","value": 0}}]
"""
                    }else if afterKeyInfo.functionType == .layer {
                        //書き換え後のキーがレイヤーの時にAfterKeyUpを加えるための変数追加
                        afterKeyUpCode = """
,"to_after_key_up": [{"set_variable": {"name": "layer\(key.layerKeyNumber_tap)","value": 0}}]
"""
                    } else if afterHoldKeyInfo.functionType == .layer {
                        afterKeyUpCode = """
,"to_after_key_up": [{"set_variable": {"name": "layer\(key.layerKeyNumber_hold)","value": 0}}]
"""
                    } else {
                        afterKeyUpCode = ""
                    }
                    
                    let layerCondition: String
                    if key.layerNumber == 0 {
                        layerCondition = ""
                    } else {
                        layerCondition = """
,{"type": "variable_if","name": "layer\(key.layerNumber)","value": 1}
"""
                    }
                    
                    singleKeyJSON = """
{
    "type": "basic",
    "from": {\(beforeKeyFunctionType): \(beforeKeyCode),"modifiers": { "optional": ["any"] }},
    "conditions": [
        {"identifiers":  [{"vendor_id": \(vendorID),"product_id": \(productID)}],"type": "device_if"}
        \(layerCondition),
        {"type": "variable_if","name": "\(key.id)-Repeat","value": 1}
    ],
    "to": [{\(afterKeyFunctionType): \(afterKeyCode) \(tapWithModifiers)}]
},    
{
    "type": "basic",
    "from": {\(beforeKeyFunctionType): \(beforeKeyCode),"modifiers": { "optional": ["any"] }},
    "conditions": [
        {"identifiers":  [{"vendor_id": \(vendorID),"product_id": \(productID)}],"type": "device_if"}
        \(layerCondition)
    ],
    "to_if_alone": [{\(afterKeyFunctionType): \(afterKeyCode) \(tapWithModifiers)}],
    "to": [
        {"set_variable": {"name": "\(key.id)-Repeat","value": 1}},
        {\(afterHoldKeyFunctionType): \(afterHoldKeyCode) \(holdWithModifiers)}
    ],
    "to_delayed_action": {
        "to_if_invoked": [{"set_variable": {"name": "\(key.id)-Repeat","value": 0}}],
        "to_if_canceled": [{"set_variable": {"name": "\(key.id)-Repeat","value": 0}}]
    }
    \(afterKeyUpCode)
}
"""
                }
            } else {
                //シンプルな書き換え
                let tapWithModifiers: String
                if afterKeyIncludeModifier || key.tapWithModifier {
                    // 修飾キーを配列に集める
                    var tapModifiers: [String] = []
                    if afterKeyInfo.includeShift || key.tapWithShift { tapModifiers.append("\"left_shift\"") }//"left_shift"が入るように
                    if afterKeyInfo.includeCommand || key.tapWithCommand { tapModifiers.append("\"left_command\"") }
                    if afterKeyInfo.includeOption || key.tapWithOption { tapModifiers.append("\"left_option\"") }
                    if afterKeyInfo.includeControl || key.tapWithControl { tapModifiers.append("\"left_control\"") }
                    if afterKeyInfo.includeFn || key.tapWithFn { tapModifiers.append("\"fn\"") }
                    
                    // 修飾キーがない場合は空文字列、それ以外の場合は結合して文字列に変換
                    if tapModifiers.isEmpty || afterKeyInfo.functionType == .layer {
                        tapWithModifiers = "" // 修飾キーがない場合
                    } else {
                        let modifiersString = tapModifiers.joined(separator: ", ")
                        tapWithModifiers = """
,"modifiers": [\(modifiersString)]
"""
                    }
                } else {
                    tapWithModifiers = "" // 修飾キーが使われない場合
                }
                
                let afterKeyUpCode: String
                if afterKeyInfo.functionType == .layer {//書き換え後のキーがレイヤーの時にAfterKeyUpを加えるための変数追加
                    afterKeyUpCode = """
,"to_after_key_up": [{"set_variable": {"name": "layer\(key.layerKeyNumber_tap)","value": 0}}]
"""
                } else {
                    afterKeyUpCode = ""
                }
                
                let layerCondition: String
                if key.layerNumber == 0 {
                    layerCondition = ""
                } else {
                    layerCondition = """
,{"type": "variable_if","name": "layer\(key.layerNumber)","value": 1}
"""
                }
                
                singleKeyJSON = """
{
    "type": "basic",
    "from": {\(beforeKeyFunctionType): \(beforeKeyCode),"modifiers": { "optional": ["any"] }},
    "conditions": [
        {"identifiers":  [{"vendor_id": \(vendorID),"product_id": \(productID)}],"type": "device_if"}
        \(layerCondition)
    ],
    "to": [{ \(afterKeyFunctionType): \(afterKeyCode) \(tapWithModifiers)}]
    \(afterKeyUpCode)
}
"""
            }
            return singleKeyJSON
        }
    }
    
    // 2. [KeyboardKey]を引数に取る関数
    func exportLayer(_ keys: [KeyboardKey], _ preset: Preset, layerNumber: Int) throws -> String? {
        var layerMap: [String] = []//ここに入れてく
        for key in keys {
            do {
                if let keyJSON = try exportKeyboardKey(key, keyCodeRegion: preset.keyCodeRegion, vendorID: preset.vendorID, productID: preset.productID) {
                    layerMap.append(keyJSON)
                }
            } catch {
                throw error
            }
        }
        guard !layerMap.isEmpty else {
            return nil // 空のレイヤーの場合はnilを返す
        }
        let layerMapJSON = layerMap.joined(separator: ", ")
        
        
        let layerJSON: String = """
{
    "description": "\(preset.presetName)_layer\(layerNumber)",
    "manipulators": [
        \(layerMapJSON)
    ]
}
"""
        return layerJSON
    }
    
    // 3. Presetを引数に取る関数
    func exportPreset(_ preset: Preset) throws -> String {
        var layers: [String] = []
        
        
        do {
            if let layer1 = try exportLayer(preset.layer1, preset, layerNumber: 1) {
                layers.append(layer1)
            }
        } catch {
            throw error  // エラーを上位にスロー
        }
        
        do {
            if let layer2 = try exportLayer(preset.layer2, preset, layerNumber: 2) {
                layers.append(layer2)
            }
        } catch {
            throw error  // エラーを上位にスロー
        }
        do {
            if let layer3 = try exportLayer(preset.layer3, preset, layerNumber: 3) {
                layers.append(layer3)
            }
        } catch {
            throw error  // エラーを上位にスロー
        }
        do {
            if let layer4 = try exportLayer(preset.layer4, preset, layerNumber: 4) {
                layers.append(layer4)
            }
        } catch {
            throw error  // エラーを上位にスロー
        }
        do {
            if let layer5 = try exportLayer(preset.layer5, preset, layerNumber: 5) {
                layers.append(layer5)
            }
        } catch {
            throw error  // エラーを上位にスロー
        }
        
        do {
            if let layer6 = try exportLayer(preset.layer6, preset, layerNumber: 6) {
                layers.append(layer6)
            }
        } catch {
            throw error  // エラーを上位にスロー
        }
        
        do {
            if let layer7 = try exportLayer(preset.layer7, preset, layerNumber: 7) {
                layers.append(layer7)
            }
        } catch {
            throw error  // エラーを上位にスロー
        }
        
        do {
            if let layer8 = try exportLayer(preset.layer8, preset, layerNumber: 8) {
                layers.append(layer8)
            }
        } catch {
            throw error  // エラーを上位にスロー
        }
        
        do {
            if let layer0 = try exportLayer(preset.layer0, preset, layerNumber: 0) {
                layers.append(layer0)
            }
        } catch {
            throw error  // エラーを上位にスロー
        }
        
        guard !layers.isEmpty else {
            throw JSONExporterError.emptyPreset
        }
        let layersJSON = layers.joined(separator: ", ")
        let date = Date()
        let presetJSON: String = """
{
    "title": "\(date.toStringWithCurrentLocale())_\(preset.presetName)",
    "rules": [
        \(layersJSON)
    ]
}
"""
        return presetJSON
    }
    
    //実際にJSONとして出力する関数
    static func exportJSON(_ preset: Preset, showingAlert: Binding<Bool>, alertMessage: Binding<String>, animationBool: Binding<Bool>) {
        let exporter = JSONExporter()
        
        do {
            let json = try exporter.exportPreset(preset)
            
            let savePanel = NSSavePanel()
            savePanel.allowedContentTypes = [.json]
            savePanel.nameFieldStringValue = "\(preset.presetName).json"
            
            savePanel.begin { result in
                if result == .OK {
                    guard let url = savePanel.url else {
                        showAlert(message: "保存先URLの取得に失敗しました。", showingAlert: showingAlert, alertMessage: alertMessage)
                        return
                    }
                    
                    do {
                        try json.write(to: url, atomically: true, encoding: .utf8)
                        NSWorkspace.shared.activateFileViewerSelecting([url])
                        print("JSONファイルが正常にエクスポートされました。")
                        withAnimation {
                            animationBool.wrappedValue = true
                        }
//                        showAlert(message: "JSONファイルが正常にエクスポートされました。", showingAlert: showingAlert, alertMessage: alertMessage)
                    } catch {
                        showAlert(message: "JSONのエクスポート中にエラーが発生しました: \(error.localizedDescription)", showingAlert: showingAlert, alertMessage: alertMessage)
                    }
                }
            }
        } catch let error as JSONExporterError {
            // JSONExporterError の場合はrawValueを使ってエラーメッセージを表示
            showAlert(message: error.localizedDescription, showingAlert: showingAlert, alertMessage: alertMessage)
        } catch {
            // その他のエラーは localizedDescription を表示
            showAlert(message: "JSONのエクスポート中に不明なエラーが発生しました: \(error.localizedDescription)", showingAlert: showingAlert, alertMessage: alertMessage)
        }
    }
    
    private static func showAlert(message: String, showingAlert: Binding<Bool>, alertMessage: Binding<String>) {
        alertMessage.wrappedValue = message
        showingAlert.wrappedValue = true
    }
}

extension Date {

    func toStringWithCurrentLocale() -> String {

        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale.current
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        return formatter.string(from: self)
    }

}

extension JSONExporter {
    func exportKeyboardKey_userCustomJSON(_ key: KeyboardKey, keyCodeRegion: KeyCodeRegion, vendorID: String, productID: String) throws -> String? {
        //カスタマイズされてない場合はnilを返し、それ以外の場合は以下の処理を行う
        
        if !key.isCustomized { return nil } else {
            // KeyCodeMappingから「書き換え前」と「書き換え後」を取得
            guard let beforeKeyInfo: KeyCodeInfo = KeyMappings.getKeyMapping(for: keyCodeRegion, key: key.beforeKeyOutPut),
                  let afterKeyInfo: KeyCodeInfo = KeyMappings.getKeyMapping(for: keyCodeRegion, key: key.afterKeyOutPut)
            else {
                //リストにないアウトプットが出た場合の処理。アプリを普通に使う分には起こり得ないようにリストを作る
                print("unknown key here\(key.beforeKeyOutPut) to \(key.afterKeyOutPut)")
                print("beforekeyDetail: \(key.beforeDisplaySymbol), \(key.beforeKeyOutPut)")
                print("afterKeyDetail: \(key.afterDisplaySymbol), \(key.afterKeyOutPut)")
                throw JSONExporterError.invalidKeyMapping
            }
            let afterHoldKeyInfo: KeyCodeInfo
            if key.isTapHoldEnabled {
                //ここはかなりあり得るエラー。タップにドラッグ済みで、ホールドタップをトグルしたは良いが、ホールドの方にドロップしないとこの処理が発火される
                guard let holdKeyInfo = KeyMappings.getKeyMapping(for: keyCodeRegion, key: key.holdKeyOutPut) else {
                    print("unknown key here \(key.beforeKeyOutPut) to tap:\(key.afterKeyOutPut) hold:\(key.holdKeyOutPut)")
                    throw JSONExporterError.noHoldKey(key: key)
                }
                afterHoldKeyInfo = holdKeyInfo
            } else {
                //リストにないホールドアウトプットが出た場合の処理、リストを完備すれば起こり得ないはず。
                afterHoldKeyInfo = KeyCodeInfo(functionType: .keyCode, keyCodeString: "vk_none")
            }
            
            //””でくくる処理
            let beforeKeyFunctionType = "\"\(beforeKeyInfo.functionType.rawValue)\""
            let beforeKeyCode = "\"\(beforeKeyInfo.keyCodeString)\""
            
            let afterKeyFunctionType: String
            let afterKeyCode: String
            let afterKeyIncludeModifier: Bool
            //書き換え後Tap
            if afterKeyInfo.functionType == .layer || afterKeyInfo.functionType == .mouse {
                afterKeyFunctionType = "\"\(afterKeyInfo.functionType.rawValue)\""
                afterKeyCode = afterKeyInfo.keyCodeString//括らない
            } else {//それ以外の場合は””でくくる
                afterKeyFunctionType = "\"\(afterKeyInfo.functionType.rawValue)\""
                afterKeyCode = "\"\(afterKeyInfo.keyCodeString)\""
            }
            
            if afterKeyInfo.includeShift || afterKeyInfo.includeCommand || afterKeyInfo.includeOption || afterKeyInfo.includeControl || afterKeyInfo.includeFn {
                afterKeyIncludeModifier = true
            } else {
                afterKeyIncludeModifier = false
            }
            
            
            let afterHoldKeyFunctionType: String
            let afterHoldKeyCode: String
            let afterHoldKeyIncludeModifier: Bool
            //書き換え後Hold
            if afterHoldKeyInfo.functionType == . layer {
                afterHoldKeyFunctionType = "\"\(afterHoldKeyInfo.functionType.rawValue)\""
                afterHoldKeyCode = afterHoldKeyInfo.keyCodeString
            } else {
                afterHoldKeyFunctionType = "\"\(afterHoldKeyInfo.functionType.rawValue)\""
                afterHoldKeyCode = "\"\(afterHoldKeyInfo.keyCodeString)\""
            }
            //Holdが修飾キーを含む記号などであった場合
            if afterHoldKeyInfo.includeShift || afterHoldKeyInfo.includeCommand || afterHoldKeyInfo.includeOption || afterHoldKeyInfo.includeControl || afterHoldKeyInfo.includeFn {
                afterHoldKeyIncludeModifier = true
            } else {
                afterHoldKeyIncludeModifier = false
            }
            
            //ここに最終的な文字列が入る
            let singleKeyJSON: String
            
//            if key.userCustomJSONEnabled {
//                singleKeyJSON = key.userCustomJSONContent
//                return singleKeyJSON
//            }
            
            if key.isTapHoldEnabled {
                //タップホールドを使う場合
                switch key.tapHoldType {
                case .basic:
                    //ベーシックなタップホールド
                    let tapWithModifiers: String
                    if afterKeyIncludeModifier || key.tapWithModifier {
                        // 修飾キーを配列に集める
                        var tapModifiers: [String] = []
                        if afterKeyInfo.includeShift || key.tapWithShift { tapModifiers.append("\"left_shift\"") }//"left_shift"が入るように
                        if afterKeyInfo.includeCommand || key.tapWithCommand { tapModifiers.append("\"left_command\"") }
                        if afterKeyInfo.includeOption || key.tapWithOption { tapModifiers.append("\"left_option\"") }
                        if afterKeyInfo.includeControl || key.tapWithControl { tapModifiers.append("\"left_control\"") }
                        if afterKeyInfo.includeFn || key.tapWithFn { tapModifiers.append("\"fn\"") }
                        
                        // 修飾キーがない場合は空文字列、それ以外の場合は結合して文字列に変換
                        if tapModifiers.isEmpty || afterKeyInfo.functionType == .layer {
                            tapWithModifiers = "" // 修飾キーがない場合
                        } else {
                            let modifiersString = tapModifiers.joined(separator: ", ")
                            tapWithModifiers = """
,"modifiers": [\(modifiersString)]
"""
                        }
                    } else {
                        tapWithModifiers = "" // 修飾キーが使われない場合
                    }
                    let holdWithModifiers: String
                    if afterHoldKeyIncludeModifier || key.holdWithModifier {
                        // 修飾キーを配列に集める
                        var holdModifiers: [String] = []
                        if afterHoldKeyInfo.includeShift || key.holdWithShift { holdModifiers.append("\"left_shift\"") }
                        if afterHoldKeyInfo.includeCommand || key.holdWithCommand { holdModifiers.append("\"left_command\"") }
                        if afterHoldKeyInfo.includeOption || key.holdWithOption { holdModifiers.append("\"left_option\"") }
                        if afterHoldKeyInfo.includeControl || key.holdWithControl { holdModifiers.append("\"left_control\"") }
                        if afterHoldKeyInfo.includeFn || key.holdWithFn { holdModifiers.append("\"fn\"") }
                        
                        // 修飾キーがない場合は空文字列、それ以外の場合は結合して文字列に変換
                        if holdModifiers.isEmpty || afterHoldKeyInfo.functionType == .layer {
                            holdWithModifiers = "" // 修飾キーがない場合
                        } else {
                            let modifiersString = holdModifiers.joined(separator: ", ")
                            holdWithModifiers = """
,"modifiers": [\(modifiersString)]
"""
                        }
                    } else {
                        holdWithModifiers = "" // 修飾キーが使われない場合
                    }
                    
                    let afterKeyUpCode: String
                    if afterKeyInfo.functionType == .layer && afterHoldKeyInfo.functionType == .layer {
                        afterKeyUpCode = """
,"to_after_key_up": [{"set_variable": {"name": "layer\(key.layerKeyNumber_tap)","value": 0},{"name": "layer\(key.layerKeyNumber_hold)","value": 0}}]
"""
                    }else if afterKeyInfo.functionType == .layer {
                        //書き換え後のキーがレイヤーの時にAfterKeyUpを加えるための変数追加
                        afterKeyUpCode = """
,"to_after_key_up": [{"set_variable": {"name": "layer\(key.layerKeyNumber_tap)","value": 0}}]
"""
                    } else if afterHoldKeyInfo.functionType == .layer {
                        afterKeyUpCode = """
,"to_after_key_up": [{"set_variable": {"name": "layer\(key.layerKeyNumber_hold)","value": 0}}]
"""
                    } else {
                        afterKeyUpCode = ""
                    }
                    
                    let layerCondition: String
                    if key.layerNumber == 0 {
                        layerCondition = ""
                    } else {
                        layerCondition = """
,{"type": "variable_if","name": "layer\(key.layerNumber)","value": 1}
"""
                    }
                    singleKeyJSON = """
{
    "type": "basic",
    "from": {\(beforeKeyFunctionType): \(beforeKeyCode),"modifiers": { "optional": ["any"] }},
    "conditions": [
        {"identifiers":  [{"vendor_id": \(vendorID),"product_id": \(productID)}],"type": "device_if"}
        \(layerCondition)
    ],
    "parameters": {
        "basic.to_if_alone_timeout_milliseconds": \(Int(key.tapHoldThreshold)),
        "basic.to_if_held_down_threshold_milliseconds": \(Int(key.tapHoldThreshold))
    },
    "to_if_alone": [{"halt": true, \(afterKeyFunctionType): \(afterKeyCode) \(tapWithModifiers)}],
    "to_delayed_action": {
        "to_if_canceled": [{\(afterKeyFunctionType): \(afterKeyCode) \(tapWithModifiers)}]
    },
    "to_if_held_down": [{\(afterHoldKeyFunctionType): \(afterHoldKeyCode) \(holdWithModifiers)}]
    \(afterKeyUpCode)
}
"""
                case .chord :
                    //chordタップホールドタイプ
                    let tapWithModifiers: String
                    if afterKeyIncludeModifier || key.tapWithModifier {
                        // 修飾キーを配列に集める
                        var tapModifiers: [String] = []
                        if afterKeyInfo.includeShift || key.tapWithShift { tapModifiers.append("\"left_shift\"") }//"left_shift"が入るように
                        if afterKeyInfo.includeCommand || key.tapWithCommand { tapModifiers.append("\"left_command\"") }
                        if afterKeyInfo.includeOption || key.tapWithOption { tapModifiers.append("\"left_option\"") }
                        if afterKeyInfo.includeControl || key.tapWithControl { tapModifiers.append("\"left_control\"") }
                        if afterKeyInfo.includeFn || key.tapWithFn { tapModifiers.append("\"fn\"") }
                        
                        // 修飾キーがない場合は空文字列、それ以外の場合は結合して文字列に変換
                        if tapModifiers.isEmpty || afterKeyInfo.functionType == .layer {
                            tapWithModifiers = "" // 修飾キーがない場合
                        } else {
                            let modifiersString = tapModifiers.joined(separator: ", ")
                            tapWithModifiers = """
,"modifiers": [\(modifiersString)]
"""
                        }
                    } else {
                        tapWithModifiers = "" // 修飾キーが使われない場合
                    }
                    let holdWithModifiers: String
                    if afterHoldKeyIncludeModifier || key.holdWithModifier {
                        // 修飾キーを配列に集める
                        var holdModifiers: [String] = []
                        if afterHoldKeyInfo.includeShift || key.holdWithShift { holdModifiers.append("\"left_shift\"") }
                        if afterHoldKeyInfo.includeCommand || key.holdWithCommand { holdModifiers.append("\"left_command\"") }
                        if afterHoldKeyInfo.includeOption || key.holdWithOption { holdModifiers.append("\"left_option\"") }
                        if afterHoldKeyInfo.includeControl || key.holdWithControl { holdModifiers.append("\"left_control\"") }
                        if afterHoldKeyInfo.includeFn || key.holdWithFn { holdModifiers.append("\"fn\"") }
                        
                        // 修飾キーがない場合は空文字列、それ以外の場合は結合して文字列に変換
                        if holdModifiers.isEmpty || afterHoldKeyInfo.functionType == .layer {
                            holdWithModifiers = "" // 修飾キーがない場合
                        } else {
                            let modifiersString = holdModifiers.joined(separator: ", ")
                            holdWithModifiers = """
,"modifiers": [\(modifiersString)]
"""
                        }
                    } else {
                        holdWithModifiers = "" // 修飾キーが使われない場合
                    }
                    
                    let afterKeyUpCode: String
                    if afterKeyInfo.functionType == .layer && afterHoldKeyInfo.functionType == .layer {
                        afterKeyUpCode = """
,"to_after_key_up": [{"set_variable": {"name": "layer\(key.layerKeyNumber_tap)","value": 0},{"name": "layer\(key.layerKeyNumber_hold)","value": 0}}]
"""
                    }else if afterKeyInfo.functionType == .layer {
                        //書き換え後のキーがレイヤーの時にAfterKeyUpを加えるための変数追加
                        afterKeyUpCode = """
,"to_after_key_up": [{"set_variable": {"name": "layer\(key.layerKeyNumber_tap)","value": 0}}]
"""
                    } else if afterHoldKeyInfo.functionType == .layer {
                        afterKeyUpCode = """
,"to_after_key_up": [{"set_variable": {"name": "layer\(key.layerKeyNumber_hold)","value": 0}}]
"""
                    } else {
                        afterKeyUpCode = ""
                    }
                    
                    let layerCondition: String
                    if key.layerNumber == 0 {
                        layerCondition = ""
                    } else {
                        layerCondition = """
,{"type": "variable_if","name": "layer\(key.layerNumber)","value": 1}
"""
                    }
                    singleKeyJSON = """
{
    "type": "basic",
    "from": {\(beforeKeyFunctionType): \(beforeKeyCode),"modifiers": { "optional": ["any"] }},
    "conditions": [
        {"identifiers":  [{"vendor_id": \(vendorID),"product_id": \(productID)}],"type": "device_if"}
        \(layerCondition)
    ],
    "to_if_alone": [{\(afterKeyFunctionType): \(afterKeyCode) \(tapWithModifiers)}],
    "to": [{\(afterHoldKeyFunctionType): \(afterHoldKeyCode) \(holdWithModifiers)}]
    \(afterKeyUpCode)\(holdWithModifiers)
}
"""
                case .repeated:
                    //Repeatタップホールドの場合
                    let tapWithModifiers: String
                    if afterKeyIncludeModifier || key.tapWithModifier {
                        // 修飾キーを配列に集める
                        var tapModifiers: [String] = []
                        if afterKeyInfo.includeShift || key.tapWithShift { tapModifiers.append("\"left_shift\"") }//"left_shift"が入るように
                        if afterKeyInfo.includeCommand || key.tapWithCommand { tapModifiers.append("\"left_command\"") }
                        if afterKeyInfo.includeOption || key.tapWithOption { tapModifiers.append("\"left_option\"") }
                        if afterKeyInfo.includeControl || key.tapWithControl { tapModifiers.append("\"left_control\"") }
                        if afterKeyInfo.includeFn || key.tapWithFn { tapModifiers.append("\"fn\"") }
                        
                        // 修飾キーがない場合は空文字列、それ以外の場合は結合して文字列に変換
                        if tapModifiers.isEmpty || afterKeyInfo.functionType == .layer {
                            tapWithModifiers = "" // 修飾キーがない場合
                        } else {
                            let modifiersString = tapModifiers.joined(separator: ", ")
                            tapWithModifiers = """
,"modifiers": [\(modifiersString)]
"""
                        }
                    } else {
                        tapWithModifiers = "" // 修飾キーが使われない場合
                    }
                    let holdWithModifiers: String
                    if afterHoldKeyIncludeModifier || key.holdWithModifier {
                        // 修飾キーを配列に集める
                        var holdModifiers: [String] = []
                        if afterHoldKeyInfo.includeShift || key.holdWithShift { holdModifiers.append("\"left_shift\"") }
                        if afterHoldKeyInfo.includeCommand || key.holdWithCommand { holdModifiers.append("\"left_command\"") }
                        if afterHoldKeyInfo.includeOption || key.holdWithOption { holdModifiers.append("\"left_option\"") }
                        if afterHoldKeyInfo.includeControl || key.holdWithControl { holdModifiers.append("\"left_control\"") }
                        if afterHoldKeyInfo.includeFn || key.holdWithFn { holdModifiers.append("\"fn\"") }
                        
                        // 修飾キーがない場合は空文字列、それ以外の場合は結合して文字列に変換
                        if holdModifiers.isEmpty || afterHoldKeyInfo.functionType == .layer {
                            holdWithModifiers = "" // 修飾キーがない場合
                        } else {
                            let modifiersString = holdModifiers.joined(separator: ", ")
                            holdWithModifiers = """
,"modifiers": [\(modifiersString)]
"""
                        }
                    } else {
                        holdWithModifiers = "" // 修飾キーが使われない場合
                    }
                    
                    let afterKeyUpCode: String
                    if afterKeyInfo.functionType == .layer && afterHoldKeyInfo.functionType == .layer {
                        afterKeyUpCode = """
,"to_after_key_up": [{"set_variable": {"name": "layer\(key.layerKeyNumber_tap)","value": 0},{"name": "layer\(key.layerKeyNumber_hold)","value": 0}}]
"""
                    }else if afterKeyInfo.functionType == .layer {
                        //書き換え後のキーがレイヤーの時にAfterKeyUpを加えるための変数追加
                        afterKeyUpCode = """
,"to_after_key_up": [{"set_variable": {"name": "layer\(key.layerKeyNumber_tap)","value": 0}}]
"""
                    } else if afterHoldKeyInfo.functionType == .layer {
                        afterKeyUpCode = """
,"to_after_key_up": [{"set_variable": {"name": "layer\(key.layerKeyNumber_hold)","value": 0}}]
"""
                    } else {
                        afterKeyUpCode = ""
                    }
                    
                    let layerCondition: String
                    if key.layerNumber == 0 {
                        layerCondition = ""
                    } else {
                        layerCondition = """
,{"type": "variable_if","name": "layer\(key.layerNumber)","value": 1}
"""
                    }
                    
                    singleKeyJSON = """
{
    "type": "basic",
    "from": {\(beforeKeyFunctionType): \(beforeKeyCode),"modifiers": { "optional": ["any"] }},
    "conditions": [
        {"identifiers":  [{"vendor_id": \(vendorID),"product_id": \(productID)}],"type": "device_if"}
        \(layerCondition),
        {"type": "variable_if","name": "\(key.id)-Repeat","value": 1}
    ],
    "to": [{\(afterKeyFunctionType): \(afterKeyCode) \(tapWithModifiers)}]
},    
{
    "type": "basic",
    "from": {\(beforeKeyFunctionType): \(beforeKeyCode),"modifiers": { "optional": ["any"] }},
    "conditions": [
        {"identifiers":  [{"vendor_id": \(vendorID),"product_id": \(productID)}],"type": "device_if"}
        \(layerCondition)
    ],
    "to_if_alone": [{\(afterKeyFunctionType): \(afterKeyCode) \(tapWithModifiers)}],
    "to": [
        {"set_variable": {"name": "\(key.id)-Repeat","value": 1}},
        {\(afterHoldKeyFunctionType): \(afterHoldKeyCode) \(holdWithModifiers)}
    ],
    "to_delayed_action": {
        "to_if_invoked": [{"set_variable": {"name": "\(key.id)-Repeat","value": 0}}],
        "to_if_canceled": [{"set_variable": {"name": "\(key.id)-Repeat","value": 0}}]
    }
    \(afterKeyUpCode)
}
"""
                }
            } else {
                //シンプルな書き換え
                let tapWithModifiers: String
                if afterKeyIncludeModifier || key.tapWithModifier {
                    // 修飾キーを配列に集める
                    var tapModifiers: [String] = []
                    if afterKeyInfo.includeShift || key.tapWithShift { tapModifiers.append("\"left_shift\"") }//"left_shift"が入るように
                    if afterKeyInfo.includeCommand || key.tapWithCommand { tapModifiers.append("\"left_command\"") }
                    if afterKeyInfo.includeOption || key.tapWithOption { tapModifiers.append("\"left_option\"") }
                    if afterKeyInfo.includeControl || key.tapWithControl { tapModifiers.append("\"left_control\"") }
                    if afterKeyInfo.includeFn || key.tapWithFn { tapModifiers.append("\"fn\"") }
                    
                    // 修飾キーがない場合は空文字列、それ以外の場合は結合して文字列に変換
                    if tapModifiers.isEmpty || afterKeyInfo.functionType == .layer {
                        tapWithModifiers = "" // 修飾キーがない場合
                    } else {
                        let modifiersString = tapModifiers.joined(separator: ", ")
                        tapWithModifiers = """
,"modifiers": [\(modifiersString)]
"""
                    }
                } else {
                    tapWithModifiers = "" // 修飾キーが使われない場合
                }
                
                let afterKeyUpCode: String
                if afterKeyInfo.functionType == .layer {//書き換え後のキーがレイヤーの時にAfterKeyUpを加えるための変数追加
                    afterKeyUpCode = """
,"to_after_key_up": [{"set_variable": {"name": "layer\(key.layerKeyNumber_tap)","value": 0}}]
"""
                } else {
                    afterKeyUpCode = ""
                }
                
                let layerCondition: String
                if key.layerNumber == 0 {
                    layerCondition = ""
                } else {
                    layerCondition = """
,{"type": "variable_if","name": "layer\(key.layerNumber)","value": 1}
"""
                }
                
                singleKeyJSON = """
{
    "type": "basic",
    "from": {\(beforeKeyFunctionType): \(beforeKeyCode),"modifiers": { "optional": ["any"] }},
    "conditions": [
        {"identifiers":  [{"vendor_id": \(vendorID),"product_id": \(productID)}],"type": "device_if"}
        \(layerCondition)
    ],
    "to": [{ \(afterKeyFunctionType): \(afterKeyCode) \(tapWithModifiers)}]
    \(afterKeyUpCode)
}
"""
            }
            return singleKeyJSON
        }
    }

}
