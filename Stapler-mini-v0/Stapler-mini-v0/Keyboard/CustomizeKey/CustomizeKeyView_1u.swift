///CustomizeKeyクラスの定義とそのひとつ分のビューの定義。
///
import SwiftUI
import UniformTypeIdentifiers

//書き換えデータをドラッグしていく元のキー。レイヤーキーなどもここに入るはず。
final class CustomizeKey: Codable, Transferable, Identifiable {
    let id: UUID
    //まず、変更後の表示シンボルと、打たれる文字(辞書鍵になってるやつ)
    let layerKeyNumber: Int
    let afterDisplaySymbol: String
    let isUsingSFSymbol: Bool
    let afterKeyOutPut: String
    
    let isCustomized: Bool
    //修飾キー
    let tapWithModifier: Bool
    let tapWithShift: Bool
    let isTapIncludeShift: Bool//記号をドロップした後にDetail View側でシフトとかをトグルできないようにするためのブール値
    let tapWithControl: Bool
    let isTapIncludeControl: Bool
    let tapWithOption: Bool
    let isTapIncludeOption: Bool
    let tapWithCommand: Bool
    let isTapIncludeCommand: Bool

    let userCustomJSONEnabled: Bool
    let userCustomJSONContent: String
    
    let helpText: String?
    
    //簡易
    init(
            afterDisplaySymbol: String,
            afterKeyOutPut: String,
            isUsingSFSymbol:Bool = false,
            helpText: String? = nil,
            layerKeyNumber: Int = 0
        ) {
            self.id = UUID()
            self.layerKeyNumber = layerKeyNumber
            self.afterDisplaySymbol = afterDisplaySymbol
            self.isUsingSFSymbol = isUsingSFSymbol
            self.afterKeyOutPut = afterKeyOutPut
            
            self.isCustomized = true
            self.tapWithModifier = false
            
            self.tapWithShift = false
            self.isTapIncludeShift = false
            self.tapWithControl = false
            self.isTapIncludeControl = false
            self.tapWithOption = false
            self.isTapIncludeOption = false
            self.tapWithCommand = false
            self.isTapIncludeCommand = false
            
            self.userCustomJSONEnabled = false
            self.userCustomJSONContent = ""
            self.helpText = helpText
        }
    //全部入り
    init(
            id: UUID = UUID(),
            layerKeyNumber: Int = 0,
            afterDisplaySymbol: String,
            afterKeyOutPut: String,
            isCustomized: Bool = true,
            
            isTapWithModifier: Bool = false,
            tapWithShift: Bool = false,
            isTapIncludeShift: Bool = false,
            tapWithControl: Bool = false,
            isTapIncludeControl: Bool = false,
            tapWithOption: Bool = false,
            isTapIncludeOption: Bool = false,
            tapWithCommand: Bool = false,
            isTapIncludeCommand: Bool = false,
            
            userCustomJSONEnabled: Bool = false,
            userCustomJSONContent: String = "",
            isUsingSFSymbol:Bool = false,
            helpText: String? = nil
            
        ) {
            self.id = id
            self.layerKeyNumber = layerKeyNumber
            self.afterDisplaySymbol = afterDisplaySymbol
            self.afterKeyOutPut = afterKeyOutPut
            self.isCustomized = true
            
            self.tapWithModifier = isTapWithModifier
            self.tapWithShift = tapWithShift
            self.isTapIncludeShift = isTapIncludeShift
            self.tapWithControl = tapWithControl
            self.isTapIncludeControl = isTapIncludeControl
            self.tapWithOption = tapWithOption
            self.isTapIncludeOption = isTapIncludeOption
            self.tapWithCommand = tapWithCommand
            self.isTapIncludeCommand = isTapIncludeCommand
            
            self.userCustomJSONEnabled = userCustomJSONEnabled
            self.userCustomJSONContent = userCustomJSONContent
            self.isUsingSFSymbol = isUsingSFSymbol
            self.helpText = helpText
        }
    
    
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(for: CustomizeKey.self, contentType: .customizekey)
    }
}

extension UTType {
    static var customizekey: UTType { UTType(exportedAs: "com.example.customizekey")}
}

struct CustomizeKeyView_1u: View {
    let customizeKey: CustomizeKey
    private var backgroundColor: Color {
        if customizeKey.afterKeyOutPut == "layer1" {
            LayerColor.layer1.customizeKeyBackGroundColor
        } else if customizeKey.afterKeyOutPut == "layer2" {
            LayerColor.layer2.customizeKeyBackGroundColor
        } else if customizeKey.afterKeyOutPut == "layer3" {
            LayerColor.layer3.customizeKeyBackGroundColor
        } else if customizeKey.afterKeyOutPut == "layer4" {
            LayerColor.layer4.customizeKeyBackGroundColor
        } else if customizeKey.afterKeyOutPut == "layer5" {
            LayerColor.layer5.customizeKeyBackGroundColor
        } else if customizeKey.afterKeyOutPut == "layer6" {
            LayerColor.layer6.customizeKeyBackGroundColor
        } else if customizeKey.afterKeyOutPut == "layer7" {
            LayerColor.layer7.customizeKeyBackGroundColor
        } else if customizeKey.afterKeyOutPut == "layer8" {
            LayerColor.layer8.customizeKeyBackGroundColor
        } else {
            LayerColor.layer0.customizeKeyBackGroundColor
        }
    }
    var body: some View {
        ZStack {
            if customizeKey.isUsingSFSymbol {
                Image(systemName: customizeKey.afterDisplaySymbol)
            } else {
                Text(customizeKey.afterDisplaySymbol)
            }
        }
        .foregroundColor(.white)
        .font(.system(size: 20))
        .frame(width: 65 - 65 * 0.07, height: 65 - 65 * 0.07)
        .background(backgroundColor.opacity(0.5))
        .cornerRadius(65 * 0.07)
        .draggable(customizeKey)
        .help(customizeKey.helpText ?? "keycode: \(customizeKey.afterKeyOutPut)")
    }
}

#Preview {
    return CustomizeKeyView_1u(customizeKey: CustomizeKey(afterDisplaySymbol: "A", afterKeyOutPut: "A"))
}


