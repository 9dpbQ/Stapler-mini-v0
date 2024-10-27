///カテゴリ別のCustomizeKeyの配列とか

import Foundation

struct CustomKeyCategory: Identifiable {
    let id: UUID = UUID()
    let name: String
    let keys: [CustomizeKey]
}

struct CustomKeyDataSet {
    static let basicKeys: CustomKeyCategory = CustomKeyCategory(
        name: "Basic",
        keys: [
            //Alphabets
            CustomizeKey(afterDisplaySymbol: "square.dotted", afterKeyOutPut: "vk_none", isUsingSFSymbol: true, helpText: "this key outputs nothing"),
            CustomizeKey(afterDisplaySymbol: "A", afterKeyOutPut: "a"),
            CustomizeKey(afterDisplaySymbol: "B", afterKeyOutPut: "b"),
            CustomizeKey(afterDisplaySymbol: "C", afterKeyOutPut: "c"),
            CustomizeKey(afterDisplaySymbol: "D", afterKeyOutPut: "d"),
            CustomizeKey(afterDisplaySymbol: "E", afterKeyOutPut: "e"),
            CustomizeKey(afterDisplaySymbol: "F", afterKeyOutPut: "f"),
            CustomizeKey(afterDisplaySymbol: "G", afterKeyOutPut: "g"),
            CustomizeKey(afterDisplaySymbol: "H", afterKeyOutPut: "h"),
            CustomizeKey(afterDisplaySymbol: "I", afterKeyOutPut: "i"),
            CustomizeKey(afterDisplaySymbol: "J", afterKeyOutPut: "j"),
            CustomizeKey(afterDisplaySymbol: "K", afterKeyOutPut: "k"),
            CustomizeKey(afterDisplaySymbol: "L", afterKeyOutPut: "l"),
            CustomizeKey(afterDisplaySymbol: "M", afterKeyOutPut: "m"),
            CustomizeKey(afterDisplaySymbol: "N", afterKeyOutPut: "n"),
            CustomizeKey(afterDisplaySymbol: "O", afterKeyOutPut: "o"),
            CustomizeKey(afterDisplaySymbol: "P", afterKeyOutPut: "p"),
            CustomizeKey(afterDisplaySymbol: "Q", afterKeyOutPut: "q"),
            CustomizeKey(afterDisplaySymbol: "R", afterKeyOutPut: "r"),
            CustomizeKey(afterDisplaySymbol: "S", afterKeyOutPut: "s"),
            CustomizeKey(afterDisplaySymbol: "T", afterKeyOutPut: "t"),
            CustomizeKey(afterDisplaySymbol: "U", afterKeyOutPut: "u"),
            CustomizeKey(afterDisplaySymbol: "V", afterKeyOutPut: "v"),
            CustomizeKey(afterDisplaySymbol: "W", afterKeyOutPut: "w"),
            CustomizeKey(afterDisplaySymbol: "X", afterKeyOutPut: "x"),
            CustomizeKey(afterDisplaySymbol: "Y", afterKeyOutPut: "y"),
            CustomizeKey(afterDisplaySymbol: "Z", afterKeyOutPut: "z"),
            //BasicNumbers
            CustomizeKey(afterDisplaySymbol: "1", afterKeyOutPut: "1"),
            CustomizeKey(afterDisplaySymbol: "2", afterKeyOutPut: "2"),
            CustomizeKey(afterDisplaySymbol: "3", afterKeyOutPut: "3"),
            CustomizeKey(afterDisplaySymbol: "4", afterKeyOutPut: "4"),
            CustomizeKey(afterDisplaySymbol: "5", afterKeyOutPut: "5"),
            CustomizeKey(afterDisplaySymbol: "6", afterKeyOutPut: "6"),
            CustomizeKey(afterDisplaySymbol: "7", afterKeyOutPut: "7"),
            CustomizeKey(afterDisplaySymbol: "8", afterKeyOutPut: "8"),
            CustomizeKey(afterDisplaySymbol: "9", afterKeyOutPut: "9"),
            CustomizeKey(afterDisplaySymbol: "0", afterKeyOutPut: "0"),
            
        ]
    )
    static let symbolKeys: CustomKeyCategory = CustomKeyCategory(
        name: "Symbol",
        keys: [
            //単打で出せるもの(US視点)
           

            CustomizeKey(afterDisplaySymbol: "-", afterKeyOutPut: "-"),
            CustomizeKey(afterDisplaySymbol: "_", afterKeyOutPut: "_"),//Shift + -

            CustomizeKey(afterDisplaySymbol: "=", afterKeyOutPut: "="),
            CustomizeKey(afterDisplaySymbol: "+", afterKeyOutPut: "+"),//Shift + =

            CustomizeKey(afterDisplaySymbol: "\\", afterKeyOutPut: "\\"),//backslash
            CustomizeKey(afterDisplaySymbol: "|", afterKeyOutPut: "|"),//Shift + backslash

            CustomizeKey(afterDisplaySymbol: ";", afterKeyOutPut: ";"),
            CustomizeKey(afterDisplaySymbol: ":", afterKeyOutPut: ":"),//Shift + ;
            
            CustomizeKey(afterDisplaySymbol: "`", afterKeyOutPut: "`"),
            CustomizeKey(afterDisplaySymbol: "~", afterKeyOutPut: "~"),//Shift + `
            
            CustomizeKey(afterDisplaySymbol: "'", afterKeyOutPut: "'"),
            CustomizeKey(afterDisplaySymbol: "\"", afterKeyOutPut: "\""),//Shift + '

            CustomizeKey(afterDisplaySymbol: ",", afterKeyOutPut: ","),
            CustomizeKey(afterDisplaySymbol: ".", afterKeyOutPut: "."),
            
            CustomizeKey(afterDisplaySymbol: "/", afterKeyOutPut: "/"),
            CustomizeKey(afterDisplaySymbol: "?", afterKeyOutPut: "?"),//Shift + slash

            //Shift系
                //数字＋シフト
            CustomizeKey(afterDisplaySymbol: "!", afterKeyOutPut: "!"),//Shift + 1
            CustomizeKey(afterDisplaySymbol: "@", afterKeyOutPut: "@"),//Shift + 2
            CustomizeKey(afterDisplaySymbol: "#", afterKeyOutPut: "#"),//Shift + 3
            CustomizeKey(afterDisplaySymbol: "$", afterKeyOutPut: "$"),//Shift + 4
            CustomizeKey(afterDisplaySymbol: "%", afterKeyOutPut: "%"),//Shift + 5
            CustomizeKey(afterDisplaySymbol: "^", afterKeyOutPut: "^"),//Shift + 6
            CustomizeKey(afterDisplaySymbol: "&", afterKeyOutPut: "&"),//Shift + 7
            CustomizeKey(afterDisplaySymbol: "*", afterKeyOutPut: "*"),//Shift + 8
            CustomizeKey(afterDisplaySymbol: "(", afterKeyOutPut: "("),//Shift + 9
            CustomizeKey(afterDisplaySymbol: ")", afterKeyOutPut: ")"),//Shift + 0
            
            CustomizeKey(afterDisplaySymbol: "[", afterKeyOutPut: "["),
            CustomizeKey(afterDisplaySymbol: "]", afterKeyOutPut: "]"),
            
            CustomizeKey(afterDisplaySymbol: "{", afterKeyOutPut: "{"),//Shift + [
            CustomizeKey(afterDisplaySymbol: "}", afterKeyOutPut: "}"),//Shift + ]
            
            
            
            CustomizeKey(afterDisplaySymbol: "<", afterKeyOutPut: "<"),//Shift + ,
            CustomizeKey(afterDisplaySymbol: ">", afterKeyOutPut: ">"),//Shift + .

           

                //記号＋シフト
           
//            //Option系　ユーザーがDisplay Nameをいじれるようにしつつ、あとは修飾キートグルでどうにかしてもらうことにする。
//                //数字＋オプション
//            CustomizeKey(afterDisplaySymbol: "º", afterKeyOutPut: "º"),//0
//            CustomizeKey(afterDisplaySymbol: "¡", afterKeyOutPut: "¡"),//1
//            CustomizeKey(afterDisplaySymbol: "™", afterKeyOutPut: "™"),//2
//            CustomizeKey(afterDisplaySymbol: "£", afterKeyOutPut: "£"),//3
//            CustomizeKey(afterDisplaySymbol: "¢", afterKeyOutPut: "¢"),//4
//            CustomizeKey(afterDisplaySymbol: "∞", afterKeyOutPut: "∞"),//5
//            CustomizeKey(afterDisplaySymbol: "§", afterKeyOutPut: "§"),//6
//            CustomizeKey(afterDisplaySymbol: "¶", afterKeyOutPut: "¶"),//7
//            CustomizeKey(afterDisplaySymbol: "•", afterKeyOutPut: "•"),//8
//            CustomizeKey(afterDisplaySymbol: "ª", afterKeyOutPut: "ª"),//9
//                //アルファベット＋オプション
//            CustomizeKey(afterDisplaySymbol: "å", afterKeyOutPut: "å"),//A
//            CustomizeKey(afterDisplaySymbol: "∫", afterKeyOutPut: "∫"),//B
//            CustomizeKey(afterDisplaySymbol: "ç", afterKeyOutPut: "ç"),//C
//            CustomizeKey(afterDisplaySymbol: "∂", afterKeyOutPut: "∂"),//D
//            CustomizeKey(afterDisplaySymbol: "´", afterKeyOutPut: "´"),//E
//            CustomizeKey(afterDisplaySymbol: "ƒ", afterKeyOutPut: "ƒ"),//F
//            CustomizeKey(afterDisplaySymbol: "©", afterKeyOutPut: "©"),//G
//            CustomizeKey(afterDisplaySymbol: "˙", afterKeyOutPut: "˙"),//H
//            CustomizeKey(afterDisplaySymbol: "ˆ", afterKeyOutPut: "ˆ"),//I
//            CustomizeKey(afterDisplaySymbol: "∆", afterKeyOutPut: "∆"),//J
//            CustomizeKey(afterDisplaySymbol: "˚", afterKeyOutPut: "˚"),//K
//            CustomizeKey(afterDisplaySymbol: "¬", afterKeyOutPut: "¬"),//L
//            CustomizeKey(afterDisplaySymbol: "µ", afterKeyOutPut: "µ"),//M
//            CustomizeKey(afterDisplaySymbol: "˜", afterKeyOutPut: "˜"),//N
//            CustomizeKey(afterDisplaySymbol: "ø", afterKeyOutPut: "ø"),//O
//            CustomizeKey(afterDisplaySymbol: "π", afterKeyOutPut: "π"),//P
//            CustomizeKey(afterDisplaySymbol: "œ", afterKeyOutPut: "œ"),//Q
//            CustomizeKey(afterDisplaySymbol: "®", afterKeyOutPut: "®"),//R
//            CustomizeKey(afterDisplaySymbol: "ß", afterKeyOutPut: "ß"),//S
//            CustomizeKey(afterDisplaySymbol: "†", afterKeyOutPut: "†"),//T
//            CustomizeKey(afterDisplaySymbol: "¨", afterKeyOutPut: "¨"),//U
//            CustomizeKey(afterDisplaySymbol: "√", afterKeyOutPut: "√"),//V
//            CustomizeKey(afterDisplaySymbol: "∑", afterKeyOutPut: "∑"),//W
//            CustomizeKey(afterDisplaySymbol: "≈", afterKeyOutPut: "≈"),//X
//            CustomizeKey(afterDisplaySymbol: "¥", afterKeyOutPut: "¥"),//Y
//            CustomizeKey(afterDisplaySymbol: "Ω", afterKeyOutPut: "Ω"),//Z
//                //記号＋オプション
////            CustomizeKey(afterDisplaySymbol: "`", afterKeyOutPut: "`"),//Option + ` 同じっぽい？意味なさそう
//            CustomizeKey(afterDisplaySymbol: "–", afterKeyOutPut: "–"),//Option + -
//            CustomizeKey(afterDisplaySymbol: "≠", afterKeyOutPut: "≠"),//Option + =
//            CustomizeKey(afterDisplaySymbol: "“", afterKeyOutPut: "“"),//Option + [
//            CustomizeKey(afterDisplaySymbol: "‘", afterKeyOutPut: "‘"),//Option + ]
//            CustomizeKey(afterDisplaySymbol: "«", afterKeyOutPut: "«"),//Option + backslash
//            CustomizeKey(afterDisplaySymbol: "…", afterKeyOutPut: "…"),//Option + ;
//            CustomizeKey(afterDisplaySymbol: "'", afterKeyOutPut: "'"),//Option + '
//            CustomizeKey(afterDisplaySymbol: "≤", afterKeyOutPut: "≤"),//Option + ,
//            CustomizeKey(afterDisplaySymbol: "≥", afterKeyOutPut: "≥"),//Option + .
//            CustomizeKey(afterDisplaySymbol: "÷", afterKeyOutPut: "÷"),//Option + slash
        ]
    )
    static let keyPadKeys: CustomKeyCategory = CustomKeyCategory(
        name: "Keypad",
        keys: [
            //KeyPadKeys
            CustomizeKey(afterDisplaySymbol: "k0", afterKeyOutPut: "keypad_0"),
            CustomizeKey(afterDisplaySymbol: "k1", afterKeyOutPut: "keypad_1"),
            CustomizeKey(afterDisplaySymbol: "k2", afterKeyOutPut: "keypad_2"),
            CustomizeKey(afterDisplaySymbol: "k3", afterKeyOutPut: "keypad_3"),
            CustomizeKey(afterDisplaySymbol: "k4", afterKeyOutPut: "keypad_4"),
            CustomizeKey(afterDisplaySymbol: "k5", afterKeyOutPut: "keypad_5"),
            CustomizeKey(afterDisplaySymbol: "k6", afterKeyOutPut: "keypad_6"),
            CustomizeKey(afterDisplaySymbol: "k7", afterKeyOutPut: "keypad_7"),
            CustomizeKey(afterDisplaySymbol: "k8", afterKeyOutPut: "keypad_8"),
            CustomizeKey(afterDisplaySymbol: "k9", afterKeyOutPut: "keypad_9"),
            CustomizeKey(afterDisplaySymbol: "num_lock", afterKeyOutPut: "keypad_num_lock"),
            CustomizeKey(afterDisplaySymbol: "k/", afterKeyOutPut: "keypad_slash"),
            CustomizeKey(afterDisplaySymbol: "k*", afterKeyOutPut: "keypad_asterisk"),
            CustomizeKey(afterDisplaySymbol: "k-", afterKeyOutPut: "keypad_hyphen"),
            CustomizeKey(afterDisplaySymbol: "k+", afterKeyOutPut: "keypad_plus"),
            CustomizeKey(afterDisplaySymbol: "k=", afterKeyOutPut: "keypad_equal_sign"),
            CustomizeKey(afterDisplaySymbol: "enter", afterKeyOutPut: "keypad_enter"),
            CustomizeKey(afterDisplaySymbol: "k,", afterKeyOutPut: "keypad_comma"),
            CustomizeKey(afterDisplaySymbol: "k.", afterKeyOutPut: "keypad_period"),
            
        ]
    )
    static let controlKeys: CustomKeyCategory = CustomKeyCategory(
        name: "Control",
        keys: [
            //Controls
            CustomizeKey(afterDisplaySymbol: "return", afterKeyOutPut: "return", isUsingSFSymbol: true),
            CustomizeKey(afterDisplaySymbol: "␣", afterKeyOutPut: "␣"),
            CustomizeKey(afterDisplaySymbol: "arrow.right.to.line", afterKeyOutPut: "tab", isUsingSFSymbol: true),
            CustomizeKey(afterDisplaySymbol: "esc", afterKeyOutPut: "esc"),
            CustomizeKey(afterDisplaySymbol: "delete.left", afterKeyOutPut: "BS", isUsingSFSymbol: true),
            CustomizeKey(afterDisplaySymbol: "delete.right", afterKeyOutPut: "Del", isUsingSFSymbol: true),
            CustomizeKey(afterDisplaySymbol: "かな", afterKeyOutPut: "かな"),
            CustomizeKey(afterDisplaySymbol: "英数", afterKeyOutPut: "英数"),
            CustomizeKey(afterDisplaySymbol: "変換", afterKeyOutPut: "変換"),
            CustomizeKey(afterDisplaySymbol: "無変換", afterKeyOutPut: "無変換"),
            //FullSizeControls
            CustomizeKey(afterDisplaySymbol: "print_screen", afterKeyOutPut: "print_screen"),
            CustomizeKey(afterDisplaySymbol: "scroll_lock", afterKeyOutPut: "scroll_lock"),
            CustomizeKey(afterDisplaySymbol: "pause", afterKeyOutPut: "pause"),
            CustomizeKey(afterDisplaySymbol: "insert", afterKeyOutPut: "insert"),
            CustomizeKey(afterDisplaySymbol: "application", afterKeyOutPut: "application"),
            CustomizeKey(afterDisplaySymbol: "help", afterKeyOutPut: "help"),
            CustomizeKey(afterDisplaySymbol: "power", afterKeyOutPut: "power"),
            //Arrows
            CustomizeKey(afterDisplaySymbol: "←", afterKeyOutPut: "←"),
            CustomizeKey(afterDisplaySymbol: "↑", afterKeyOutPut: "↑"),
            CustomizeKey(afterDisplaySymbol: "→", afterKeyOutPut: "→"),
            CustomizeKey(afterDisplaySymbol: "↓", afterKeyOutPut: "↓"),
            CustomizeKey(afterDisplaySymbol: "page_up", afterKeyOutPut: "page_up"),
            CustomizeKey(afterDisplaySymbol: "page_down", afterKeyOutPut: "page_down"),
            CustomizeKey(afterDisplaySymbol: "home", afterKeyOutPut: "home"),
            CustomizeKey(afterDisplaySymbol: "end", afterKeyOutPut: "end"),
            //MediaControls
                //MacOS
            CustomizeKey(afterDisplaySymbol: "rectangle.3.group", afterKeyOutPut: "mission_control", isUsingSFSymbol: true),
            CustomizeKey(afterDisplaySymbol: "magnifyingglass", afterKeyOutPut: "spotlight", isUsingSFSymbol: true),
            CustomizeKey(afterDisplaySymbol: "microphone", afterKeyOutPut: "dictation", isUsingSFSymbol: true),
            CustomizeKey(afterDisplaySymbol: "square.grid.3x2", afterKeyOutPut: "launchpad", isUsingSFSymbol: true),
                //Sound
            CustomizeKey(afterDisplaySymbol: "backward", afterKeyOutPut: "rewind", isUsingSFSymbol: true),
            CustomizeKey(afterDisplaySymbol: "playpause", afterKeyOutPut: "play_or_pause", isUsingSFSymbol: true),
            CustomizeKey(afterDisplaySymbol: "forward", afterKeyOutPut: "fast_forward", isUsingSFSymbol: true),
            CustomizeKey(afterDisplaySymbol: "speaker.slash", afterKeyOutPut: "mute", isUsingSFSymbol: true),
            CustomizeKey(afterDisplaySymbol: "speaker.wave.1", afterKeyOutPut: "volume_decrement", isUsingSFSymbol: true),
            CustomizeKey(afterDisplaySymbol: "speaker.wave.3", afterKeyOutPut: "volume_increment", isUsingSFSymbol: true),
            CustomizeKey(afterDisplaySymbol: "eject", afterKeyOutPut: "eject", isUsingSFSymbol: true),
                //Light Displayの3つの差異は？ないなら一つに統合して良い気がする
            CustomizeKey(afterDisplaySymbol: "sun.min.fill", afterKeyOutPut: "display_brightness_decrement", isUsingSFSymbol: true),
            CustomizeKey(afterDisplaySymbol: "sun.max.fill", afterKeyOutPut: "display_brightness_increment", isUsingSFSymbol: true),

            CustomizeKey(afterDisplaySymbol: "sun.min.fill", afterKeyOutPut: "brightness_down", isUsingSFSymbol: true),
            CustomizeKey(afterDisplaySymbol: "sun.max.fill", afterKeyOutPut: "brightness_up", isUsingSFSymbol: true),
            CustomizeKey(afterDisplaySymbol: "sun.min.fill", afterKeyOutPut: "brightness_down(2)", isUsingSFSymbol: true),//外部ディスプレイ？
            CustomizeKey(afterDisplaySymbol: "sun.max.fill", afterKeyOutPut: "brightness_up(2)", isUsingSFSymbol: true),

            CustomizeKey(afterDisplaySymbol: "light.min", afterKeyOutPut: "illumination_down", isUsingSFSymbol: true),//keyboard backlight
            CustomizeKey(afterDisplaySymbol: "light.max", afterKeyOutPut: "illumination_up", isUsingSFSymbol: true),
        ]
    )
    
    
   
    
    static let specialKeys: CustomKeyCategory = CustomKeyCategory(
        name: "Special",
        keys: [
            CustomizeKey(afterDisplaySymbol: "1.square", afterKeyOutPut: "layer1", isUsingSFSymbol: true, layerKeyNumber: 1),
            CustomizeKey(afterDisplaySymbol: "2.square", afterKeyOutPut: "layer2", isUsingSFSymbol: true, layerKeyNumber: 2),
            CustomizeKey(afterDisplaySymbol: "3.square", afterKeyOutPut: "layer3", isUsingSFSymbol: true, layerKeyNumber: 3),
            CustomizeKey(afterDisplaySymbol: "4.square", afterKeyOutPut: "layer4", isUsingSFSymbol: true, layerKeyNumber: 4),
            CustomizeKey(afterDisplaySymbol: "5.square", afterKeyOutPut: "layer5", isUsingSFSymbol: true, layerKeyNumber: 5),
            CustomizeKey(afterDisplaySymbol: "6.square", afterKeyOutPut: "layer6", isUsingSFSymbol: true, layerKeyNumber: 6),
            CustomizeKey(afterDisplaySymbol: "7.square", afterKeyOutPut: "layer7", isUsingSFSymbol: true, layerKeyNumber: 7),
            CustomizeKey(afterDisplaySymbol: "8.square", afterKeyOutPut: "layer8", isUsingSFSymbol: true, layerKeyNumber: 8),

            
            CustomizeKey(afterDisplaySymbol: "L⇧", afterKeyOutPut: "left_shift"),
            CustomizeKey(afterDisplaySymbol: "L⌘", afterKeyOutPut: "left_command"),
            CustomizeKey(afterDisplaySymbol: "L^", afterKeyOutPut: "left_control"),
            CustomizeKey(afterDisplaySymbol: "L⌥", afterKeyOutPut: "left_option"),

            CustomizeKey(afterDisplaySymbol: "R⇧", afterKeyOutPut: "right_shift"),
            CustomizeKey(afterDisplaySymbol: "R⌘", afterKeyOutPut: "right_command"),
            CustomizeKey(afterDisplaySymbol: "R^", afterKeyOutPut: "right_control"),
            CustomizeKey(afterDisplaySymbol: "R⌥", afterKeyOutPut: "right_option"),
            CustomizeKey(afterDisplaySymbol: "fn", afterKeyOutPut: "fn"),
        ]
    )
    
    static let functionKeys: CustomKeyCategory = CustomKeyCategory(
        name: "FunctionKey",
        keys: [
            CustomizeKey(afterDisplaySymbol: "F1", afterKeyOutPut: "F1"),
            CustomizeKey(afterDisplaySymbol: "F2", afterKeyOutPut: "F2"),
            CustomizeKey(afterDisplaySymbol: "F3", afterKeyOutPut: "F3"),
            CustomizeKey(afterDisplaySymbol: "F4", afterKeyOutPut: "F4"),
            CustomizeKey(afterDisplaySymbol: "F5", afterKeyOutPut: "F5"),
            CustomizeKey(afterDisplaySymbol: "F6", afterKeyOutPut: "F6"),
            CustomizeKey(afterDisplaySymbol: "F7", afterKeyOutPut: "F7"),
            CustomizeKey(afterDisplaySymbol: "F8", afterKeyOutPut: "F8"),
            CustomizeKey(afterDisplaySymbol: "F9", afterKeyOutPut: "F9"),
            CustomizeKey(afterDisplaySymbol: "F10", afterKeyOutPut: "F10"),
            CustomizeKey(afterDisplaySymbol: "F11", afterKeyOutPut: "F11"),
            CustomizeKey(afterDisplaySymbol: "F12", afterKeyOutPut: "F12"),
            CustomizeKey(afterDisplaySymbol: "F13", afterKeyOutPut: "F13"),
            CustomizeKey(afterDisplaySymbol: "F14", afterKeyOutPut: "F14"),
            CustomizeKey(afterDisplaySymbol: "F15", afterKeyOutPut: "F15"),
            CustomizeKey(afterDisplaySymbol: "F16", afterKeyOutPut: "F16"),
            CustomizeKey(afterDisplaySymbol: "F17", afterKeyOutPut: "F17"),
            CustomizeKey(afterDisplaySymbol: "F18", afterKeyOutPut: "F18"),
            CustomizeKey(afterDisplaySymbol: "F19", afterKeyOutPut: "F19"),
            CustomizeKey(afterDisplaySymbol: "F20", afterKeyOutPut: "F20"),
            CustomizeKey(afterDisplaySymbol: "F21", afterKeyOutPut: "F21"),
            CustomizeKey(afterDisplaySymbol: "F22", afterKeyOutPut: "F22"),
            CustomizeKey(afterDisplaySymbol: "F23", afterKeyOutPut: "F23"),
            CustomizeKey(afterDisplaySymbol: "F24", afterKeyOutPut: "F24"),

            
        ]
    )
    
    static let internationalKeys: CustomKeyCategory = CustomKeyCategory(
        name: "International",
        keys: [
            CustomizeKey(afterDisplaySymbol: "international1", afterKeyOutPut: "international1"),
            CustomizeKey(afterDisplaySymbol: "international2", afterKeyOutPut: "international2"),
            CustomizeKey(afterDisplaySymbol: "international3", afterKeyOutPut: "international3"),
            CustomizeKey(afterDisplaySymbol: "international4", afterKeyOutPut: "international4"),
            CustomizeKey(afterDisplaySymbol: "international5", afterKeyOutPut: "international5"),
            CustomizeKey(afterDisplaySymbol: "international6", afterKeyOutPut: "international6"),
            CustomizeKey(afterDisplaySymbol: "international7", afterKeyOutPut: "international7"),
            CustomizeKey(afterDisplaySymbol: "international8", afterKeyOutPut: "international8"),
            CustomizeKey(afterDisplaySymbol: "international9", afterKeyOutPut: "international9"),
            CustomizeKey(afterDisplaySymbol: "lang1", afterKeyOutPut: "lang1"),
            CustomizeKey(afterDisplaySymbol: "lang2", afterKeyOutPut: "lang2"),
            CustomizeKey(afterDisplaySymbol: "lang3", afterKeyOutPut: "lang3"),
            CustomizeKey(afterDisplaySymbol: "lang4", afterKeyOutPut: "lang4"),
            CustomizeKey(afterDisplaySymbol: "lang5", afterKeyOutPut: "lang5"),
            CustomizeKey(afterDisplaySymbol: "lang6", afterKeyOutPut: "lang6"),
            CustomizeKey(afterDisplaySymbol: "lang7", afterKeyOutPut: "lang7"),
            CustomizeKey(afterDisplaySymbol: "lang8", afterKeyOutPut: "lang8"),
            CustomizeKey(afterDisplaySymbol: "lang9", afterKeyOutPut: "lang9"),
            
          
        ]
    )
    
    static let mouseKeys: CustomKeyCategory = CustomKeyCategory(
        name: "Mouse",
        keys: [
            CustomizeKey(afterDisplaySymbol: "mouse_up", afterKeyOutPut: "mouse_up"),
            CustomizeKey(afterDisplaySymbol: "mouse_up(fast)", afterKeyOutPut: "mouse_up(fast)"),
            CustomizeKey(afterDisplaySymbol: "mouse_up(slow)", afterKeyOutPut: "mouse_up(slow)"),
            CustomizeKey(afterDisplaySymbol: "mouse_down", afterKeyOutPut: "mouse_down"),
            CustomizeKey(afterDisplaySymbol: "mouse_down(fast)", afterKeyOutPut: "mouse_down(fast)"),
            CustomizeKey(afterDisplaySymbol: "mouse_down(slow)", afterKeyOutPut: "mouse_down(slow)"),
            CustomizeKey(afterDisplaySymbol: "mouse_left", afterKeyOutPut: "mouse_left"),
            CustomizeKey(afterDisplaySymbol: "mouse_left(fast)", afterKeyOutPut: "mouse_left(fast)"),
            CustomizeKey(afterDisplaySymbol: "mouse_left(slow)", afterKeyOutPut: "mouse_left(slow)"),
            CustomizeKey(afterDisplaySymbol: "mouse_right", afterKeyOutPut: "mouse_right"),
            CustomizeKey(afterDisplaySymbol: "mouse_right(fast)", afterKeyOutPut: "mouse_right(fast)"),
            CustomizeKey(afterDisplaySymbol: "mouse_right(slow)", afterKeyOutPut: "mouse_right(slow)"),
            CustomizeKey(afterDisplaySymbol: "scroll_up", afterKeyOutPut: "scroll_up"),
            CustomizeKey(afterDisplaySymbol: "scroll_up(fast)", afterKeyOutPut: "scroll_up(fast)"),
            CustomizeKey(afterDisplaySymbol: "scroll_up(slow)", afterKeyOutPut: "scroll_up(slow)"),
            CustomizeKey(afterDisplaySymbol: "scroll_down", afterKeyOutPut: "scroll_down"),
            CustomizeKey(afterDisplaySymbol: "scroll_down(fast)", afterKeyOutPut: "scroll_down(fast)"),
            CustomizeKey(afterDisplaySymbol: "scroll_down(slow)", afterKeyOutPut: "scroll_down(slow)"),
            CustomizeKey(afterDisplaySymbol: "scroll_left", afterKeyOutPut: "scroll_left"),
            CustomizeKey(afterDisplaySymbol: "scroll_left(fast)", afterKeyOutPut: "scroll_left(fast)"),
            CustomizeKey(afterDisplaySymbol: "scroll_left(slow)", afterKeyOutPut: "scroll_left(slow)"),
            CustomizeKey(afterDisplaySymbol: "scroll_right", afterKeyOutPut: "scroll_right"),
            CustomizeKey(afterDisplaySymbol: "scroll_right(fast)", afterKeyOutPut: "scroll_right(fast)"),
            CustomizeKey(afterDisplaySymbol: "scroll_right(slow)", afterKeyOutPut: "scroll_right(slow)"),
            CustomizeKey(afterDisplaySymbol: "speed_multi_plier(2.0)", afterKeyOutPut: "speed_multi_plier(2.0)"),
            CustomizeKey(afterDisplaySymbol: "speed_multi_plier(0.5)", afterKeyOutPut: "speed_multi_plier(0.5)"),
            CustomizeKey(afterDisplaySymbol: "speed_multi_plier(0.25)", afterKeyOutPut: "speed_multi_plier(0.25)"),
            CustomizeKey(afterDisplaySymbol: "speed_multi_plier(0.125)", afterKeyOutPut: "speed_multi_plier(0.125)"),
            
            CustomizeKey(afterDisplaySymbol: "button1", afterKeyOutPut: "button1"),
            CustomizeKey(afterDisplaySymbol: "button2", afterKeyOutPut: "button2"),
            CustomizeKey(afterDisplaySymbol: "button3", afterKeyOutPut: "button3"),
            CustomizeKey(afterDisplaySymbol: "button4", afterKeyOutPut: "button4"),
            CustomizeKey(afterDisplaySymbol: "button5", afterKeyOutPut: "button5"),
            CustomizeKey(afterDisplaySymbol: "button6", afterKeyOutPut: "button6"),
            CustomizeKey(afterDisplaySymbol: "button7", afterKeyOutPut: "button7"),
            CustomizeKey(afterDisplaySymbol: "button8", afterKeyOutPut: "button8"),
            CustomizeKey(afterDisplaySymbol: "button9", afterKeyOutPut: "button9"),
            CustomizeKey(afterDisplaySymbol: "button10", afterKeyOutPut: "button10"),
            CustomizeKey(afterDisplaySymbol: "button11", afterKeyOutPut: "button11"),
            CustomizeKey(afterDisplaySymbol: "button12", afterKeyOutPut: "button12"),
            CustomizeKey(afterDisplaySymbol: "button13", afterKeyOutPut: "button13"),
            CustomizeKey(afterDisplaySymbol: "button14", afterKeyOutPut: "button14"),
            CustomizeKey(afterDisplaySymbol: "button15", afterKeyOutPut: "button15"),
            CustomizeKey(afterDisplaySymbol: "button16", afterKeyOutPut: "button16"),
            CustomizeKey(afterDisplaySymbol: "button17", afterKeyOutPut: "button17"),
            CustomizeKey(afterDisplaySymbol: "button18", afterKeyOutPut: "button18"),
            CustomizeKey(afterDisplaySymbol: "button19", afterKeyOutPut: "button19"),
            CustomizeKey(afterDisplaySymbol: "button20", afterKeyOutPut: "button20"),
            CustomizeKey(afterDisplaySymbol: "button21", afterKeyOutPut: "button21"),
            CustomizeKey(afterDisplaySymbol: "button22", afterKeyOutPut: "button22"),
            CustomizeKey(afterDisplaySymbol: "button23", afterKeyOutPut: "button23"),
            CustomizeKey(afterDisplaySymbol: "button24", afterKeyOutPut: "button24"),
            CustomizeKey(afterDisplaySymbol: "button25", afterKeyOutPut: "button25"),
            CustomizeKey(afterDisplaySymbol: "button26", afterKeyOutPut: "button26"),
            CustomizeKey(afterDisplaySymbol: "button27", afterKeyOutPut: "button27"),
            CustomizeKey(afterDisplaySymbol: "button28", afterKeyOutPut: "button28"),
            CustomizeKey(afterDisplaySymbol: "button29", afterKeyOutPut: "button29"),
            CustomizeKey(afterDisplaySymbol: "button30", afterKeyOutPut: "button30"),
            CustomizeKey(afterDisplaySymbol: "button31", afterKeyOutPut: "button31"),
            CustomizeKey(afterDisplaySymbol: "button32", afterKeyOutPut: "button32"),
        ]
    )
    
    static let allCategories: [CustomKeyCategory] = [
        basicKeys, symbolKeys, controlKeys, keyPadKeys, specialKeys, functionKeys, internationalKeys, mouseKeys
    ]
}
