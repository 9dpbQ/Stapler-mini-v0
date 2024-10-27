///すべてのレイヤーの情報を表示できるAllLayerView
///

import SwiftUI

struct KeyboardView_AllLayer: View {
    let keySize: CGFloat
    let preset: Preset
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
                    BuiltInKeyboardView_JIS_allLayer(keySize: keySize, layer0: preset.layer0, layer1: preset.layer1, layer2: preset.layer2, layer3: preset.layer3, layer4: preset.layer4, layer5: preset.layer5, layer6: preset.layer6, layer7: preset.layer7, layer8: preset.layer8)
                case .US:
                    BuiltInKeyboardView_US_allLayer(keySize: keySize, layer0: preset.layer0, layer1: preset.layer1, layer2: preset.layer2, layer3: preset.layer3, layer4: preset.layer4, layer5: preset.layer5, layer6: preset.layer6, layer7: preset.layer7, layer8: preset.layer8)
                case .UK:
                    BuiltInKeyboardView_UK_allLayer(keySize: keySize, layer0: preset.layer0, layer1: preset.layer1, layer2: preset.layer2, layer3: preset.layer3, layer4: preset.layer4, layer5: preset.layer5, layer6: preset.layer6, layer7: preset.layer7, layer8: preset.layer8)
                }
            }
        }
    }
}


struct BuiltInKeyboardView_US_allLayer: View {
    let keySize: CGFloat
    let layer0: [KeyboardKey]
    let layer1: [KeyboardKey]
    let layer2: [KeyboardKey]
    let layer3: [KeyboardKey]
    let layer4: [KeyboardKey]
    let layer5: [KeyboardKey]
    let layer6: [KeyboardKey]
    let layer7: [KeyboardKey]
    let layer8: [KeyboardKey]


    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            HStack (spacing: 0) {//Row1
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[0], layer1: layer1[0], layer2: layer2[0], layer3: layer3[0], layer4: layer4[0], layer5: layer5[0], layer6: layer6[0], layer7: layer7[0], layer8: layer8[0], unitSize: 1.5, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[1], layer1: layer1[1], layer2: layer2[1], layer3: layer3[1], layer4: layer4[1], layer5: layer5[1], layer6: layer6[1], layer7: layer7[1], layer8: layer8[1], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[2], layer1: layer1[2], layer2: layer2[2], layer3: layer3[2], layer4: layer4[2], layer5: layer5[2], layer6: layer6[2], layer7: layer7[2], layer8: layer8[2], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[3], layer1: layer1[3], layer2: layer2[3], layer3: layer3[3], layer4: layer4[3], layer5: layer5[3], layer6: layer6[3], layer7: layer7[3], layer8: layer8[3], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[4], layer1: layer1[4], layer2: layer2[4], layer3: layer3[4], layer4: layer4[4], layer5: layer5[4], layer6: layer6[4], layer7: layer7[4], layer8: layer8[4], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[5], layer1: layer1[5], layer2: layer2[5], layer3: layer3[5], layer4: layer4[5], layer5: layer5[5], layer6: layer6[5], layer7: layer7[5], layer8: layer8[5], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[6], layer1: layer1[6], layer2: layer2[6], layer3: layer3[6], layer4: layer4[6], layer5: layer5[6], layer6: layer6[6], layer7: layer7[6], layer8: layer8[6], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[7], layer1: layer1[7], layer2: layer2[7], layer3: layer3[7], layer4: layer4[7], layer5: layer5[7], layer6: layer6[7], layer7: layer7[7], layer8: layer8[7], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[8], layer1: layer1[8], layer2: layer2[8], layer3: layer3[8], layer4: layer4[8], layer5: layer5[8], layer6: layer6[8], layer7: layer7[8], layer8: layer8[8], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[9], layer1: layer1[9], layer2: layer2[9], layer3: layer3[9], layer4: layer4[9], layer5: layer5[9], layer6: layer6[9], layer7: layer7[9], layer8: layer8[9], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[10], layer1: layer1[10], layer2: layer2[10], layer3: layer3[10], layer4: layer4[10], layer5: layer5[10], layer6: layer6[10], layer7: layer7[10], layer8: layer8[10], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[11], layer1: layer1[11], layer2: layer2[11], layer3: layer3[11], layer4: layer4[11], layer5: layer5[11], layer6: layer6[11], layer7: layer7[11], layer8: layer8[11], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[12], layer1: layer1[12], layer2: layer2[12], layer3: layer3[12], layer4: layer4[12], layer5: layer5[12], layer6: layer6[12], layer7: layer7[12], layer8: layer8[12], unitSize: 1, baseSize: keySize)
                
                
            }
            HStack (spacing: 0) {//Row2
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[13], layer1: layer1[13], layer2: layer2[13], layer3: layer3[13], layer4: layer4[13], layer5: layer5[13], layer6: layer6[13], layer7: layer7[13], layer8: layer8[13], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[14], layer1: layer1[14], layer2: layer2[14], layer3: layer3[14], layer4: layer4[14], layer5: layer5[14], layer6: layer6[14], layer7: layer7[14], layer8: layer8[14], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[15], layer1: layer1[15], layer2: layer2[15], layer3: layer3[15], layer4: layer4[15], layer5: layer5[15], layer6: layer6[15], layer7: layer7[15], layer8: layer8[15], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[16], layer1: layer1[16], layer2: layer2[16], layer3: layer3[16], layer4: layer4[16], layer5: layer5[16], layer6: layer6[16], layer7: layer7[16], layer8: layer8[16], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[17], layer1: layer1[17], layer2: layer2[17], layer3: layer3[17], layer4: layer4[17], layer5: layer5[17], layer6: layer6[17], layer7: layer7[17], layer8: layer8[17], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[18], layer1: layer1[18], layer2: layer2[18], layer3: layer3[18], layer4: layer4[18], layer5: layer5[18], layer6: layer6[18], layer7: layer7[18], layer8: layer8[18], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[19], layer1: layer1[19], layer2: layer2[19], layer3: layer3[19], layer4: layer4[19], layer5: layer5[19], layer6: layer6[19], layer7: layer7[19], layer8: layer8[19], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[20], layer1: layer1[20], layer2: layer2[20], layer3: layer3[20], layer4: layer4[20], layer5: layer5[20], layer6: layer6[20], layer7: layer7[20], layer8: layer8[20], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[21], layer1: layer1[21], layer2: layer2[21], layer3: layer3[21], layer4: layer4[21], layer5: layer5[21], layer6: layer6[21], layer7: layer7[21], layer8: layer8[21], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[22], layer1: layer1[22], layer2: layer2[22], layer3: layer3[22], layer4: layer4[22], layer5: layer5[22], layer6: layer6[22], layer7: layer7[22], layer8: layer8[22], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[23], layer1: layer1[23], layer2: layer2[23], layer3: layer3[23], layer4: layer4[23], layer5: layer5[23], layer6: layer6[23], layer7: layer7[23], layer8: layer8[23], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[24], layer1: layer1[24], layer2: layer2[24], layer3: layer3[24], layer4: layer4[24], layer5: layer5[24], layer6: layer6[24], layer7: layer7[24], layer8: layer8[24], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[25], layer1: layer1[25], layer2: layer2[25], layer3: layer3[25], layer4: layer4[25], layer5: layer5[25], layer6: layer6[25], layer7: layer7[25], layer8: layer8[25], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[26], layer1: layer1[26], layer2: layer2[26], layer3: layer3[26], layer4: layer4[26], layer5: layer5[26], layer6: layer6[26], layer7: layer7[26], layer8: layer8[26], unitSize: 1.5, baseSize: keySize)
            }
            HStack (spacing: 0) {//Row3
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[27], layer1: layer1[27], layer2: layer2[27], layer3: layer3[27], layer4: layer4[27], layer5: layer5[27], layer6: layer6[27], layer7: layer7[27], layer8: layer8[27], unitSize: 1.5, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[28], layer1: layer1[28], layer2: layer2[28], layer3: layer3[28], layer4: layer4[28], layer5: layer5[28], layer6: layer6[28], layer7: layer7[28], layer8: layer8[28], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[29], layer1: layer1[29], layer2: layer2[29], layer3: layer3[29], layer4: layer4[29], layer5: layer5[29], layer6: layer6[29], layer7: layer7[29], layer8: layer8[29], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[30], layer1: layer1[30], layer2: layer2[30], layer3: layer3[30], layer4: layer4[30], layer5: layer5[30], layer6: layer6[30], layer7: layer7[30], layer8: layer8[30], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[31], layer1: layer1[31], layer2: layer2[31], layer3: layer3[31], layer4: layer4[31], layer5: layer5[31], layer6: layer6[31], layer7: layer7[31], layer8: layer8[31], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[32], layer1: layer1[32], layer2: layer2[32], layer3: layer3[32], layer4: layer4[32], layer5: layer5[32], layer6: layer6[32], layer7: layer7[32], layer8: layer8[32], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[33], layer1: layer1[33], layer2: layer2[33], layer3: layer3[33], layer4: layer4[33], layer5: layer5[33], layer6: layer6[33], layer7: layer7[33], layer8: layer8[33], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[34], layer1: layer1[34], layer2: layer2[34], layer3: layer3[34], layer4: layer4[34], layer5: layer5[34], layer6: layer6[34], layer7: layer7[34], layer8: layer8[34], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[35], layer1: layer1[35], layer2: layer2[35], layer3: layer3[35], layer4: layer4[35], layer5: layer5[35], layer6: layer6[35], layer7: layer7[35], layer8: layer8[35], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[36], layer1: layer1[36], layer2: layer2[36], layer3: layer3[36], layer4: layer4[36], layer5: layer5[36], layer6: layer6[36], layer7: layer7[36], layer8: layer8[36], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[37], layer1: layer1[37], layer2: layer2[37], layer3: layer3[37], layer4: layer4[37], layer5: layer5[37], layer6: layer6[37], layer7: layer7[37], layer8: layer8[37], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[38], layer1: layer1[38], layer2: layer2[38], layer3: layer3[38], layer4: layer4[38], layer5: layer5[38], layer6: layer6[38], layer7: layer7[38], layer8: layer8[38], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[39], layer1: layer1[39], layer2: layer2[39], layer3: layer3[39], layer4: layer4[39], layer5: layer5[39], layer6: layer6[39], layer7: layer7[39], layer8: layer8[39], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[40], layer1: layer1[40], layer2: layer2[40], layer3: layer3[40], layer4: layer4[40], layer5: layer5[40], layer6: layer6[40], layer7: layer7[40], layer8: layer8[40], unitSize: 1, baseSize: keySize)
            }
            HStack (spacing: 0) {//Row4
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[41], layer1: layer1[41], layer2: layer2[41], layer3: layer3[41], layer4: layer4[41], layer5: layer5[41], layer6: layer6[41], layer7: layer7[41], layer8: layer8[41], unitSize: 1.75, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[42], layer1: layer1[42], layer2: layer2[42], layer3: layer3[42], layer4: layer4[42], layer5: layer5[42], layer6: layer6[42], layer7: layer7[42], layer8: layer8[42], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[43], layer1: layer1[43], layer2: layer2[43], layer3: layer3[43], layer4: layer4[43], layer5: layer5[43], layer6: layer6[43], layer7: layer7[43], layer8: layer8[43], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[44], layer1: layer1[44], layer2: layer2[44], layer3: layer3[44], layer4: layer4[44], layer5: layer5[44], layer6: layer6[44], layer7: layer7[44], layer8: layer8[44], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[45], layer1: layer1[45], layer2: layer2[45], layer3: layer3[45], layer4: layer4[45], layer5: layer5[45], layer6: layer6[45], layer7: layer7[45], layer8: layer8[45], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[46], layer1: layer1[46], layer2: layer2[46], layer3: layer3[46], layer4: layer4[46], layer5: layer5[46], layer6: layer6[46], layer7: layer7[46], layer8: layer8[46], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[47], layer1: layer1[47], layer2: layer2[47], layer3: layer3[47], layer4: layer4[47], layer5: layer5[47], layer6: layer6[47], layer7: layer7[47], layer8: layer8[47], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[48], layer1: layer1[48], layer2: layer2[48], layer3: layer3[48], layer4: layer4[48], layer5: layer5[48], layer6: layer6[48], layer7: layer7[48], layer8: layer8[48], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[49], layer1: layer1[49], layer2: layer2[49], layer3: layer3[49], layer4: layer4[49], layer5: layer5[49], layer6: layer6[49], layer7: layer7[49], layer8: layer8[49], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[50], layer1: layer1[50], layer2: layer2[50], layer3: layer3[50], layer4: layer4[50], layer5: layer5[50], layer6: layer6[50], layer7: layer7[50], layer8: layer8[50], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[51], layer1: layer1[51], layer2: layer2[51], layer3: layer3[51], layer4: layer4[51], layer5: layer5[51], layer6: layer6[51], layer7: layer7[51], layer8: layer8[51], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[52], layer1: layer1[52], layer2: layer2[52], layer3: layer3[52], layer4: layer4[52], layer5: layer5[52], layer6: layer6[52], layer7: layer7[52], layer8: layer8[52], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[53], layer1: layer1[53], layer2: layer2[53], layer3: layer3[53], layer4: layer4[53], layer5: layer5[53], layer6: layer6[53], layer7: layer7[53], layer8: layer8[53], unitSize: 1.75, baseSize: keySize)
            }
            HStack (spacing: 0) {//Row5
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[54], layer1: layer1[54], layer2: layer2[54], layer3: layer3[54], layer4: layer4[54], layer5: layer5[54], layer6: layer6[54], layer7: layer7[54], layer8: layer8[54], unitSize: 2.25, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[55], layer1: layer1[55], layer2: layer2[55], layer3: layer3[55], layer4: layer4[55], layer5: layer5[55], layer6: layer6[55], layer7: layer7[55], layer8: layer8[55], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[56], layer1: layer1[56], layer2: layer2[56], layer3: layer3[56], layer4: layer4[56], layer5: layer5[56], layer6: layer6[56], layer7: layer7[56], layer8: layer8[56], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[57], layer1: layer1[57], layer2: layer2[57], layer3: layer3[57], layer4: layer4[57], layer5: layer5[57], layer6: layer6[57], layer7: layer7[57], layer8: layer8[57], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[58], layer1: layer1[58], layer2: layer2[58], layer3: layer3[58], layer4: layer4[58], layer5: layer5[58], layer6: layer6[58], layer7: layer7[58], layer8: layer8[58], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[59], layer1: layer1[59], layer2: layer2[59], layer3: layer3[59], layer4: layer4[59], layer5: layer5[59], layer6: layer6[59], layer7: layer7[59], layer8: layer8[59], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[60], layer1: layer1[60], layer2: layer2[60], layer3: layer3[60], layer4: layer4[60], layer5: layer5[60], layer6: layer6[60], layer7: layer7[60], layer8: layer8[60], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[61], layer1: layer1[61], layer2: layer2[61], layer3: layer3[61], layer4: layer4[61], layer5: layer5[61], layer6: layer6[61], layer7: layer7[61], layer8: layer8[61], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[62], layer1: layer1[62], layer2: layer2[62], layer3: layer3[62], layer4: layer4[62], layer5: layer5[62], layer6: layer6[62], layer7: layer7[62], layer8: layer8[62], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[63], layer1: layer1[63], layer2: layer2[63], layer3: layer3[63], layer4: layer4[63], layer5: layer5[63], layer6: layer6[63], layer7: layer7[63], layer8: layer8[63], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[64], layer1: layer1[64], layer2: layer2[64], layer3: layer3[64], layer4: layer4[64], layer5: layer5[64], layer6: layer6[64], layer7: layer7[64], layer8: layer8[64], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[65], layer1: layer1[65], layer2: layer2[65], layer3: layer3[65], layer4: layer4[65], layer5: layer5[65], layer6: layer6[65], layer7: layer7[65], layer8: layer8[65], unitSize: 2.25, baseSize: keySize)
                
            }
            HStack (spacing: 0) {//Row6
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[66], layer1: layer1[66], layer2: layer2[66], layer3: layer3[66], layer4: layer4[66], layer5: layer5[66], layer6: layer6[66], layer7: layer7[66], layer8: layer8[66], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[67], layer1: layer1[67], layer2: layer2[67], layer3: layer3[67], layer4: layer4[67], layer5: layer5[67], layer6: layer6[67], layer7: layer7[67], layer8: layer8[67], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[68], layer1: layer1[68], layer2: layer2[68], layer3: layer3[68], layer4: layer4[68], layer5: layer5[68], layer6: layer6[68], layer7: layer7[68], layer8: layer8[68], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[69], layer1: layer1[69], layer2: layer2[69], layer3: layer3[69], layer4: layer4[69], layer5: layer5[69], layer6: layer6[69], layer7: layer7[69], layer8: layer8[69], unitSize: 1.25, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[70], layer1: layer1[70], layer2: layer2[70], layer3: layer3[70], layer4: layer4[70], layer5: layer5[70], layer6: layer6[70], layer7: layer7[70], layer8: layer8[70], unitSize: 5, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[71], layer1: layer1[71], layer2: layer2[71], layer3: layer3[71], layer4: layer4[71], layer5: layer5[71], layer6: layer6[71], layer7: layer7[71], layer8: layer8[71], unitSize: 1.25, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[72], layer1: layer1[72], layer2: layer2[72], layer3: layer3[72], layer4: layer4[72], layer5: layer5[72], layer6: layer6[72], layer7: layer7[72], layer8: layer8[72], unitSize: 1, baseSize: keySize)
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[73], layer1: layer1[73], layer2: layer2[73], layer3: layer3[73], layer4: layer4[73], layer5: layer5[73], layer6: layer6[73], layer7: layer7[73], layer8: layer8[73], unitSize: 1, baseSize: keySize)
                VStack (spacing: 0) {//ここにarrowの上下がくるなぁ〜専用のビューを作らないとダメだね
                    KeyboardKeyView_arrow_exportImage_allLayer(layer0: layer0[74], layer1: layer1[74],layer2: layer2[74],layer3: layer3[74],layer4: layer4[74], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_arrow_exportImage_allLayer(layer0: layer0[75], layer1: layer1[75],layer2: layer2[75],layer3: layer3[75],layer4: layer4[75], unitSize: 1, baseSize: keySize)
                }
                KeyboardKeyView_exportImage_allLayer(layer0: layer0[76], layer1: layer1[76], layer2: layer2[76], layer3: layer3[76], layer4: layer4[76], layer5: layer5[76], layer6: layer6[76], layer7: layer7[76], layer8: layer8[76], unitSize: 1, baseSize: keySize)
            }
        }
    }
}

struct BuiltInKeyboardView_JIS_allLayer: View {
    let keySize: CGFloat
    let layer0: [KeyboardKey]
    let layer1: [KeyboardKey]
    let layer2: [KeyboardKey]
    let layer3: [KeyboardKey]
    let layer4: [KeyboardKey]
    let layer5: [KeyboardKey]
    let layer6: [KeyboardKey]
    let layer7: [KeyboardKey]
    let layer8: [KeyboardKey]
    var body: some View {
        ZStack {
            VStack(alignment: .trailing ,spacing: 0) {
                Spacer()
                HStack (spacing: 0){
                    Spacer().frame(width: keySize * 13.25 - keySize * 0.07 * 4 + keySize * 0.07 / 2)
                    KeyboardKeyView_enter_JIS_exportImage_allLayer(layer0: layer0[53], layer1: layer1[53], layer2: layer2[53], layer3: layer3[53], layer4: layer4[53], layer5: layer5[53], layer6: layer6[53], layer7: layer7[53], layer8: layer8[53], baseSize: keySize)
                }
                Spacer()
            }
            VStack(alignment: .leading ,spacing: 0) {
                HStack (spacing: 0) {
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[0], layer1: layer1[0], layer2: layer2[0], layer3: layer3[0], layer4: layer4[0], layer5: layer5[0], layer6: layer6[0], layer7: layer7[0], layer8: layer8[0], unitSize: 1.5, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[1], layer1: layer1[1], layer2: layer2[1], layer3: layer3[1], layer4: layer4[1], layer5: layer5[1], layer6: layer6[1], layer7: layer7[1], layer8: layer8[1], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[2], layer1: layer1[2], layer2: layer2[2], layer3: layer3[2], layer4: layer4[2], layer5: layer5[2], layer6: layer6[2], layer7: layer7[2], layer8: layer8[2], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[3], layer1: layer1[3], layer2: layer2[3], layer3: layer3[3], layer4: layer4[3], layer5: layer5[3], layer6: layer6[3], layer7: layer7[3], layer8: layer8[3], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[4], layer1: layer1[4], layer2: layer2[4], layer3: layer3[4], layer4: layer4[4], layer5: layer5[4], layer6: layer6[4], layer7: layer7[4], layer8: layer8[4], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[5], layer1: layer1[5], layer2: layer2[5], layer3: layer3[5], layer4: layer4[5], layer5: layer5[5], layer6: layer6[5], layer7: layer7[5], layer8: layer8[5], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[6], layer1: layer1[6], layer2: layer2[6], layer3: layer3[6], layer4: layer4[6], layer5: layer5[6], layer6: layer6[6], layer7: layer7[6], layer8: layer8[6], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[7], layer1: layer1[7], layer2: layer2[7], layer3: layer3[7], layer4: layer4[7], layer5: layer5[7], layer6: layer6[7], layer7: layer7[7], layer8: layer8[7], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[8], layer1: layer1[8], layer2: layer2[8], layer3: layer3[8], layer4: layer4[8], layer5: layer5[8], layer6: layer6[8], layer7: layer7[8], layer8: layer8[8], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[9], layer1: layer1[9], layer2: layer2[9], layer3: layer3[9], layer4: layer4[9], layer5: layer5[9], layer6: layer6[9], layer7: layer7[9], layer8: layer8[9], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[10], layer1: layer1[10], layer2: layer2[10], layer3: layer3[10], layer4: layer4[10], layer5: layer5[10], layer6: layer6[10], layer7: layer7[10], layer8: layer8[10], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[11], layer1: layer1[11], layer2: layer2[11], layer3: layer3[11], layer4: layer4[11], layer5: layer5[11], layer6: layer6[11], layer7: layer7[11], layer8: layer8[11], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[12], layer1: layer1[12], layer2: layer2[12], layer3: layer3[12], layer4: layer4[12], layer5: layer5[12], layer6: layer6[12], layer7: layer7[12], layer8: layer8[12], unitSize: 1, baseSize: keySize)
                }
                
                HStack (spacing: 0) {//Row2
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[13], layer1: layer1[13], layer2: layer2[13], layer3: layer3[13], layer4: layer4[13], layer5: layer5[13], layer6: layer6[13], layer7: layer7[13], layer8: layer8[13], unitSize: 1.25, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[14], layer1: layer1[14], layer2: layer2[14], layer3: layer3[14], layer4: layer4[14], layer5: layer5[14], layer6: layer6[14], layer7: layer7[14], layer8: layer8[14], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[15], layer1: layer1[15], layer2: layer2[15], layer3: layer3[15], layer4: layer4[15], layer5: layer5[15], layer6: layer6[15], layer7: layer7[15], layer8: layer8[15], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[16], layer1: layer1[16], layer2: layer2[16], layer3: layer3[16], layer4: layer4[16], layer5: layer5[16], layer6: layer6[16], layer7: layer7[16], layer8: layer8[16], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[17], layer1: layer1[17], layer2: layer2[17], layer3: layer3[17], layer4: layer4[17], layer5: layer5[17], layer6: layer6[17], layer7: layer7[17], layer8: layer8[17], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[18], layer1: layer1[18], layer2: layer2[18], layer3: layer3[18], layer4: layer4[18], layer5: layer5[18], layer6: layer6[18], layer7: layer7[18], layer8: layer8[18], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[19], layer1: layer1[19], layer2: layer2[19], layer3: layer3[19], layer4: layer4[19], layer5: layer5[19], layer6: layer6[19], layer7: layer7[19], layer8: layer8[19], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[20], layer1: layer1[20], layer2: layer2[20], layer3: layer3[20], layer4: layer4[20], layer5: layer5[20], layer6: layer6[20], layer7: layer7[20], layer8: layer8[20], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[21], layer1: layer1[21], layer2: layer2[21], layer3: layer3[21], layer4: layer4[21], layer5: layer5[21], layer6: layer6[21], layer7: layer7[21], layer8: layer8[21], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[22], layer1: layer1[22], layer2: layer2[22], layer3: layer3[22], layer4: layer4[22], layer5: layer5[22], layer6: layer6[22], layer7: layer7[22], layer8: layer8[22], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[23], layer1: layer1[23], layer2: layer2[23], layer3: layer3[23], layer4: layer4[23], layer5: layer5[23], layer6: layer6[23], layer7: layer7[23], layer8: layer8[23], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[24], layer1: layer1[24], layer2: layer2[24], layer3: layer3[24], layer4: layer4[24], layer5: layer5[24], layer6: layer6[24], layer7: layer7[24], layer8: layer8[24], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[25], layer1: layer1[25], layer2: layer2[25], layer3: layer3[25], layer4: layer4[25], layer5: layer5[25], layer6: layer6[25], layer7: layer7[25], layer8: layer8[25], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[26], layer1: layer1[26], layer2: layer2[26], layer3: layer3[26], layer4: layer4[26], layer5: layer5[26], layer6: layer6[26], layer7: layer7[26], layer8: layer8[26], unitSize: 1.25, baseSize: keySize)//BS
                }
                HStack (spacing: 0) {//Row3
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[27], layer1: layer1[27], layer2: layer2[27], layer3: layer3[27], layer4: layer4[27], layer5: layer5[27], layer6: layer6[27], layer7: layer7[27], layer8: layer8[27], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[28], layer1: layer1[28], layer2: layer2[28], layer3: layer3[28], layer4: layer4[28], layer5: layer5[28], layer6: layer6[28], layer7: layer7[28], layer8: layer8[28], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[29], layer1: layer1[29], layer2: layer2[29], layer3: layer3[29], layer4: layer4[29], layer5: layer5[29], layer6: layer6[29], layer7: layer7[29], layer8: layer8[29], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[30], layer1: layer1[30], layer2: layer2[30], layer3: layer3[30], layer4: layer4[30], layer5: layer5[30], layer6: layer6[30], layer7: layer7[30], layer8: layer8[30], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[31], layer1: layer1[31], layer2: layer2[31], layer3: layer3[31], layer4: layer4[31], layer5: layer5[31], layer6: layer6[31], layer7: layer7[31], layer8: layer8[31], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[32], layer1: layer1[32], layer2: layer2[32], layer3: layer3[32], layer4: layer4[32], layer5: layer5[32], layer6: layer6[32], layer7: layer7[32], layer8: layer8[32], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[33], layer1: layer1[33], layer2: layer2[33], layer3: layer3[33], layer4: layer4[33], layer5: layer5[33], layer6: layer6[33], layer7: layer7[33], layer8: layer8[33], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[34], layer1: layer1[34], layer2: layer2[34], layer3: layer3[34], layer4: layer4[34], layer5: layer5[34], layer6: layer6[34], layer7: layer7[34], layer8: layer8[34], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[35], layer1: layer1[35], layer2: layer2[35], layer3: layer3[35], layer4: layer4[35], layer5: layer5[35], layer6: layer6[35], layer7: layer7[35], layer8: layer8[35], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[36], layer1: layer1[36], layer2: layer2[36], layer3: layer3[36], layer4: layer4[36], layer5: layer5[36], layer6: layer6[36], layer7: layer7[36], layer8: layer8[36], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[37], layer1: layer1[37], layer2: layer2[37], layer3: layer3[37], layer4: layer4[37], layer5: layer5[37], layer6: layer6[37], layer7: layer7[37], layer8: layer8[37], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[38], layer1: layer1[38], layer2: layer2[38], layer3: layer3[38], layer4: layer4[38], layer5: layer5[38], layer6: layer6[38], layer7: layer7[38], layer8: layer8[38], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[39], layer1: layer1[39], layer2: layer2[39], layer3: layer3[39], layer4: layer4[39], layer5: layer5[39], layer6: layer6[39], layer7: layer7[39], layer8: layer8[39], unitSize: 1, baseSize: keySize)//「
                }
                HStack (spacing: 0) {//Row4
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[40], layer1: layer1[40], layer2: layer2[40], layer3: layer3[40], layer4: layer4[40], layer5: layer5[40], layer6: layer6[40], layer7: layer7[40], layer8: layer8[40], unitSize: 1.25, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[41], layer1: layer1[41], layer2: layer2[41], layer3: layer3[41], layer4: layer4[41], layer5: layer5[41], layer6: layer6[41], layer7: layer7[41], layer8: layer8[41], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[42], layer1: layer1[42], layer2: layer2[42], layer3: layer3[42], layer4: layer4[42], layer5: layer5[42], layer6: layer6[42], layer7: layer7[42], layer8: layer8[42], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[43], layer1: layer1[43], layer2: layer2[43], layer3: layer3[43], layer4: layer4[43], layer5: layer5[43], layer6: layer6[43], layer7: layer7[43], layer8: layer8[43], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[44], layer1: layer1[44], layer2: layer2[44], layer3: layer3[44], layer4: layer4[44], layer5: layer5[44], layer6: layer6[44], layer7: layer7[44], layer8: layer8[44], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[45], layer1: layer1[45], layer2: layer2[45], layer3: layer3[45], layer4: layer4[45], layer5: layer5[45], layer6: layer6[45], layer7: layer7[45], layer8: layer8[45], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[46], layer1: layer1[46], layer2: layer2[46], layer3: layer3[46], layer4: layer4[46], layer5: layer5[46], layer6: layer6[46], layer7: layer7[46], layer8: layer8[46], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[47], layer1: layer1[47], layer2: layer2[47], layer3: layer3[47], layer4: layer4[47], layer5: layer5[47], layer6: layer6[47], layer7: layer7[47], layer8: layer8[47], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[48], layer1: layer1[48], layer2: layer2[48], layer3: layer3[48], layer4: layer4[48], layer5: layer5[48], layer6: layer6[48], layer7: layer7[48], layer8: layer8[48], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[49], layer1: layer1[49], layer2: layer2[49], layer3: layer3[49], layer4: layer4[49], layer5: layer5[49], layer6: layer6[49], layer7: layer7[49], layer8: layer8[49], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[50], layer1: layer1[50], layer2: layer2[50], layer3: layer3[50], layer4: layer4[50], layer5: layer5[50], layer6: layer6[50], layer7: layer7[50], layer8: layer8[50], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[51], layer1: layer1[51], layer2: layer2[51], layer3: layer3[51], layer4: layer4[51], layer5: layer5[51], layer6: layer6[51], layer7: layer7[51], layer8: layer8[51], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[52], layer1: layer1[52], layer2: layer2[52], layer3: layer3[52], layer4: layer4[52], layer5: layer5[52], layer6: layer6[52], layer7: layer7[52], layer8: layer8[52], unitSize: 1, baseSize: keySize)                    //                KeyboardKeyView( keyboardKey: layer[53], unitSize: 1.25)//エンター
                    
                    
                }
                HStack (spacing: 0) {//Row5
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[54], layer1: layer1[54], layer2: layer2[54], layer3: layer3[54], layer4: layer4[54], layer5: layer5[54], layer6: layer6[54], layer7: layer7[54], layer8: layer8[54], unitSize: 1.75, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[55], layer1: layer1[55], layer2: layer2[55], layer3: layer3[55], layer4: layer4[55], layer5: layer5[55], layer6: layer6[55], layer7: layer7[55], layer8: layer8[55], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[56], layer1: layer1[56], layer2: layer2[56], layer3: layer3[56], layer4: layer4[56], layer5: layer5[56], layer6: layer6[56], layer7: layer7[56], layer8: layer8[56], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[57], layer1: layer1[57], layer2: layer2[57], layer3: layer3[57], layer4: layer4[57], layer5: layer5[57], layer6: layer6[57], layer7: layer7[57], layer8: layer8[57], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[58], layer1: layer1[58], layer2: layer2[58], layer3: layer3[58], layer4: layer4[58], layer5: layer5[58], layer6: layer6[58], layer7: layer7[58], layer8: layer8[58], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[59], layer1: layer1[59], layer2: layer2[59], layer3: layer3[59], layer4: layer4[59], layer5: layer5[59], layer6: layer6[59], layer7: layer7[59], layer8: layer8[59], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[60], layer1: layer1[60], layer2: layer2[60], layer3: layer3[60], layer4: layer4[60], layer5: layer5[60], layer6: layer6[60], layer7: layer7[60], layer8: layer8[60], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[61], layer1: layer1[61], layer2: layer2[61], layer3: layer3[61], layer4: layer4[61], layer5: layer5[61], layer6: layer6[61], layer7: layer7[61], layer8: layer8[61], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[62], layer1: layer1[62], layer2: layer2[62], layer3: layer3[62], layer4: layer4[62], layer5: layer5[62], layer6: layer6[62], layer7: layer7[62], layer8: layer8[62], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[63], layer1: layer1[63], layer2: layer2[63], layer3: layer3[63], layer4: layer4[63], layer5: layer5[63], layer6: layer6[63], layer7: layer7[63], layer8: layer8[63], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[64], layer1: layer1[64], layer2: layer2[64], layer3: layer3[64], layer4: layer4[64], layer5: layer5[64], layer6: layer6[64], layer7: layer7[64], layer8: layer8[64], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[65], layer1: layer1[65], layer2: layer2[65], layer3: layer3[65], layer4: layer4[65], layer5: layer5[65], layer6: layer6[65], layer7: layer7[65], layer8: layer8[65], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[66], layer1: layer1[66], layer2: layer2[66], layer3: layer3[66], layer4: layer4[66], layer5: layer5[66], layer6: layer6[66], layer7: layer7[66], layer8: layer8[66], unitSize: 1.75, baseSize: keySize)
                    
                    
                }
                HStack (spacing: 0) {//Row6
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[67], layer1: layer1[67], layer2: layer2[67], layer3: layer3[67], layer4: layer4[67], layer5: layer5[67], layer6: layer6[67], layer7: layer7[67], layer8: layer8[67], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[68], layer1: layer1[68], layer2: layer2[68], layer3: layer3[68], layer4: layer4[68], layer5: layer5[68], layer6: layer6[68], layer7: layer7[68], layer8: layer8[68], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[69], layer1: layer1[69], layer2: layer2[69], layer3: layer3[69], layer4: layer4[69], layer5: layer5[69], layer6: layer6[69], layer7: layer7[69], layer8: layer8[69], unitSize: 1.25, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[70], layer1: layer1[70], layer2: layer2[70], layer3: layer3[70], layer4: layer4[70], layer5: layer5[70], layer6: layer6[70], layer7: layer7[70], layer8: layer8[70], unitSize: 1.25, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[71], layer1: layer1[71], layer2: layer2[71], layer3: layer3[71], layer4: layer4[71], layer5: layer5[71], layer6: layer6[71], layer7: layer7[71], layer8: layer8[71], unitSize: 3.5, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[72], layer1: layer1[72], layer2: layer2[72], layer3: layer3[72], layer4: layer4[72], layer5: layer5[72], layer6: layer6[72], layer7: layer7[72], layer8: layer8[72], unitSize: 1.25, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[73], layer1: layer1[73], layer2: layer2[73], layer3: layer3[73], layer4: layer4[73], layer5: layer5[73], layer6: layer6[73], layer7: layer7[73], layer8: layer8[73], unitSize: 1.25, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[74], layer1: layer1[74], layer2: layer2[74], layer3: layer3[74], layer4: layer4[74], layer5: layer5[74], layer6: layer6[74], layer7: layer7[74], layer8: layer8[74], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[75], layer1: layer1[75], layer2: layer2[75], layer3: layer3[75], layer4: layer4[75], layer5: layer5[75], layer6: layer6[75], layer7: layer7[75], layer8: layer8[75], unitSize: 1, baseSize: keySize)
                    VStack (spacing: 0) {
                        KeyboardKeyView_arrow_exportImage_allLayer(layer0: layer0[76], layer1: layer1[76], layer2: layer2[76], layer3: layer3[76], layer4: layer4[76], unitSize: 1, baseSize: keySize)
                        KeyboardKeyView_arrow_exportImage_allLayer(layer0: layer0[77], layer1: layer1[77], layer2: layer2[77], layer3: layer3[77], layer4: layer4[77], unitSize: 1, baseSize: keySize)
                    }
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[78], layer1: layer1[78], layer2: layer2[78], layer3: layer3[78], layer4: layer4[78], layer5: layer5[75], layer6: layer6[75], layer7: layer7[75], layer8: layer8[75], unitSize: 1, baseSize: keySize)
                }
            }
        }
    }
}

struct BuiltInKeyboardView_UK_allLayer: View {
    let keySize: CGFloat
    let layer0: [KeyboardKey]
    let layer1: [KeyboardKey]
    let layer2: [KeyboardKey]
    let layer3: [KeyboardKey]
    let layer4: [KeyboardKey]
    let layer5: [KeyboardKey]
    let layer6: [KeyboardKey]
    let layer7: [KeyboardKey]
    let layer8: [KeyboardKey]
    var body: some View {
        ZStack {
            VStack(alignment: .trailing ,spacing: 0) {
                Spacer()
                HStack (spacing: 0){
                    Spacer().frame(width: keySize * 13.75 - keySize * 0.07 * 4 + keySize * 0.07 / 2)
                    KeyboardKeyView_enter_UK_exportImage_allLayer(layer0: layer0[53],layer1: layer1[53],layer2: layer2[53], layer3: layer3[53], layer4: layer4[53], layer5: layer5[53], layer6: layer6[53], layer7: layer7[53], layer8: layer8[53], baseSize: keySize)
                }
                Spacer()
            }
            VStack(alignment: .leading, spacing: 0) {
                HStack (spacing: 0) {//Row1
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[0], layer1: layer1[0], layer2: layer2[0], layer3: layer3[0], layer4: layer4[0], layer5: layer5[0], layer6: layer6[0], layer7: layer7[0], layer8: layer8[0], unitSize: 1.5, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[1], layer1: layer1[1], layer2: layer2[1], layer3: layer3[1], layer4: layer4[1], layer5: layer5[1], layer6: layer6[1], layer7: layer7[1], layer8: layer8[1], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[2], layer1: layer1[2], layer2: layer2[2], layer3: layer3[2], layer4: layer4[2], layer5: layer5[2], layer6: layer6[2], layer7: layer7[2], layer8: layer8[2], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[3], layer1: layer1[3], layer2: layer2[3], layer3: layer3[3], layer4: layer4[3], layer5: layer5[3], layer6: layer6[3], layer7: layer7[3], layer8: layer8[3], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[4], layer1: layer1[4], layer2: layer2[4], layer3: layer3[4], layer4: layer4[4], layer5: layer5[4], layer6: layer6[4], layer7: layer7[4], layer8: layer8[4], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[5], layer1: layer1[5], layer2: layer2[5], layer3: layer3[5], layer4: layer4[5], layer5: layer5[5], layer6: layer6[5], layer7: layer7[5], layer8: layer8[5], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[6], layer1: layer1[6], layer2: layer2[6], layer3: layer3[6], layer4: layer4[6], layer5: layer5[6], layer6: layer6[6], layer7: layer7[6], layer8: layer8[6], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[7], layer1: layer1[7], layer2: layer2[7], layer3: layer3[7], layer4: layer4[7], layer5: layer5[7], layer6: layer6[7], layer7: layer7[7], layer8: layer8[7], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[8], layer1: layer1[8], layer2: layer2[8], layer3: layer3[8], layer4: layer4[8], layer5: layer5[8], layer6: layer6[8], layer7: layer7[8], layer8: layer8[8], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[9], layer1: layer1[9], layer2: layer2[9], layer3: layer3[9], layer4: layer4[9], layer5: layer5[9], layer6: layer6[9], layer7: layer7[9], layer8: layer8[9], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[10], layer1: layer1[10], layer2: layer2[10], layer3: layer3[10], layer4: layer4[10], layer5: layer5[10], layer6: layer6[10], layer7: layer7[10], layer8: layer8[10], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[11], layer1: layer1[11], layer2: layer2[11], layer3: layer3[11], layer4: layer4[11], layer5: layer5[11], layer6: layer6[11], layer7: layer7[11], layer8: layer8[11], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[12], layer1: layer1[12], layer2: layer2[12], layer3: layer3[12], layer4: layer4[12], layer5: layer5[12], layer6: layer6[12], layer7: layer7[12], layer8: layer8[12], unitSize: 1, baseSize: keySize)
                    
                }
                HStack (spacing: 0) {//Row2
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[13], layer1: layer1[13], layer2: layer2[13], layer3: layer3[13], layer4: layer4[13], layer5: layer5[13], layer6: layer6[13], layer7: layer7[13], layer8: layer8[13], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[14], layer1: layer1[14], layer2: layer2[14], layer3: layer3[14], layer4: layer4[14], layer5: layer5[14], layer6: layer6[14], layer7: layer7[14], layer8: layer8[14], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[15], layer1: layer1[15], layer2: layer2[15], layer3: layer3[15], layer4: layer4[15], layer5: layer5[15], layer6: layer6[15], layer7: layer7[15], layer8: layer8[15], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[16], layer1: layer1[16], layer2: layer2[16], layer3: layer3[16], layer4: layer4[16], layer5: layer5[16], layer6: layer6[16], layer7: layer7[16], layer8: layer8[16], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[17], layer1: layer1[17], layer2: layer2[17], layer3: layer3[17], layer4: layer4[17], layer5: layer5[17], layer6: layer6[17], layer7: layer7[17], layer8: layer8[17], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[18], layer1: layer1[18], layer2: layer2[18], layer3: layer3[18], layer4: layer4[18], layer5: layer5[18], layer6: layer6[18], layer7: layer7[18], layer8: layer8[18], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[19], layer1: layer1[19], layer2: layer2[19], layer3: layer3[19], layer4: layer4[19], layer5: layer5[19], layer6: layer6[19], layer7: layer7[19], layer8: layer8[19], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[20], layer1: layer1[20], layer2: layer2[20], layer3: layer3[20], layer4: layer4[20], layer5: layer5[20], layer6: layer6[20], layer7: layer7[20], layer8: layer8[20], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[21], layer1: layer1[21], layer2: layer2[21], layer3: layer3[21], layer4: layer4[21], layer5: layer5[21], layer6: layer6[21], layer7: layer7[21], layer8: layer8[21], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[22], layer1: layer1[22], layer2: layer2[22], layer3: layer3[22], layer4: layer4[22], layer5: layer5[22], layer6: layer6[22], layer7: layer7[22], layer8: layer8[22], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[23], layer1: layer1[23], layer2: layer2[23], layer3: layer3[23], layer4: layer4[23], layer5: layer5[23], layer6: layer6[23], layer7: layer7[23], layer8: layer8[23], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[24], layer1: layer1[24], layer2: layer2[24], layer3: layer3[24], layer4: layer4[24], layer5: layer5[24], layer6: layer6[24], layer7: layer7[24], layer8: layer8[24], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[25], layer1: layer1[25], layer2: layer2[25], layer3: layer3[25], layer4: layer4[25], layer5: layer5[25], layer6: layer6[25], layer7: layer7[25], layer8: layer8[25], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[26], layer1: layer1[26], layer2: layer2[26], layer3: layer3[26], layer4: layer4[26], layer5: layer5[26], layer6: layer6[26], layer7: layer7[26], layer8: layer8[26], unitSize: 1.5, baseSize: keySize)
                }
                HStack (spacing: 0) {//Row3
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[27], layer1: layer1[27], layer2: layer2[27], layer3: layer3[27], layer4: layer4[27], layer5: layer5[27], layer6: layer6[27], layer7: layer7[27], layer8: layer8[27], unitSize: 1.5, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[28], layer1: layer1[28], layer2: layer2[28], layer3: layer3[28], layer4: layer4[28], layer5: layer5[28], layer6: layer6[28], layer7: layer7[28], layer8: layer8[28], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[29], layer1: layer1[29], layer2: layer2[29], layer3: layer3[29], layer4: layer4[29], layer5: layer5[29], layer6: layer6[29], layer7: layer7[29], layer8: layer8[29], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[30], layer1: layer1[30], layer2: layer2[30], layer3: layer3[30], layer4: layer4[30], layer5: layer5[30], layer6: layer6[30], layer7: layer7[30], layer8: layer8[30], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[31], layer1: layer1[31], layer2: layer2[31], layer3: layer3[31], layer4: layer4[31], layer5: layer5[31], layer6: layer6[31], layer7: layer7[31], layer8: layer8[31], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[32], layer1: layer1[32], layer2: layer2[32], layer3: layer3[32], layer4: layer4[32], layer5: layer5[32], layer6: layer6[32], layer7: layer7[32], layer8: layer8[32], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[33], layer1: layer1[33], layer2: layer2[33], layer3: layer3[33], layer4: layer4[33], layer5: layer5[33], layer6: layer6[33], layer7: layer7[33], layer8: layer8[33], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[34], layer1: layer1[34], layer2: layer2[34], layer3: layer3[34], layer4: layer4[34], layer5: layer5[34], layer6: layer6[34], layer7: layer7[34], layer8: layer8[34], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[35], layer1: layer1[35], layer2: layer2[35], layer3: layer3[35], layer4: layer4[35], layer5: layer5[35], layer6: layer6[35], layer7: layer7[35], layer8: layer8[35], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[36], layer1: layer1[36], layer2: layer2[36], layer3: layer3[36], layer4: layer4[36], layer5: layer5[36], layer6: layer6[36], layer7: layer7[36], layer8: layer8[36], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[37], layer1: layer1[37], layer2: layer2[37], layer3: layer3[37], layer4: layer4[37], layer5: layer5[37], layer6: layer6[37], layer7: layer7[37], layer8: layer8[37], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[38], layer1: layer1[38], layer2: layer2[38], layer3: layer3[38], layer4: layer4[38], layer5: layer5[38], layer6: layer6[38], layer7: layer7[38], layer8: layer8[38], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[39], layer1: layer1[39], layer2: layer2[39], layer3: layer3[39], layer4: layer4[39], layer5: layer5[39], layer6: layer6[39], layer7: layer7[39], layer8: layer8[39], unitSize: 1, baseSize: keySize)
                    
                    
                }
                HStack (spacing: 0) {//Row4
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[40], layer1: layer1[40], layer2: layer2[40], layer3: layer3[40], layer4: layer4[40], layer5: layer5[40], layer6: layer6[40], layer7: layer7[40], layer8: layer8[40], unitSize: 1.75, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[41], layer1: layer1[41], layer2: layer2[41], layer3: layer3[41], layer4: layer4[41], layer5: layer5[41], layer6: layer6[41], layer7: layer7[41], layer8: layer8[41], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[42], layer1: layer1[42], layer2: layer2[42], layer3: layer3[42], layer4: layer4[42], layer5: layer5[42], layer6: layer6[42], layer7: layer7[42], layer8: layer8[42], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[43], layer1: layer1[43], layer2: layer2[43], layer3: layer3[43], layer4: layer4[43], layer5: layer5[43], layer6: layer6[43], layer7: layer7[43], layer8: layer8[43], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[44], layer1: layer1[44], layer2: layer2[44], layer3: layer3[44], layer4: layer4[44], layer5: layer5[44], layer6: layer6[44], layer7: layer7[44], layer8: layer8[44], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[45], layer1: layer1[45], layer2: layer2[45], layer3: layer3[45], layer4: layer4[45], layer5: layer5[45], layer6: layer6[45], layer7: layer7[45], layer8: layer8[45], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[46], layer1: layer1[46], layer2: layer2[46], layer3: layer3[46], layer4: layer4[46], layer5: layer5[46], layer6: layer6[46], layer7: layer7[46], layer8: layer8[46], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[47], layer1: layer1[47], layer2: layer2[47], layer3: layer3[47], layer4: layer4[47], layer5: layer5[47], layer6: layer6[47], layer7: layer7[47], layer8: layer8[47], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[48], layer1: layer1[48], layer2: layer2[48], layer3: layer3[48], layer4: layer4[48], layer5: layer5[48], layer6: layer6[48], layer7: layer7[48], layer8: layer8[48], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[49], layer1: layer1[49], layer2: layer2[49], layer3: layer3[49], layer4: layer4[49], layer5: layer5[49], layer6: layer6[49], layer7: layer7[49], layer8: layer8[49], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[50], layer1: layer1[50], layer2: layer2[50], layer3: layer3[50], layer4: layer4[50], layer5: layer5[50], layer6: layer6[50], layer7: layer7[50], layer8: layer8[50], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[51], layer1: layer1[51], layer2: layer2[51], layer3: layer3[51], layer4: layer4[51], layer5: layer5[51], layer6: layer6[51], layer7: layer7[51], layer8: layer8[51], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[52], layer1: layer1[52], layer2: layer2[52], layer3: layer3[52], layer4: layer4[52], layer5: layer5[52], layer6: layer6[52], layer7: layer7[52], layer8: layer8[52], unitSize: 1, baseSize: keySize)
                }
                HStack (spacing: 0) {//Row5
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[54], layer1: layer1[54], layer2: layer2[54], layer3: layer3[54], layer4: layer4[54], layer5: layer5[54], layer6: layer6[54], layer7: layer7[54], layer8: layer8[54], unitSize: 1.25, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[55], layer1: layer1[55], layer2: layer2[55], layer3: layer3[55], layer4: layer4[55], layer5: layer5[55], layer6: layer6[55], layer7: layer7[55], layer8: layer8[55], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[56], layer1: layer1[56], layer2: layer2[56], layer3: layer3[56], layer4: layer4[56], layer5: layer5[56], layer6: layer6[56], layer7: layer7[56], layer8: layer8[56], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[57], layer1: layer1[57], layer2: layer2[57], layer3: layer3[57], layer4: layer4[57], layer5: layer5[57], layer6: layer6[57], layer7: layer7[57], layer8: layer8[57], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[58], layer1: layer1[58], layer2: layer2[58], layer3: layer3[58], layer4: layer4[58], layer5: layer5[58], layer6: layer6[58], layer7: layer7[58], layer8: layer8[58], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[59], layer1: layer1[59], layer2: layer2[59], layer3: layer3[59], layer4: layer4[59], layer5: layer5[59], layer6: layer6[59], layer7: layer7[59], layer8: layer8[59], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[60], layer1: layer1[60], layer2: layer2[60], layer3: layer3[60], layer4: layer4[60], layer5: layer5[60], layer6: layer6[60], layer7: layer7[60], layer8: layer8[60], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[61], layer1: layer1[61], layer2: layer2[61], layer3: layer3[61], layer4: layer4[61], layer5: layer5[61], layer6: layer6[61], layer7: layer7[61], layer8: layer8[61], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[62], layer1: layer1[62], layer2: layer2[62], layer3: layer3[62], layer4: layer4[62], layer5: layer5[62], layer6: layer6[62], layer7: layer7[62], layer8: layer8[62], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[63], layer1: layer1[63], layer2: layer2[63], layer3: layer3[63], layer4: layer4[63], layer5: layer5[63], layer6: layer6[63], layer7: layer7[63], layer8: layer8[63], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[64], layer1: layer1[64], layer2: layer2[64], layer3: layer3[64], layer4: layer4[64], layer5: layer5[64], layer6: layer6[64], layer7: layer7[64], layer8: layer8[64], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[65], layer1: layer1[65], layer2: layer2[65], layer3: layer3[65], layer4: layer4[65], layer5: layer5[65], layer6: layer6[65], layer7: layer7[65], layer8: layer8[65], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[66], layer1: layer1[66], layer2: layer2[66], layer3: layer3[66], layer4: layer4[66], layer5: layer5[66], layer6: layer6[66], layer7: layer7[66], layer8: layer8[66], unitSize: 2.25, baseSize: keySize)
                    
                    
                }
                HStack (spacing: 0) {//Row6
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[67], layer1: layer1[67], layer2: layer2[67], layer3: layer3[67], layer4: layer4[67], layer5: layer5[67], layer6: layer6[67], layer7: layer7[67], layer8: layer8[67], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[68], layer1: layer1[68], layer2: layer2[68], layer3: layer3[68], layer4: layer4[68], layer5: layer5[68], layer6: layer6[68], layer7: layer7[68], layer8: layer8[68], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[69], layer1: layer1[69], layer2: layer2[69], layer3: layer3[69], layer4: layer4[69], layer5: layer5[69], layer6: layer6[69], layer7: layer7[69], layer8: layer8[69], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[70], layer1: layer1[70], layer2: layer2[70], layer3: layer3[70], layer4: layer4[70], layer5: layer5[70], layer6: layer6[70], layer7: layer7[70], layer8: layer8[70], unitSize: 1.25, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[71], layer1: layer1[71], layer2: layer2[71], layer3: layer3[71], layer4: layer4[71], layer5: layer5[71], layer6: layer6[71], layer7: layer7[71], layer8: layer8[71], unitSize: 5, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[72], layer1: layer1[72], layer2: layer2[72], layer3: layer3[72], layer4: layer4[72], layer5: layer5[72], layer6: layer6[72], layer7: layer7[72], layer8: layer8[72], unitSize: 1.25, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[73], layer1: layer1[73], layer2: layer2[73], layer3: layer3[73], layer4: layer4[73], layer5: layer5[73], layer6: layer6[73], layer7: layer7[73], layer8: layer8[73], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[74], layer1: layer1[74], layer2: layer2[74], layer3: layer3[74], layer4: layer4[74], layer5: layer5[74], layer6: layer6[74], layer7: layer7[74], layer8: layer8[74], unitSize: 1, baseSize: keySize)
                    VStack(spacing: 0) {
                        KeyboardKeyView_arrow_exportImage_allLayer(layer0: layer0[75], layer1: layer1[75], layer2: layer2[75], layer3: layer3[75], layer4: layer4[75], unitSize: 1, baseSize: keySize)
                        KeyboardKeyView_arrow_exportImage_allLayer(layer0: layer0[76], layer1: layer1[76], layer2: layer2[76], layer3: layer3[76], layer4: layer4[76], unitSize: 1, baseSize: keySize)
                    }
                    KeyboardKeyView_exportImage_allLayer(layer0: layer0[77], layer1: layer1[77], layer2: layer2[77], layer3: layer3[77], layer4: layer4[77], layer5: layer5[77], layer6: layer6[77], layer7: layer7[77], layer8: layer8[77], unitSize: 1, baseSize: keySize)
                }
            }
            
        }
    }
}

struct KeyboardKeyView_exportImage_allLayer: View {
    @State var layer0: KeyboardKey
    @State var layer1: KeyboardKey
    @State var layer2: KeyboardKey
    @State var layer3: KeyboardKey
    @State var layer4: KeyboardKey
    @State var layer5: KeyboardKey
    @State var layer6: KeyboardKey
    @State var layer7: KeyboardKey
    @State var layer8: KeyboardKey
    let unitSize: Double
    let baseSize: CGFloat
    
    private var padding: CGFloat { baseSize * 0.07 }
    private var round: CGFloat { baseSize * 0.07 }
    private var totalWidth: CGFloat { baseSize * unitSize }
    private var totalHeight: CGFloat { baseSize }
    private var frameWidth: CGFloat { totalWidth - (padding * 2) }
    private var frameHeight: CGFloat { totalHeight - (padding * 2) }
    private var strokeWidth: CGFloat { baseSize * 0.07 / 2 }
    
    private var tapFontSize: CGFloat { baseSize * 20 / 65}
    private var holdFontSize: CGFloat { baseSize * 40 / 65}
    private var tapFontSize_layer: CGFloat{ baseSize * 14 / 65}
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: round)
                .stroke(.gray, lineWidth: strokeWidth)
                .frame(width: frameWidth, height: frameHeight)
            
            ZStack {
                // Layer 0 (中央)
                ZStack {
                    holdKeyView(for: layer0)
                    tapKeyView(for: layer0)
                }
                .frame(width: frameWidth, height: frameHeight)
                
                
                VStack(spacing: 0) {//上
                    HStack(spacing: 0) {
                        Spacer()
                        tapKeyView(for: layer5)
                            .frame(width: frameWidth * 0.5, height: frameHeight * 0.5, alignment: .top)
                            .scaleEffect(0.7, anchor: .top)
                            .padding(.top, padding)
                        Spacer()
                    }
                    Spacer()
                }
                VStack(spacing: 0) {//下
                    Spacer()
                    HStack(spacing: 0) {
                        Spacer()
                        tapKeyView(for: layer8)
                            .frame(width: frameWidth * 0.5, height: frameHeight * 0.5, alignment: .bottom)
                            .scaleEffect(0.7, anchor: .bottom)
                            .padding(.bottom, padding)
                        Spacer()
                    }
                }
                 HStack(spacing: 0) {//左
                     tapKeyView(for: layer6)
                         .frame(width: frameWidth * 0.5, height: frameHeight * 0.5, alignment: .leading)
                         .scaleEffect(0.7, anchor: .leading)
                         .padding(.leading, padding)
                     Spacer()
                 }
                HStack(spacing: 0) {//右
                    Spacer()
                    tapKeyView(for: layer7)
                        .frame(width: frameWidth * 0.5, height: frameHeight * 0.5, alignment: .trailing)
                        .scaleEffect(0.7, anchor: .trailing)
                        .padding(.trailing, padding)
                }
                
                // 四隅
                VStack(spacing: 0) {//左上
                    HStack(spacing: 0) {
                        tapKeyView(for: layer1)
                            .frame(width: frameWidth * 0.5, height: frameHeight * 0.5, alignment: .topLeading)
                            .scaleEffect(0.7, anchor: .topLeading)
                            .padding(.top, padding)
                            .padding(.leading, padding)
                        Spacer()
                    }
                    Spacer()
                }
                VStack(spacing: 0) {//右上
                    HStack(spacing: 0) {
                        Spacer()
                        tapKeyView(for: layer2)
                            .frame(width: frameWidth * 0.5, height: frameHeight * 0.5, alignment: .topTrailing)
                            .scaleEffect(0.7, anchor: .topTrailing)
                            .padding(.top, padding)
                            .padding(.trailing, padding)
                    }
                    Spacer()
                }
                VStack(spacing: 0) {//左下
                    Spacer()
                    HStack(spacing: 0) {
                        tapKeyView(for: layer3)
                            .frame(width: frameWidth * 0.5, height: frameHeight * 0.5, alignment: .bottomLeading)
                            .scaleEffect(0.7, anchor: .bottomLeading)
                            .padding(.bottom, padding)
                            .padding(.leading, padding)
                        Spacer()
                    }
                }
                VStack(spacing: 0) {//右下
                    Spacer()
                    HStack(spacing: 0) {
                        Spacer()
                        tapKeyView(for: layer4)
                            .frame(width: frameWidth * 0.5, height: frameHeight * 0.5, alignment: .bottomTrailing)
                            .scaleEffect(0.7, anchor: .bottomTrailing)
                            .padding(.bottom, padding)
                            .padding(.trailing, padding)
                    }
                }
                

                
            }
        }
        .frame(width: frameWidth, height: frameHeight)
        .background(.clear)
        .padding(padding)
    }
    
    private func getLayer(_ index: Int) -> KeyboardKey {
        switch index {
        case 0: return layer0
        case 1: return layer1
        case 2: return layer2
        case 3: return layer3
        case 4: return layer4
        case 5: return layer5
        case 6: return layer6
        case 7: return layer7
        case 8: return layer8
        default: return layer0
        }
    }
    
    private func highLightColor_tap(for layer: KeyboardKey) -> Color {
        LayerColor.fromIndex(layer.layerKeyNumber_tap).textColor_export
    }
    
    private func highLightColor_hold(for layer: KeyboardKey) -> Color {
        LayerColor.fromIndex(layer.layerKeyNumber_hold).textColor_export
    }
    
    private func textColor(for layer: KeyboardKey) -> Color {
        LayerColor.fromIndex(layer.layerNumber).textColor_export
    }
    
    private func holdKeyView(for layer: KeyboardKey) -> some View {
        VStack {
            if layer.isTapHoldEnabled {
                if layer.layerKeyNumber_hold > 0 {
                    HStack(spacing: 0) {
                        symbolOrText(layer.holdDisplaySymbol,
                                    isSymbol: layer.isAfterHoldSFSymbol,
                                     size: holdFontSize,
                                    color: highLightColor_hold(for: layer))
                    }
                } else {
                    HStack(spacing: 0) {
                        symbolOrText(layer.holdDisplaySymbol,
                                    isSymbol: layer.isAfterHoldSFSymbol,
                                     size: holdFontSize,
                                    color: textColor(for: layer))
                    }
                }
            }
        }
        .opacity(0.5)
    }
    
    private func tapKeyView(for layer: KeyboardKey) -> some View {
        Group {
            if layer.isCustomized {
                customizedContent(for: layer, isSmall: layer.layerNumber > 0)
            } else {
                if layer.layerNumber == 0 {
                    defaultContent(for: layer)
                }
            }
        }
    }
    
    private func defaultContent(for layer: KeyboardKey) -> some View {
        symbolOrText(layer.beforeDisplaySymbol,
                     isSymbol: layer.isBeforeSFSymbol,
                     size: tapFontSize,
                     color: textColor(for: layer))
    }
    
    private func customizedContent(for layer: KeyboardKey, isSmall: Bool = false) -> some View {
        HStack(spacing: 0) {
            if layer.layerKeyNumber_tap > 0 {
                symbolOrText(layer.afterDisplaySymbol,
                             isSymbol: layer.isAfterTapSFSymbol,
                             size: isSmall ? tapFontSize_layer : tapFontSize,
                             color: highLightColor_tap(for: layer))
            } else {
                modifierContent_tap(for: layer).foregroundStyle(textColor(for: layer))
                symbolOrText(layer.afterDisplaySymbol,
                             isSymbol: layer.isAfterTapSFSymbol,
                             size: isSmall ? tapFontSize_layer : tapFontSize,
                             color: textColor(for: layer))
                
            }
        }
    }
    
    private func modifierContent_tap(for layer: KeyboardKey) -> some View {
        VStack(spacing: 0) {
            if layer.tapWithModifier {
//                Spacer()
                HStack(spacing: 0) {
                    if layer.tapWithShift {
                        Image(systemName: "shift")
                    }
                    if layer.tapWithControl {
                        Image(systemName: "control")
                    }
                }
                HStack(spacing: 0) {
                    if layer.tapWithCommand {
                        Image(systemName: "command")
                    }
                    if layer.tapWithOption {
                        Image(systemName: "option")
                    }
                }
                if layer.tapWithFn {
                    Image(systemName: "globe")
                }
//                Spacer()
            }
        }
        .font(.system(size: modifierFontSize_tap(for: layer)))
    }
    
    private func modifierFontSize_tap(for layer: KeyboardKey) -> CGFloat {
        var activeModifierCount = 0
        if layer.tapWithShift { activeModifierCount += 1 }
        if layer.tapWithControl { activeModifierCount += 1 }
        if layer.tapWithCommand { activeModifierCount += 1 }
        if layer.tapWithOption { activeModifierCount += 1 }
        if layer.tapWithFn { activeModifierCount += 1 }
        
        if layer.layerNumber > 0 {
            switch activeModifierCount {
            case 1: return baseSize * 14 / 65
            default: return baseSize * 6 / 65
                
            }
        } else {
            switch activeModifierCount {
            case 0, 1: return baseSize * 14 / 65
            case 2: return baseSize * 10 / 65
            default: return baseSize * 6 / 65
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


struct KeyboardKeyView_enter_JIS_exportImage_allLayer: View {
    @State var layer0: KeyboardKey
    @State var layer1: KeyboardKey
    @State var layer2: KeyboardKey
    @State var layer3: KeyboardKey
    @State var layer4: KeyboardKey
    @State var layer5: KeyboardKey
    @State var layer6: KeyboardKey
    @State var layer7: KeyboardKey
    @State var layer8: KeyboardKey
    
    let baseSize: CGFloat
    
    private var padding: CGFloat { baseSize * 0.07 }
    private var round: CGFloat { baseSize * 0.07 }
    private var totalWidth: CGFloat { baseSize * 1.5}
    private var totalHeight: CGFloat { baseSize * 2}
    private var frameWidth: CGFloat { totalWidth}
    private var frameHeight: CGFloat { totalHeight}
    private var strokeWidth: CGFloat { baseSize * 0.07 / 2 }
    
    private var tapFontSize: CGFloat { baseSize * 20 / 65}
    private var holdFontSize: CGFloat { baseSize * 40 / 65}
    private var tapFontSize_layer: CGFloat{ baseSize * 14 / 65}
    
    var body: some View {
        ZStack {
            EnterShape_JIS(frameValue: baseSize)
                .stroke(.gray, lineWidth: strokeWidth)
                .frame(width: frameWidth, height: frameHeight)
            
            ZStack {
                // Layer 0 (中央)
                ZStack {
                    holdKeyView(for: layer0)
                    tapKeyView(for: layer0)
                }
                .frame(width: frameWidth, height: frameHeight)
                
                
                VStack(spacing: 0) {//上
                    tapKeyView(for: layer5)
                        .frame(width: baseSize * 0.5, height: baseSize * 0.5, alignment: .top)
                        .scaleEffect(0.7, anchor: .top)
                        .padding(.top, padding * 2)

                    Spacer()
                }
                VStack(spacing: 0) {//下
                    Spacer()
                    tapKeyView(for: layer8)
                        .frame(width: baseSize * 0.5, height: baseSize * 0.5, alignment: .bottom)
                        .scaleEffect(0.7, anchor: .bottom)
                        .padding(.bottom, padding * 2)
                        .padding(.leading, padding * 3)
                }
                 HStack(spacing: 0) {//左
                     tapKeyView(for: layer6)
                         .frame(width: baseSize * 0.5, height: baseSize * 0.5, alignment: .leading)
                         .scaleEffect(0.7, anchor: .leading)
                         .padding(.leading, padding * 2)
                         .padding(.bottom, padding * 6)//≒0.25u
                     Spacer()
                 }
                HStack(spacing: 0) {//右
                    Spacer()
                    tapKeyView(for: layer7)
                        .frame(width: baseSize * 0.5, height: baseSize * 0.5, alignment: .trailing)
                        .scaleEffect(0.7, anchor: .trailing)
                        .padding(.trailing, padding * 2)
                }
                
                // 四隅
                VStack(spacing: 0) {//左上
                    HStack(spacing: 0) {
                        tapKeyView(for: layer1)
                            .frame(width: baseSize * 0.5, height: baseSize * 0.5, alignment: .topLeading)
                            .scaleEffect(0.7, anchor: .topLeading)
                            .padding(.leading, padding * 2)
                            .padding(.top, padding * 2)
                        Spacer()
                    }
                    Spacer()
                }
                VStack(spacing: 0) {//右上
                    HStack(spacing: 0) {
                        Spacer()
                        tapKeyView(for: layer2)
                            .frame(width: baseSize * 0.5, height: baseSize * 0.5, alignment: .topTrailing)
                            .scaleEffect(0.7, anchor: .topTrailing)
                            .padding(.trailing, padding * 2)
                            .padding(.top, padding * 2)

                    }
                    Spacer()
                }
                VStack(spacing: 0) {//左下
                    Spacer()
                    HStack(spacing: 0) {
                        tapKeyView(for: layer3)
                            .frame(width: baseSize * 0.5, height: baseSize * 0.5, alignment: .bottomLeading)
                            .scaleEffect(0.7, anchor: .bottomLeading)
                            .padding(.leading, padding * 5)
                            .padding(.bottom, padding * 2)

                        Spacer()
                    }
                }
                VStack(spacing: 0) {//右下
                    Spacer()
                    HStack(spacing: 0) {
                        Spacer()
                        tapKeyView(for: layer4)
                            .frame(width: baseSize * 0.5, height: baseSize * 0.5, alignment: .bottomTrailing)
                            .scaleEffect(0.7, anchor: .bottomTrailing)
                            .padding(.trailing, padding * 2)
                            .padding(.bottom, padding * 2)
                    }
                }
            }
        }
        .frame(width: frameWidth, height: frameHeight)
        .background(.clear)
    }
    
    private func getLayer(_ index: Int) -> KeyboardKey {
        switch index {
        case 0: return layer0
        case 1: return layer1
        case 2: return layer2
        case 3: return layer3
        case 4: return layer4
        case 5: return layer5
        case 6: return layer6
        case 7: return layer7
        case 8: return layer8
        default: return layer0
        }
    }
    
    private func highLightColor_tap(for layer: KeyboardKey) -> Color {
        LayerColor.fromIndex(layer.layerKeyNumber_tap).textColor_export
    }
    
    private func highLightColor_hold(for layer: KeyboardKey) -> Color {
        LayerColor.fromIndex(layer.layerKeyNumber_hold).textColor_export
    }
    
    private func textColor(for layer: KeyboardKey) -> Color {
        LayerColor.fromIndex(layer.layerNumber).textColor_export
    }
    
    private func holdKeyView(for layer: KeyboardKey) -> some View {
        VStack {
            if layer.isTapHoldEnabled {
                if layer.layerKeyNumber_hold > 0 {
                    HStack(spacing: 0) {
                        symbolOrText(layer.holdDisplaySymbol,
                                    isSymbol: layer.isAfterHoldSFSymbol,
                                    size: holdFontSize,
                                    color: highLightColor_hold(for: layer))
                    }
                } else {
                    HStack(spacing: 0) {
                        symbolOrText(layer.holdDisplaySymbol,
                                    isSymbol: layer.isAfterHoldSFSymbol,
                                     size: holdFontSize,
                                    color: textColor(for: layer))
                    }
                }
            }
        }
        .opacity(0.5)
    }
    
    private func tapKeyView(for layer: KeyboardKey) -> some View {
        Group {
            if layer.isCustomized {
                customizedContent(for: layer, isSmall: layer.layerNumber > 0)
            } else {
                if layer.layerNumber == 0 {
                    defaultContent(for: layer)
                }
            }
        }
    }
    
    private func defaultContent(for layer: KeyboardKey) -> some View {
        symbolOrText(layer.beforeDisplaySymbol,
                     isSymbol: layer.isBeforeSFSymbol,
                     size: tapFontSize,
                     color: textColor(for: layer))
    }
    
    private func customizedContent(for layer: KeyboardKey, isSmall: Bool = false) -> some View {
        HStack(spacing: 0) {
            if layer.layerKeyNumber_tap > 0 {
                symbolOrText(layer.afterDisplaySymbol,
                             isSymbol: layer.isAfterTapSFSymbol,
                             size: isSmall ? tapFontSize_layer : tapFontSize,
                             color: highLightColor_tap(for: layer))
            } else {
                modifierContent_tap(for: layer).foregroundStyle(textColor(for: layer))
                symbolOrText(layer.afterDisplaySymbol,
                             isSymbol: layer.isAfterTapSFSymbol,
                             size: isSmall ? tapFontSize_layer : tapFontSize,
                             color: textColor(for: layer))
            }
        }
    }
    
    private func modifierContent_tap(for layer: KeyboardKey) -> some View {
        VStack(spacing: 0) {
            if layer.tapWithModifier {
//                Spacer()
                HStack(spacing: 0) {
                    if layer.tapWithShift {
                        Image(systemName: "shift")
                    }
                    if layer.tapWithControl {
                        Image(systemName: "control")
                    }
                }
                HStack(spacing: 0) {
                    if layer.tapWithCommand {
                        Image(systemName: "command")
                    }
                    if layer.tapWithOption {
                        Image(systemName: "option")
                    }
                }
                if layer.tapWithFn {
                    Image(systemName: "globe")
                }
//                Spacer()
            }
        }
        .font(.system(size: modifierFontSize_tap(for: layer)))
    }
    
    private func modifierFontSize_tap(for layer: KeyboardKey) -> CGFloat {
        var activeModifierCount = 0
        if layer.tapWithShift { activeModifierCount += 1 }
        if layer.tapWithControl { activeModifierCount += 1 }
        if layer.tapWithCommand { activeModifierCount += 1 }
        if layer.tapWithOption { activeModifierCount += 1 }
        if layer.tapWithFn { activeModifierCount += 1 }
        
        if layer.layerNumber > 0 {
            switch activeModifierCount {
            case 1: return baseSize * 14 / 65
            default: return baseSize * 6 / 65
                
            }
        } else {
            switch activeModifierCount {
            case 0, 1: return baseSize * 14 / 65
            case 2: return baseSize * 10 / 65
            default: return baseSize * 6 / 65
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
struct KeyboardKeyView_enter_UK_exportImage_allLayer: View {
    @State var layer0: KeyboardKey
    @State var layer1: KeyboardKey
    @State var layer2: KeyboardKey
    @State var layer3: KeyboardKey
    @State var layer4: KeyboardKey
    @State var layer5: KeyboardKey
    @State var layer6: KeyboardKey
    @State var layer7: KeyboardKey
    @State var layer8: KeyboardKey
    let baseSize: CGFloat
    
    private var padding: CGFloat { baseSize * 0.07 }
    private var round: CGFloat { baseSize * 0.07 }
    private var totalWidth: CGFloat { baseSize}
    private var totalHeight: CGFloat { baseSize * 2}
    private var frameWidth: CGFloat { totalWidth }
    private var frameHeight: CGFloat { totalHeight }
    private var strokeWidth: CGFloat { baseSize * 0.07 / 2 }
    
    private var tapFontSize: CGFloat { baseSize * 20 / 65}
    private var holdFontSize: CGFloat { baseSize * 40 / 65}
    private var tapFontSize_layer: CGFloat{ baseSize * 14 / 65}
    
    var body: some View {
        ZStack {
            EnterShape_UK(frameValue: baseSize)
                .stroke(.gray, lineWidth: strokeWidth)
                .frame(width: frameWidth, height: frameHeight)
            
            ZStack {
                // Layer 0 (中央)
                ZStack {
                    holdKeyView(for: layer0)
                    tapKeyView(for: layer0)
                }
                .frame(width: frameWidth, height: frameHeight)
                
                
                VStack(spacing: 0) {//上
                    tapKeyView(for: layer5)
                        .frame(width: baseSize * 0.5, height: baseSize * 0.5, alignment: .top)
                        .scaleEffect(0.7, anchor: .top)
                        .padding(.top, padding * 2)

                    Spacer()
                }
                VStack(spacing: 0) {//下
                    Spacer()
                    tapKeyView(for: layer8)
                        .frame(width: baseSize * 0.5, height: baseSize * 0.5, alignment: .bottom)
                        .scaleEffect(0.7, anchor: .bottom)
                        .padding(.bottom, padding * 2)
                        .padding(.leading, padding * 3)
                }
                 HStack(spacing: 0) {//左
                     tapKeyView(for: layer6)
                         .frame(width: baseSize * 0.5, height: baseSize * 0.5, alignment: .leading)
                         .scaleEffect(0.7, anchor: .leading)
                         .padding(.leading, padding * 2)
                         .padding(.bottom, padding * 6)
                     Spacer()
                 }
                HStack(spacing: 0) {//右
                    Spacer()
                    tapKeyView(for: layer7)
                        .frame(width: baseSize * 0.5, height: baseSize * 0.5, alignment: .trailing)
                        .scaleEffect(0.7, anchor: .trailing)
                        .padding(.trailing, padding * 2)
                        .padding(.bottom, padding * 6)
                }
                
                // 四隅
                VStack(spacing: 0) {//左上
                    HStack(spacing: 0) {
                        tapKeyView(for: layer1)
                            .frame(width: baseSize * 0.5, height: baseSize * 0.5, alignment: .topLeading)
                            .scaleEffect(0.7, anchor: .topLeading)
                            .padding(.leading, padding * 2)
                            .padding(.top, padding * 2)
                        Spacer()
                    }
                    Spacer()
                }
                VStack(spacing: 0) {//右上
                    HStack(spacing: 0) {
                        Spacer()
                        tapKeyView(for: layer2)
                            .frame(width: baseSize * 0.5, height: baseSize * 0.5, alignment: .topTrailing)
                            .scaleEffect(0.7, anchor: .topTrailing)
                            .padding(.trailing, padding * 2)
                            .padding(.top, padding * 2)

                    }
                    Spacer()
                }
                VStack(spacing: 0) {//左下
                    Spacer()
                    HStack(spacing: 0) {
                        tapKeyView(for: layer3)
                            .frame(width: baseSize * 0.5, height: baseSize * 0.5, alignment: .bottomLeading)
                            .scaleEffect(0.7, anchor: .bottomLeading)
                            .padding(.leading, padding * 5)
                            .padding(.bottom, padding * 2)

                        Spacer()
                    }
                }
                VStack(spacing: 0) {//右下
                    Spacer()
                    HStack(spacing: 0) {
                        Spacer()
                        tapKeyView(for: layer4)
                            .frame(width: baseSize * 0.5, height: baseSize * 0.5, alignment: .bottomTrailing)
                            .scaleEffect(0.7, anchor: .bottomTrailing)
                            .padding(.trailing, padding * 2)
                            .padding(.bottom, padding * 2)
                    }
                }

            }
        }
        .frame(width: frameWidth, height: frameHeight)
        .background(.clear)
    }
    
    private func getLayer(_ index: Int) -> KeyboardKey {
        switch index {
        case 0: return layer0
        case 1: return layer1
        case 2: return layer2
        case 3: return layer3
        case 4: return layer4
        case 5: return layer5
        case 6: return layer6
        case 7: return layer7
        case 8: return layer8
        default: return layer0
        }
    }
    
    private func highLightColor_tap(for layer: KeyboardKey) -> Color {
        LayerColor.fromIndex(layer.layerKeyNumber_tap).textColor_export
    }
    
    private func highLightColor_hold(for layer: KeyboardKey) -> Color {
        LayerColor.fromIndex(layer.layerKeyNumber_hold).textColor_export
    }
    
    private func textColor(for layer: KeyboardKey) -> Color {
        LayerColor.fromIndex(layer.layerNumber).textColor_export
    }
    
    private func holdKeyView(for layer: KeyboardKey) -> some View {
        VStack {
            if layer.isTapHoldEnabled {
                if layer.layerKeyNumber_hold > 0 {
                    HStack(spacing: 0) {
                        symbolOrText(layer.holdDisplaySymbol,
                                    isSymbol: layer.isAfterHoldSFSymbol,
                                    size: holdFontSize,
                                    color: highLightColor_hold(for: layer))
                    }
                } else {
                    HStack(spacing: 0) {
                        symbolOrText(layer.holdDisplaySymbol,
                                    isSymbol: layer.isAfterHoldSFSymbol,
                                     size: holdFontSize,
                                    color: textColor(for: layer))
                    }
                }
            }
        }
        .opacity(0.5)
    }
    
    private func tapKeyView(for layer: KeyboardKey) -> some View {
        Group {
            if layer.isCustomized {
                customizedContent(for: layer, isSmall: layer.layerNumber > 0)
            } else {
                if layer.layerNumber == 0 {
                    defaultContent(for: layer)
                }
            }
        }
    }
    
    private func defaultContent(for layer: KeyboardKey) -> some View {
        symbolOrText(layer.beforeDisplaySymbol,
                     isSymbol: layer.isBeforeSFSymbol,
                     size: tapFontSize,
                     color: textColor(for: layer))
    }
    
    private func customizedContent(for layer: KeyboardKey, isSmall: Bool = false) -> some View {
        HStack(spacing: 0) {
            if layer.layerKeyNumber_tap > 0 {
                symbolOrText(layer.afterDisplaySymbol,
                             isSymbol: layer.isAfterTapSFSymbol,
                             size: isSmall ? tapFontSize_layer : tapFontSize,
                             color: highLightColor_tap(for: layer))
            } else {
                modifierContent_tap(for: layer).foregroundStyle(textColor(for: layer))
                symbolOrText(layer.afterDisplaySymbol,
                             isSymbol: layer.isAfterTapSFSymbol,
                             size: isSmall ? tapFontSize_layer : tapFontSize,
                             color: textColor(for: layer))
            }
        }
    }
    
    private func modifierContent_tap(for layer: KeyboardKey) -> some View {
        VStack(spacing: 0) {
            if layer.tapWithModifier {
//                Spacer()
                HStack(spacing: 0) {
                    if layer.tapWithShift {
                        Image(systemName: "shift")
                    }
                    if layer.tapWithControl {
                        Image(systemName: "control")
                    }
                }
                HStack(spacing: 0) {
                    if layer.tapWithCommand {
                        Image(systemName: "command")
                    }
                    if layer.tapWithOption {
                        Image(systemName: "option")
                    }
                }
                if layer.tapWithFn {
                    Image(systemName: "globe")
                }
//                Spacer()
            }
        }
        .font(.system(size: modifierFontSize_tap(for: layer)))
    }
    
    private func modifierFontSize_tap(for layer: KeyboardKey) -> CGFloat {
        var activeModifierCount = 0
        if layer.tapWithShift { activeModifierCount += 1 }
        if layer.tapWithControl { activeModifierCount += 1 }
        if layer.tapWithCommand { activeModifierCount += 1 }
        if layer.tapWithOption { activeModifierCount += 1 }
        if layer.tapWithFn { activeModifierCount += 1 }
        
        if layer.layerNumber > 0 {
            switch activeModifierCount {
            case 1: return baseSize * 14 / 65
            default: return baseSize * 6 / 65
                
            }
        } else {
            switch activeModifierCount {
            case 0, 1: return baseSize * 14 / 65
            case 2: return baseSize * 10 / 65
            default: return baseSize * 6 / 65
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
struct KeyboardKeyView_arrow_exportImage_allLayer: View {
    @State var layer0: KeyboardKey
    @State var layer1: KeyboardKey
    @State var layer2: KeyboardKey
    @State var layer3: KeyboardKey
    @State var layer4: KeyboardKey
    let unitSize: Double
    let baseSize: CGFloat
    
    private var padding: CGFloat { baseSize * 0.07 }
    private var round: CGFloat { baseSize * 0.07 }
    private var totalWidth: CGFloat { baseSize * unitSize }
    private var totalHeight: CGFloat { baseSize * 0.5 }
    private var frameWidth: CGFloat { totalWidth - (padding * 2) }
    private var frameHeight: CGFloat { totalHeight - (padding * 2) }
    private var strokeWidth: CGFloat { baseSize * 0.07 / 2 }
    
    private var tapFontSize: CGFloat { baseSize * 20 / 65}
    private var holdFontSize: CGFloat { baseSize * 40 / 65}
    private var tapFontSize_layer: CGFloat{ baseSize * 14 / 65}
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: round)
                .stroke(.gray, lineWidth: strokeWidth)
                .frame(width: frameWidth, height: frameHeight)
            
            ZStack {
                // Layer 0 (中央)
                ZStack {
                    holdKeyView(for: layer0)
                    tapKeyView(for: layer0)
                }
                .frame(width: frameWidth, height: frameHeight)
                
                // 四隅のレイヤー
                VStack {
                    HStack {
                        tapKeyView(for: layer1)
                            .frame(width: frameWidth * 0.4, height: frameHeight * 0.4)
                        Spacer()
                        tapKeyView(for: layer2)
                            .frame(width: frameWidth * 0.4, height: frameHeight * 0.4)
                    }
                    Spacer()
                    HStack {
                        tapKeyView(for: layer3)
                            .frame(width: frameWidth * 0.4, height: frameHeight * 0.4)
                        Spacer()
                        tapKeyView(for: layer4)
                            .frame(width: frameWidth * 0.4, height: frameHeight * 0.4)
                    }
                }
                .frame(width: frameWidth, height: frameHeight)
            }
        }
        .frame(width: frameWidth, height: frameHeight)
        .background(.clear)
        .padding(padding)
    }
    
    private func getLayer(_ index: Int) -> KeyboardKey {
        switch index {
        case 0: return layer0
        case 1: return layer1
        case 2: return layer2
        case 3: return layer3
        case 4: return layer4
        default: return layer0
        }
    }
    
    private func highLightColor_tap(for layer: KeyboardKey) -> Color {
        LayerColor.fromIndex(layer.layerKeyNumber_tap).textColor_export
    }
    
    private func highLightColor_hold(for layer: KeyboardKey) -> Color {
        LayerColor.fromIndex(layer.layerKeyNumber_hold).textColor_export
    }
    
    private func textColor(for layer: KeyboardKey) -> Color {
        LayerColor.fromIndex(layer.layerNumber).textColor_export
    }
    
    private func holdKeyView(for layer: KeyboardKey) -> some View {
        VStack {
            if layer.isTapHoldEnabled {
                if layer.layerKeyNumber_hold > 0 {
                    HStack(spacing: 0) {
                        symbolOrText(layer.holdDisplaySymbol,
                                    isSymbol: layer.isAfterHoldSFSymbol,
                                    size: holdFontSize,
                                    color: highLightColor_hold(for: layer))
                    }
                } else {
                    HStack(spacing: 0) {
                        symbolOrText(layer.holdDisplaySymbol,
                                    isSymbol: layer.isAfterHoldSFSymbol,
                                     size: holdFontSize,
                                    color: textColor(for: layer))
                    }
                }
            }
        }
        .opacity(0.5)
    }
    
    private func tapKeyView(for layer: KeyboardKey) -> some View {
        Group {
            if layer.isCustomized {
                customizedContent(for: layer, isSmall: layer.layerNumber > 0)
            } else {
                if layer.layerNumber == 0 {
                    defaultContent(for: layer)
                }
            }
        }
    }
    
    private func defaultContent(for layer: KeyboardKey) -> some View {
        symbolOrText(layer.beforeDisplaySymbol,
                     isSymbol: layer.isBeforeSFSymbol,
                     size: tapFontSize,
                     color: textColor(for: layer))
    }
    
    private func customizedContent(for layer: KeyboardKey, isSmall: Bool = false) -> some View {
        HStack(spacing: 0) {
            if layer.layerKeyNumber_tap > 0 {
                symbolOrText(layer.afterDisplaySymbol,
                             isSymbol: layer.isAfterTapSFSymbol,
                             size: isSmall ? tapFontSize_layer : tapFontSize,
                             color: highLightColor_tap(for: layer))
            } else {
                if !isSmall {
                    modifierContent_tap(for: layer).foregroundStyle(textColor(for: layer))
                }
                symbolOrText(layer.afterDisplaySymbol,
                             isSymbol: layer.isAfterTapSFSymbol,
                             size: isSmall ? tapFontSize_layer : tapFontSize,
                             color: textColor(for: layer))
            }
        }
        .scaleEffect(isSmall ? 0.7 : 1.0)
    }
    
    private func modifierContent_tap(for layer: KeyboardKey) -> some View {
        VStack(spacing: 0) {
            if layer.tapWithModifier {
                Spacer()
                HStack(spacing: 0) {
                    if layer.tapWithShift {
                        Image(systemName: "shift")
                    }
                    if layer.tapWithControl {
                        Image(systemName: "control")
                    }
                }
                HStack(spacing: 0) {
                    if layer.tapWithCommand {
                        Image(systemName: "command")
                    }
                    if layer.tapWithOption {
                        Image(systemName: "option")
                    }
                }
                if layer.tapWithFn {
                    Image(systemName: "globe")
                }
                Spacer()
            }
        }
        .font(.system(size: modifierFontSize_tap(for: layer)))
    }
    
    private func modifierFontSize_tap(for layer: KeyboardKey) -> CGFloat {
        var activeModifierCount = 0
        if layer.tapWithShift { activeModifierCount += 1 }
        if layer.tapWithControl { activeModifierCount += 1 }
        if layer.tapWithCommand { activeModifierCount += 1 }
        if layer.tapWithOption { activeModifierCount += 1 }
        if layer.tapWithFn { activeModifierCount += 1 }
        
        if layer.layerNumber > 0 {
            switch activeModifierCount {
            case 1: return baseSize * 14 / 65
            default: return baseSize * 6 / 65
                
            }
        } else {
            switch activeModifierCount {
            case 0, 1: return baseSize * 14 / 65
            case 2: return baseSize * 10 / 65
            default: return baseSize * 6 / 65
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
