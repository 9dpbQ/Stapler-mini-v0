import SwiftUI

struct BuiltInKeyboardLayerView_US: View {
    @Binding var selectedKeyboardKey: KeyboardKey
    let keySize: CGFloat
    var layer: [KeyboardKey]

    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            HStack (spacing: 0) {//Row1
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[0], unitSize: 1.5, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[1], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[2], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[3], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[4], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[5], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[6], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[7], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[8], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[9], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[10], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[11], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[12], unitSize: 1, baseSize: keySize)
                
                
            }
            HStack (spacing: 0) {//Row2
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[13], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[14], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[15], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[16], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[17], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[18], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[19], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[20], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[21], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[22], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[23], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[24], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[25], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[26], unitSize: 1.5, baseSize: keySize)
                
                
                
                
            }
            HStack (spacing: 0) {//Row3
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[27], unitSize: 1.5, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[28], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[29], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[30], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[31], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[32], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[33], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[34], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[35], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[36], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[37], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[38], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[39], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[40], unitSize: 1, baseSize: keySize)
                
                
                
            }
            HStack (spacing: 0) {//Row4
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[41], unitSize: 1.75, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[42], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[43], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[44], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[45], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[46], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[47], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[48], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[49], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[50], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[51], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[52], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[53], unitSize: 1.75, baseSize: keySize)
                
                
            }
            HStack (spacing: 0) {//Row5
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[54], unitSize: 2.25, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[55], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[56], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[57], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[58], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[59], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[60], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[61], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[62], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[63], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[64], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[65], unitSize: 2.25, baseSize: keySize)
                
            }
            HStack (spacing: 0) {//Row6
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[66], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[67], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[68], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[69], unitSize: 1.25, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[70], unitSize: 5, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[71], unitSize: 1.25, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[72], unitSize: 1, baseSize: keySize)
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[73], unitSize: 1, baseSize: keySize)
                VStack (spacing: 0) {//ここにarrowの上下がくるなぁ〜専用のビューを作らないとダメだね
                    KeyboardKeyView_arrow(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[74], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView_arrow(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[75], unitSize: 1, baseSize: keySize)
                }
                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[76], unitSize: 1, baseSize: keySize)       
            }
        }
    }
}

//#Preview {
//    let preset = Preset(presetName: "test", keyboardLayout: KeyboardLayout.US)
//    @State var selected = KeyboardKey(beforeDisplaySymbol: "1", beforeKeyOutPut: "2")
//    BuiltInKeyboardLayerView_US(selectedKeyboardKey: $selected ,layer: preset.layer0)
//}

struct BuiltInKeyboardLayerView_JIS: View {
    @Binding var selectedKeyboardKey: KeyboardKey
    let keySize: CGFloat
    var layer: [KeyboardKey]
    var body: some View {
        ZStack {
            VStack(alignment: .trailing ,spacing: 0) {
                Spacer()
                HStack (spacing: 0){
                    Spacer().frame(width: keySize * 13.25 - keySize * 0.07 * 4 + keySize * 0.07 / 2 )
                    KeyboardKeyView_enter_JIS(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[53], baseSize: keySize)
                }
                Spacer()
            }
            VStack(alignment: .leading ,spacing: 0) {
                HStack (spacing: 0) {//Row1
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[0], unitSize: 1.5, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[1], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[2], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[3], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[4], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[5], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[6], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[7], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[8], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[9], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[10], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[11], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[12], unitSize: 1, baseSize: keySize)
                    
                    
                }
                HStack (spacing: 0) {//Row2
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[13], unitSize: 1.25, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[14], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[15], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[16], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[17], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[18], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[19], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[20], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[21], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[22], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[23], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[24], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[25], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[26], unitSize: 1.25, baseSize: keySize)//BS
                    
                    
                }
                HStack (spacing: 0) {//Row3
                    
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[27], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[28], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[29], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[30], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[31], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[32], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[33], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[34], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[35], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[36], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[37], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[38], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[39], unitSize: 1, baseSize: keySize)//「
                    
                    
                    
                    
                }
                HStack (spacing: 0) {//Row4
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[40], unitSize: 1.25, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[41], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[42], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[43], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[44], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[45], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[46], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[47], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[48], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[49], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[50], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[51], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[52], unitSize: 1, baseSize: keySize)
                    //                KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[53], unitSize: 1.25)//エンター
                    
                    
                }
                HStack (spacing: 0) {//Row5
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[54], unitSize: 1.75, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[55], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[56], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[57], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[58], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[59], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[60], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[61], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[62], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[63], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[64], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[65], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[66], unitSize: 1.75, baseSize: keySize)
                    
                    
                    
                }
                HStack (spacing: 0) {//Row6
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[67], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[68], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[69], unitSize: 1.25, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[70], unitSize: 1.25, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[71], unitSize: 3.5, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[72], unitSize: 1.25, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[73], unitSize: 1.25, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[74], unitSize: 1, baseSize: keySize)
                    
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[75], unitSize: 1, baseSize: keySize)
                    VStack (spacing: 0) {
                        KeyboardKeyView_arrow(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[76], unitSize: 1, baseSize: keySize)
                        KeyboardKeyView_arrow(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[77], unitSize: 1, baseSize: keySize)
                    }
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[78], unitSize: 1, baseSize: keySize)
                }
            }
        }
    }
}

//#Preview {
//    let preset = Preset(presetName: "test", keyboardLayout: KeyboardLayout.JIS)
//    @State var selected = KeyboardKey(beforeDisplaySymbol: "1", beforeKeyOutPut: "2")
//    BuiltInKeyboardLayerView_JIS(selectedKeyboardKey: $selected, keySize: 75 ,layer: preset.layer0)
//}

struct BuiltInKeyboardLayerView_UK: View {
    @Binding var selectedKeyboardKey: KeyboardKey
    let keySize: CGFloat
    var layer: [KeyboardKey]

    var body: some View {
        ZStack {
            VStack(alignment: .trailing ,spacing: 0) {
                Spacer()
                HStack (spacing: 0){
                    Spacer().frame(width: keySize * 13.75 - keySize * 0.07 * 4 + keySize * 0.07 / 2)
                    KeyboardKeyView_enter_UK(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[53], baseSize: keySize)
                }
                Spacer()
            }
            VStack(alignment: .leading, spacing: 0) {
                HStack (spacing: 0) {//Row1
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[0], unitSize: 1.5, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[1], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[2], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[3], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[4], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[5], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[6], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[7], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[8], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[9], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[10], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[11], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[12], unitSize: 1, baseSize: keySize)
                    
                    
                }
                HStack (spacing: 0) {//Row2
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[13], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[14], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[15], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[16], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[17], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[18], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[19], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[20], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[21], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[22], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[23], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[24], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[25], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[26], unitSize: 1.5, baseSize: keySize)
                }
                HStack (spacing: 0) {//Row3
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[27], unitSize: 1.5, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[28], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[29], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[30], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[31], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[32], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[33], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[34], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[35], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[36], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[37], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[38], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[39], unitSize: 1, baseSize: keySize)
                    
                    
                    
                }
                HStack (spacing: 0) {//Row4
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[40], unitSize: 1.75, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[41], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[42], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[43], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[44], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[45], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[46], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[47], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[48], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[49], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[50], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[51], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[52], unitSize: 1, baseSize: keySize)
                    
                }
                HStack (spacing: 0) {//Row5
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[54], unitSize: 1.25, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[55], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[56], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[57], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[58], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[59], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[60], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[61], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[62], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[63], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[64], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[65], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[66], unitSize: 2.25, baseSize: keySize)
                    
                    
                }
                HStack (spacing: 0) {//Row6
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[67], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[68], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[69], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[70], unitSize: 1.25, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[71], unitSize: 5, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[72], unitSize: 1.25, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[73], unitSize: 1, baseSize: keySize)
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[74], unitSize: 1, baseSize: keySize)
                    VStack(spacing: 0) {
                        KeyboardKeyView_arrow(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[75], unitSize: 1, baseSize: keySize)
                        KeyboardKeyView_arrow(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[76], unitSize: 1, baseSize: keySize)
                    }
                    KeyboardKeyView(selectedKeyboardKey: $selectedKeyboardKey, keyboardKey: layer[77], unitSize: 1, baseSize: keySize)
                    
                }
            }
            
        }
    }
}

//#Preview {
//    let preset = Preset(presetName: "test", keyboardLayout: KeyboardLayout.UK)
//    @State var selected = KeyboardKey(beforeDisplaySymbol: "1", beforeKeyOutPut: "2")
//    BuiltInKeyboardLayerView_UK(selectedKeyboardKey: $selected ,layer: preset.layer0)
//}
