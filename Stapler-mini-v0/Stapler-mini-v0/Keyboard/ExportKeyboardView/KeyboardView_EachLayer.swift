///レイヤー1枚分の情報を表示するEachLayerView

import SwiftUI

struct KeyboardView_EachLayer_Export012: View {
    let preset: Preset
    var body: some View {
        VStack {
            KeyboardView_EachLayer(keySize: 100, preset: preset, layer: preset.layer0)
            KeyboardView_EachLayer(keySize: 100, preset: preset, layer: preset.layer1)
            KeyboardView_EachLayer(keySize: 100, preset: preset, layer: preset.layer2)

        }
    }
}
struct KeyboardView_EachLayer_Export345: View {
    let preset: Preset
    var body: some View {
        VStack {
            KeyboardView_EachLayer(keySize: 100, preset: preset, layer: preset.layer3)
            KeyboardView_EachLayer(keySize: 100, preset: preset, layer: preset.layer4)
            KeyboardView_EachLayer(keySize: 100, preset: preset, layer: preset.layer5)
        }
    }

}
struct KeyboardView_EachLayer_Export678: View {
    let preset: Preset
    var body: some View {
        VStack {
            KeyboardView_EachLayer(keySize: 100, preset: preset, layer: preset.layer6)
            KeyboardView_EachLayer(keySize: 100, preset: preset, layer: preset.layer7)
            KeyboardView_EachLayer(keySize: 100, preset: preset, layer: preset.layer8)
        }
    }
}

struct KeyboardView_EachLayer: View {
    let keySize: CGFloat
    let preset: Preset
    let layer: [KeyboardKey]
    private var strokeWidth: CGFloat {
        keySize * 0.07 / 2
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: keySize * 0.14, style: .circular)
                .stroke(style: StrokeStyle(lineWidth: strokeWidth))
                .fill(.gray.opacity(0.8))
                .frame(width: keySize * 14.5 + keySize * 0.07, height: keySize * 6 + keySize * 0.07)
                .padding()
                
            Group {
                switch preset.keyboardLayout {
                case .JIS:
                    BuiltInKeyboardView_JIS_EachLayer(keySize: keySize, layer: layer)
                case .US:
                    BuiltInKeyboardView_US_EachLayer(keySize: keySize, layer: layer)
                case .UK:
                    BuiltInKeyboardView_UK_EachLayer(keySize: keySize, layer: layer)
                }
            }
        }
    }
}
#Preview {
    KeyboardView_EachLayer(keySize: 65, preset: Preset.testPresetJIS, layer: Preset.testPresetJIS.layer0)
}

struct BuiltInKeyboardView_US_EachLayer: View {
    let keySize: CGFloat
    var layer: [KeyboardKey]

    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            HStack (spacing: 0) {//Row1
                KeyboardKeyView_EachLayer( keyboardKey: layer[0], unitSize: 1.5, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[1], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[2], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[3], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[4], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[5], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[6], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[7], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[8], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[9], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[10], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[11], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[12], unitSize: 1, baseSize: keySize)
                
                
            }
            HStack (spacing: 0) {//Row2
                KeyboardKeyView_EachLayer( keyboardKey: layer[13], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[14], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[15], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[16], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[17], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[18], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[19], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[20], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[21], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[22], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[23], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[24], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[25], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[26], unitSize: 1.5, baseSize: keySize)
                
                
                
                
            }
            HStack (spacing: 0) {//Row3
                KeyboardKeyView_EachLayer( keyboardKey: layer[27], unitSize: 1.5, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[28], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[29], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[30], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[31], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[32], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[33], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[34], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[35], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[36], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[37], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[38], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[39], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[40], unitSize: 1, baseSize: keySize)
                
                
                
            }
            HStack (spacing: 0) {//Row4
                KeyboardKeyView_EachLayer( keyboardKey: layer[41], unitSize: 1.75, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[42], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[43], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[44], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[45], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[46], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[47], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[48], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[49], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[50], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[51], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[52], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[53], unitSize: 1.75, baseSize: keySize)
                
                
            }
            HStack (spacing: 0) {//Row5
                KeyboardKeyView_EachLayer( keyboardKey: layer[54], unitSize: 2.25, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[55], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[56], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[57], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[58], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[59], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[60], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[61], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[62], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[63], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[64], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[65], unitSize: 2.25, baseSize: keySize)
                
            }
            HStack (spacing: 0) {//Row6
                KeyboardKeyView_EachLayer( keyboardKey: layer[66], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[67], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[68], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[69], unitSize: 1.25, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[70], unitSize: 5, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[71], unitSize: 1.25, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[72], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_EachLayer( keyboardKey: layer[73], unitSize: 1, baseSize: keySize)
                VStack (spacing: 0) {//ここにarrowの上下がくるなぁ〜専用のビューを作らないとダメだね
                    KeyboardKeyView_arrow_EachLayer( keyboardKey: layer[74], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_arrow_EachLayer( keyboardKey: layer[75], unitSize: 1, baseSize: keySize)
                }
                KeyboardKeyView_EachLayer( keyboardKey: layer[76], unitSize: 1, baseSize: keySize)
            }
        }
    }
}

struct BuiltInKeyboardView_JIS_EachLayer: View {
    let keySize: CGFloat
    var layer: [KeyboardKey]
    var body: some View {
        ZStack {
            VStack(alignment: .trailing ,spacing: 0) {
                Spacer()
                HStack (spacing: 0){
                    Spacer().frame(width: keySize * 13.25 - keySize * 0.07 * 4 + keySize * 0.07 / 2)
                    KeyboardKeyView_enter_JIS_EachLayer( keyboardKey: layer[53], baseSize: keySize)
                }
                Spacer()
            }
            VStack(alignment: .leading ,spacing: 0) {
                HStack (spacing: 0) {//Row1
                    KeyboardKeyView_EachLayer( keyboardKey: layer[0], unitSize: 1.5, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[1], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[2], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[3], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[4], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[5], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[6], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[7], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[8], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[9], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[10], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[11], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[12], unitSize: 1, baseSize: keySize)
                    
                    
                }
                HStack (spacing: 0) {//Row2
                    KeyboardKeyView_EachLayer( keyboardKey: layer[13], unitSize: 1.25, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[14], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[15], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[16], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[17], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[18], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[19], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[20], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[21], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[22], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[23], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[24], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[25], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[26], unitSize: 1.25, baseSize: keySize)//BS
                    
                    
                }
                HStack (spacing: 0) {//Row3
                    
                    KeyboardKeyView_EachLayer( keyboardKey: layer[27], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[28], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[29], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[30], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[31], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[32], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[33], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[34], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[35], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[36], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[37], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[38], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[39], unitSize: 1, baseSize: keySize)//「
                    
                    
                    
                    
                }
                HStack (spacing: 0) {//Row4
                    KeyboardKeyView_EachLayer( keyboardKey: layer[40], unitSize: 1.25, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[41], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[42], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[43], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[44], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[45], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[46], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[47], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[48], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[49], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[50], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[51], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[52], unitSize: 1, baseSize: keySize)
                    //                KeyboardKeyView( keyboardKey: layer[53], unitSize: 1.25)//エンター
                    
                    
                }
                HStack (spacing: 0) {//Row5
                    KeyboardKeyView_EachLayer( keyboardKey: layer[54], unitSize: 1.75, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[55], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[56], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[57], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[58], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[59], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[60], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[61], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[62], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[63], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[64], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[65], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[66], unitSize: 1.75, baseSize: keySize)
                    
                    
                    
                }
                HStack (spacing: 0) {//Row6
                    KeyboardKeyView_EachLayer( keyboardKey: layer[67], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[68], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[69], unitSize: 1.25, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[70], unitSize: 1.25, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[71], unitSize: 3.5, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[72], unitSize: 1.25, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[73], unitSize: 1.25, baseSize: keySize)
                    KeyboardKeyView_EachLayer( keyboardKey: layer[74], unitSize: 1, baseSize: keySize)
                    
                    KeyboardKeyView_EachLayer( keyboardKey: layer[75], unitSize: 1, baseSize: keySize)
                    VStack (spacing: 0) {
                        KeyboardKeyView_arrow_EachLayer( keyboardKey: layer[76], unitSize: 1, baseSize: keySize)
                        KeyboardKeyView_arrow_EachLayer( keyboardKey: layer[77], unitSize: 1, baseSize: keySize)
                    }
                    KeyboardKeyView_EachLayer( keyboardKey: layer[78], unitSize: 1, baseSize: keySize)
                }
            }
        }
    }
}

struct BuiltInKeyboardView_UK_EachLayer: View {
    let keySize: CGFloat
    var layer: [KeyboardKey]

    var body: some View {
        ZStack {
            VStack(alignment: .trailing ,spacing: 0) {
                Spacer()
                HStack (spacing: 0){
                    Spacer().frame(width: keySize * 13.75 - keySize * 0.07 * 4 + keySize * 0.07 / 2)
                    KeyboardKeyView_enter_UK_EachLayer(keyboardKey: layer[53], baseSize: keySize)
                }
                Spacer()
            }
            VStack(alignment: .leading, spacing: 0) {
                HStack (spacing: 0) {//Row1
                    KeyboardKeyView_EachLayer(keyboardKey: layer[0], unitSize: 1.5, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[1], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[2], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[3], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[4], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[5], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[6], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[7], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[8], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[9], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[10], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[11], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[12], unitSize: 1, baseSize: keySize)
                    
                    
                }
                HStack (spacing: 0) {//Row2
                    KeyboardKeyView_EachLayer(keyboardKey: layer[13], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[14], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[15], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[16], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[17], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[18], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[19], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[20], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[21], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[22], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[23], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[24], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[25], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[26], unitSize: 1.5, baseSize: keySize)
                }
                HStack (spacing: 0) {//Row3
                    KeyboardKeyView_EachLayer(keyboardKey: layer[27], unitSize: 1.5, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[28], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[29], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[30], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[31], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[32], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[33], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[34], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[35], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[36], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[37], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[38], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[39], unitSize: 1, baseSize: keySize)
                    
                    
                    
                }
                HStack (spacing: 0) {//Row4
                    KeyboardKeyView_EachLayer(keyboardKey: layer[40], unitSize: 1.75, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[41], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[42], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[43], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[44], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[45], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[46], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[47], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[48], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[49], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[50], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[51], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[52], unitSize: 1, baseSize: keySize)
                    
                }
                HStack (spacing: 0) {//Row5
                    KeyboardKeyView_EachLayer(keyboardKey: layer[54], unitSize: 1.25, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[55], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[56], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[57], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[58], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[59], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[60], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[61], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[62], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[63], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[64], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[65], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[66], unitSize: 2.25, baseSize: keySize)
                    
                    
                }
                HStack (spacing: 0) {//Row6
                    KeyboardKeyView_EachLayer(keyboardKey: layer[67], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[68], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[69], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[70], unitSize: 1.25, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[71], unitSize: 5, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[72], unitSize: 1.25, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[73], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_EachLayer(keyboardKey: layer[74], unitSize: 1, baseSize: keySize)
                    VStack(spacing: 0) {
                        KeyboardKeyView_arrow_EachLayer(keyboardKey: layer[75], unitSize: 1, baseSize: keySize)
                        KeyboardKeyView_arrow_EachLayer(keyboardKey: layer[76], unitSize: 1, baseSize: keySize)
                    }
                    KeyboardKeyView_EachLayer(keyboardKey: layer[77], unitSize: 1, baseSize: keySize)
                    
                }
            }
            
        }
    }
}

struct KeyboardKeyView_EachLayer: View {
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
    
    private var strokeWidth: CGFloat { baseSize * 0.07 / 2 }
    
    private var tapFontSize: CGFloat { baseSize * 20 / 65 }
    private var holdFontSize: CGFloat { baseSize * 40 / 65 }
    
    private var highLightColor_tap: Color {
        LayerColor.fromIndex(keyboardKey.layerKeyNumber_tap).textColor_export
    }
    private var highLightColor_hold: Color {
        LayerColor.fromIndex(keyboardKey.layerKeyNumber_hold).textColor_export
    }
    
    private var textColor: Color {
        LayerColor.fromIndex(keyboardKey.layerNumber).textColor_export
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: round)
                .stroke(.gray, lineWidth: strokeWidth)
                .frame(width: frameWidth, height: frameHeiht) // 外側のフレーム（パディングを含む）
            holdKeyView
            tapKeyView
        }
        .frame(width: frameWidth, height: frameHeiht) // 外側のフレーム（パディングを含む）
        .background(.clear)
        .padding(padding)
    }
    
    private var holdKeyView: some View {
        VStack {
            if keyboardKey.isTapHoldEnabled {
                if keyboardKey.layerKeyNumber_hold > 0 {
                    HStack(spacing: 0) {
                        symbolOrText(keyboardKey.holdDisplaySymbol,
                                     isSymbol: keyboardKey.isAfterHoldSFSymbol,
                                     size: holdFontSize,
                                     color: highLightColor_hold)
                    }
                } else {
                    HStack(spacing: 0) {
                        symbolOrText(keyboardKey.holdDisplaySymbol,
                                     isSymbol: keyboardKey.isAfterHoldSFSymbol,
                                     size: holdFontSize,
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
                if keyboardKey.layerNumber > 0 { //レイヤーなら無
                    EmptyView()
                } else { //デフォレイヤーならbeforeを入れる
                    defaultContent
                }
            }
        }
    }
    private var defaultContent: some View {
        symbolOrText(keyboardKey.beforeDisplaySymbol,
                     isSymbol: keyboardKey.isBeforeSFSymbol,
                     size: tapFontSize,
                     color: textColor)
    }
    private var customizedContent: some View {
        HStack(spacing: 0) {
            if keyboardKey.layerKeyNumber_tap > 0 {
                symbolOrText(keyboardKey.afterDisplaySymbol,
                             isSymbol: keyboardKey.isAfterTapSFSymbol,
                             size: tapFontSize,
                             color: highLightColor_tap)
                
            } else {
                modifierContent_tap.foregroundStyle(textColor)
                symbolOrText(keyboardKey.afterDisplaySymbol,
                             isSymbol: keyboardKey.isAfterTapSFSymbol,
                             size: tapFontSize,
                             color: textColor)
                
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
            return baseSize * 15 / 65
        case 1:
            return baseSize * 15 / 65
        case 2:
            return baseSize * 10 / 65
        default:
            return baseSize * 6 / 65
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
            return baseSize * 15 / 65
        case 1:
            return baseSize * 15 / 65
        case 2:
            return baseSize * 10 / 65
        default:
            return baseSize * 6 / 65
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
struct KeyboardKeyView_arrow_EachLayer: View {
    @State var keyboardKey: KeyboardKey
    let unitSize: Double//1uなのか、1.25uなのかを決める

    let baseSize: CGFloat// 1uの一片の長さ
    private var padding: CGFloat {baseSize * 0.07}
    private var round: CGFloat {baseSize * 0.07}
    // 全体のサイズ（パディングを含む）
    private var totalWidth: CGFloat {baseSize * unitSize}
    private var totalHeight: CGFloat {baseSize * 0.5}
    // フレームのサイズ（パディングを除いた実際のシルエットのサイズ）
    private var frameWidth: CGFloat {totalWidth - (padding * 2)}
    private var frameHeight: CGFloat {totalHeight - (padding * 2)}
    
    private var tapFontSize: CGFloat { baseSize * 20 / 65 }
    private var holdFontSize: CGFloat { baseSize * 40 / 65 }
    
    private var highLightColor_tap: Color {
        LayerColor.fromIndex(keyboardKey.layerKeyNumber_tap).textColor_export
    }
    private var highLightColor_hold: Color {
        LayerColor.fromIndex(keyboardKey.layerKeyNumber_hold).textColor_export
    }
    
    private var textColor: Color {
        LayerColor.fromIndex(keyboardKey.layerNumber).textColor_export
    }
    private var strokeWidth: CGFloat {
        baseSize * 0.07 / 2
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: round)
                .stroke(.gray, lineWidth: strokeWidth)
                .frame(width: frameWidth, height: frameHeight)
            holdKeyView
            tapKeyView
        }
        .frame(width: frameWidth, height: frameHeight) // 外側のフレーム（パディングを含む）
        .background(.clear)
        .padding(padding)
    }
    
    private var holdKeyView: some View {
        VStack {
            if keyboardKey.isTapHoldEnabled {
                if keyboardKey.layerKeyNumber_hold > 0 {
                    HStack(spacing: 0) {
                        symbolOrText(keyboardKey.holdDisplaySymbol,
                                     isSymbol: keyboardKey.isAfterHoldSFSymbol,
                                     size: tapFontSize,
                                     color: highLightColor_hold)
                    }
                } else {
                    HStack(spacing: 0) {
                        symbolOrText(keyboardKey.holdDisplaySymbol,
                                     isSymbol: keyboardKey.isAfterHoldSFSymbol,
                                     size: tapFontSize,
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
                if keyboardKey.layerNumber > 0 { //レイヤーなら無
                    EmptyView()
                } else { //デフォレイヤーならbeforeを入れる
                    defaultContent
                }
            }
        }
    }
    private var defaultContent: some View {
        symbolOrText(keyboardKey.beforeDisplaySymbol,
                     isSymbol: keyboardKey.isBeforeSFSymbol,
                     size: tapFontSize,
                     color: textColor)
    }
    private var customizedContent: some View {
        HStack(spacing: 0) {
            if keyboardKey.layerKeyNumber_tap > 0 {
                symbolOrText(keyboardKey.afterDisplaySymbol,
                             isSymbol: keyboardKey.isAfterTapSFSymbol,
                             size: tapFontSize,
                             color: highLightColor_tap)
                
            } else {
                modifierContent_tap.foregroundStyle(textColor)
                symbolOrText(keyboardKey.afterDisplaySymbol,
                             isSymbol: keyboardKey.isAfterTapSFSymbol,
                             size: tapFontSize,
                             color: textColor)
                
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
            return baseSize * 15 / 65
        case 1:
            return baseSize * 15 / 65
        case 2:
            return baseSize * 10 / 65
        default:
            return baseSize * 6 / 65
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
            return baseSize * 15 / 65
        case 1:
            return baseSize * 15 / 65
        case 2:
            return baseSize * 10 / 65
        default:
            return baseSize * 6 / 65
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
struct KeyboardKeyView_enter_JIS_EachLayer: View {
    @State var keyboardKey: KeyboardKey
    let baseSize: CGFloat // 1uの全体サイズ
    private var frameWidth: CGFloat {baseSize * 1.5 }
    private var frameHeight: CGFloat {baseSize * 2 }
    private var round: CGFloat { baseSize * 0.07 }
    private var padding: CGFloat { baseSize * 0.07 }
    private var strokeWidth: CGFloat { baseSize * 0.07 / 2 }
    private var tapFontSize: CGFloat { baseSize * 20 / 65 }
    private var holdFontSize: CGFloat { baseSize * 40 / 65 }
    
    private var highLightColor_tap: Color {
        LayerColor.fromIndex(keyboardKey.layerKeyNumber_tap).textColor_export
    }
    private var highLightColor_hold: Color {
        LayerColor.fromIndex(keyboardKey.layerKeyNumber_hold).textColor_export
    }
    
    private var textColor: Color {
        LayerColor.fromIndex(keyboardKey.layerNumber).textColor_export
    }
   
    
    var body: some View {
        ZStack {
            EnterShape_JIS(frameValue: baseSize)
                .stroke(.gray, lineWidth: strokeWidth)
                .frame(width: frameWidth, height: frameHeight)
            holdKeyView
            tapKeyView
        }
        .frame(width: frameWidth, height: frameHeight) // 外側のフレーム（パディングを含む）
        .background(.clear)
        .padding(padding)
    }
    
    private var holdKeyView: some View {
        VStack {
            if keyboardKey.isTapHoldEnabled {
                if keyboardKey.layerKeyNumber_hold > 0 {
                    HStack(spacing: 0) {
                        symbolOrText(keyboardKey.holdDisplaySymbol,
                                     isSymbol: keyboardKey.isAfterHoldSFSymbol,
                                     size: holdFontSize,
                                     color: highLightColor_hold)
                    }
                } else {
                    HStack(spacing: 0) {
                        symbolOrText(keyboardKey.holdDisplaySymbol,
                                     isSymbol: keyboardKey.isAfterHoldSFSymbol,
                                     size: holdFontSize,
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
                if keyboardKey.layerNumber > 0 { //レイヤーなら無
                    EmptyView()
                } else { //デフォレイヤーならbeforeを入れる
                    defaultContent
                }
            }
        }
    }
    private var defaultContent: some View {
        symbolOrText(keyboardKey.beforeDisplaySymbol,
                     isSymbol: keyboardKey.isBeforeSFSymbol,
                     size: tapFontSize,
                     color: textColor)
    }
    private var customizedContent: some View {
        HStack(spacing: 0) {
            if keyboardKey.layerKeyNumber_tap > 0 {
                symbolOrText(keyboardKey.afterDisplaySymbol,
                             isSymbol: keyboardKey.isAfterTapSFSymbol,
                             size: tapFontSize,
                             color: highLightColor_tap)
                
            } else {
                modifierContent_tap.foregroundStyle(textColor)
                symbolOrText(keyboardKey.afterDisplaySymbol,
                             isSymbol: keyboardKey.isAfterTapSFSymbol,
                             size: tapFontSize,
                             color: textColor)
                
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
            return baseSize * 15 / 65
        case 1:
            return baseSize * 15 / 65
        case 2:
            return baseSize * 10 / 65
        default:
            return baseSize * 6 / 65
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
            return baseSize * 15 / 65
        case 1:
            return baseSize * 15 / 65
        case 2:
            return baseSize * 10 / 65
        default:
            return baseSize * 6 / 65
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
struct KeyboardKeyView_enter_UK_EachLayer: View {
    @State var keyboardKey: KeyboardKey
    let baseSize: CGFloat // 1uの全体サイズ
    private var frameWidth: CGFloat {baseSize}
    private var frameHeight: CGFloat {baseSize * 2}
    private var round: CGFloat { baseSize * 0.07 }
    private var padding: CGFloat { baseSize * 0.07 }
    private var strokeWidth: CGFloat { baseSize * 0.07 / 2 }
    
    private var tapFontSize: CGFloat { baseSize * 20 / 65 }
    private var holdFontSize: CGFloat { baseSize * 40 / 65 }

    private var highLightColor_tap: Color {
        LayerColor.fromIndex(keyboardKey.layerKeyNumber_tap).textColor_export
    }
    private var highLightColor_hold: Color {
        LayerColor.fromIndex(keyboardKey.layerKeyNumber_hold).textColor_export
    }
    
    private var textColor: Color {
        LayerColor.fromIndex(keyboardKey.layerNumber).textColor_export
    }
    
    var body: some View {
        ZStack {
            EnterShape_UK(frameValue: baseSize)
                .stroke(.gray, lineWidth: strokeWidth)
                .frame(width: frameWidth, height: frameHeight)
            holdKeyView
            tapKeyView
        }
        .frame(width: frameWidth, height: frameHeight) // 外側のフレーム（パディングを含む）
        .background(.clear)
        .padding(padding)
    }
    
    private var holdKeyView: some View {
        VStack {
            if keyboardKey.isTapHoldEnabled {
                if keyboardKey.layerKeyNumber_hold > 0 {
                    HStack(spacing: 0) {
                        symbolOrText(keyboardKey.holdDisplaySymbol,
                                     isSymbol: keyboardKey.isAfterHoldSFSymbol,
                                     size: holdFontSize,
                                     color: highLightColor_hold)
                    }
                } else {
                    HStack(spacing: 0) {
                        symbolOrText(keyboardKey.holdDisplaySymbol,
                                     isSymbol: keyboardKey.isAfterHoldSFSymbol,
                                     size: holdFontSize,
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
                if keyboardKey.layerNumber > 0 { //レイヤーなら無
                    EmptyView()
                } else { //デフォレイヤーならbeforeを入れる
                    defaultContent
                }
            }
        }
    }
    private var defaultContent: some View {
        symbolOrText(keyboardKey.beforeDisplaySymbol,
                     isSymbol: keyboardKey.isBeforeSFSymbol,
                     size: tapFontSize,
                     color: textColor)
    }
    private var customizedContent: some View {
        HStack(spacing: 0) {
            if keyboardKey.layerKeyNumber_tap > 0 {
                symbolOrText(keyboardKey.afterDisplaySymbol,
                             isSymbol: keyboardKey.isAfterTapSFSymbol,
                             size: tapFontSize,
                             color: highLightColor_tap)
                
            } else {
                modifierContent_tap.foregroundStyle(textColor)
                symbolOrText(keyboardKey.afterDisplaySymbol,
                             isSymbol: keyboardKey.isAfterTapSFSymbol,
                             size: tapFontSize,
                             color: textColor)
                
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
            return baseSize * 15 / 65
        case 1:
            return baseSize * 15 / 65
        case 2:
            return baseSize * 10 / 65
        default:
            return baseSize * 6 / 65
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
            return baseSize * 15 / 65
        case 1:
            return baseSize * 15 / 65
        case 2:
            return baseSize * 10 / 65
        default:
            return baseSize * 6 / 65
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
