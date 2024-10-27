///エンターのカスタムシェイプの定義。

import SwiftUI

struct EnterShape_JIS: Shape {
    let frameValue: CGFloat
    private var  paddingValue: CGFloat {
        frameValue * 0.07
    }
    private var roundValue: CGFloat {
        frameValue * 0.07
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            // スタートポイント(左上の角丸終わりから時計回りに描画)
            let startPoint = CGPoint(x: paddingValue + roundValue, y: paddingValue)
            // 1. 左上から右上の丸みの始まりまでのライン
            path.move(to: startPoint)
            path.addLine(to: CGPoint(x: rect.width - paddingValue - roundValue, y: paddingValue))
            
            // 2. 右上の角の丸みを描画
            path.addArc(center: CGPoint(x: rect.width - paddingValue - roundValue, y: paddingValue + roundValue),
                        radius: roundValue,
                        startAngle: .degrees(270),
                        endAngle: .degrees(0),
                        clockwise: false)
            
            // 3. 右側のライン（右上から右下まで）
            path.addLine(to: CGPoint(x: rect.width - paddingValue, y: rect.height - paddingValue - roundValue))
            
            // 4. 右下の丸みを描画
            path.addArc(center: CGPoint(x: rect.width - paddingValue - roundValue, y: rect.height - paddingValue - roundValue),
                        radius: roundValue,
                        startAngle: .degrees(0),
                        endAngle: .degrees(90),
                        clockwise: false)
            
            // 5. 下側のラインを描画 (エンターキー下部の水平ライン)
            path.addLine(to: CGPoint(x: rect.width / 6 + paddingValue + roundValue, y: rect.height - paddingValue))
            
            // 6. 左下の角の丸みを描画
            path.addArc(center: CGPoint(x: rect.width / 6 + paddingValue + roundValue, y: rect.height - paddingValue - roundValue),
                        radius: roundValue,
                        startAngle: .degrees(90),
                        endAngle: .degrees(180),
                        clockwise: false)
            
            // 7. 左側のライン1本目を描画
            path.addLine(to: CGPoint(x: rect.width / 6 + paddingValue, y: rect.height / 2 - paddingValue + roundValue))
            // 8. 左中央の丸みを描画
            path.addArc(center: CGPoint(x: rect.width / 6 + paddingValue - roundValue, y: rect.height / 2 - paddingValue + roundValue),
                        radius: roundValue,
                        startAngle: .degrees(0),
                        endAngle: .degrees(-90),
                        clockwise: true)
            // 9. 中央のラインを描画
            path.addLine(to: CGPoint(x: paddingValue + roundValue, y: rect.height / 2 - paddingValue))
            
            // 10. 左下の角の丸みを描画
            path.addArc(center: CGPoint(x: paddingValue + roundValue, y: rect.height / 2 - paddingValue - roundValue),
                        radius: roundValue,
                        startAngle: .degrees(90),
                        endAngle: .degrees(180),
                        clockwise: false)
            // 11. 左側のライン2本目
            path.addLine(to: CGPoint(x: paddingValue, y: paddingValue + roundValue))
            
            //12. 左上の丸みを描画
            path.addArc(center: CGPoint(x: paddingValue + roundValue, y: paddingValue + roundValue),
                        radius: roundValue,
                        startAngle: .degrees(180),
                        endAngle: .degrees(270),
                        clockwise: false)
            
            // パスを閉じる
            path.closeSubpath()
        }
    }
}

struct EnterShape_JIS_HighLight: Shape {
    let frameValue: CGFloat
    private var  centerRoundValue: CGFloat {
        frameValue * 0.07
    }
    private var roundValue: CGFloat {
        frameValue * 0.14
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            // スタートポイント(左上の角丸終わりから時計回りに描画)
            let startPoint = CGPoint(x: roundValue, y: 0)
            // 1. 左上から右上の丸みの始まりまでのライン
            path.move(to: startPoint)
            path.addLine(to: CGPoint(x: rect.width - roundValue, y: 0))
            
            // 2. 右上の角の丸みを描画
            path.addArc(center: CGPoint(x: rect.width - roundValue, y: roundValue),
                        radius: roundValue,
                        startAngle: .degrees(270),
                        endAngle: .degrees(0),
                        clockwise: false)
            
            // 3. 右側のライン（右上から右下まで）
            path.addLine(to: CGPoint(x: rect.width, y: rect.height - roundValue))
            
            // 4. 右下の丸みを描画
            path.addArc(center: CGPoint(x: rect.width - roundValue, y: rect.height - roundValue),
                        radius: roundValue,
                        startAngle: .degrees(0),
                        endAngle: .degrees(90),
                        clockwise: false)
            
            // 5. 下側のラインを描画 (エンターキー下部の水平ライン)
            path.addLine(to: CGPoint(x: rect.width / 6 + roundValue, y: rect.height))
            
            // 6. 左下の角の丸みを描画
            path.addArc(center: CGPoint(x: rect.width / 6 + roundValue, y: rect.height - roundValue),
                        radius: roundValue,
                        startAngle: .degrees(90),
                        endAngle: .degrees(180),
                        clockwise: false)
            
            // 7. 左側のライン1本目を描画
            path.addLine(to: CGPoint(x: rect.width / 6, y: rect.height / 2 + roundValue))
            // 8. 左中央の丸みを描画
            path.addArc(center: CGPoint(x: rect.width / 6 - centerRoundValue, y: rect.height / 2 + centerRoundValue),
                        radius: centerRoundValue,
                        startAngle: .degrees(0),
                        endAngle: .degrees(-90),
                        clockwise: true)
            // 9. 中央のラインを描画
            path.addLine(to: CGPoint(x: roundValue, y: rect.height / 2))
            
            // 10. 左下の角の丸みを描画
            path.addArc(center: CGPoint(x: roundValue, y: rect.height / 2 - roundValue),
                        radius: roundValue,
                        startAngle: .degrees(90),
                        endAngle: .degrees(180),
                        clockwise: false)
            // 11. 左側のライン2本目
            path.addLine(to: CGPoint(x: 0, y: roundValue))
            
            //12. 左上の丸みを描画
            path.addArc(center: CGPoint(x: roundValue, y: roundValue),
                        radius: roundValue,
                        startAngle: .degrees(180),
                        endAngle: .degrees(270),
                        clockwise: false)
            
            // パスを閉じる
            path.closeSubpath()
        }
    }
}

struct EnterShape_UK: Shape {
    let frameValue: CGFloat
    private var  paddingValue: CGFloat {
        frameValue * 0.07
    }
    private var roundValue: CGFloat {
        frameValue * 0.07
    }
    
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            // スタートポイント(左上の角丸終わりから時計回りに描画)
            let startPoint = CGPoint(x: paddingValue + roundValue, y: paddingValue)
            // 1. 左上から右上の丸みの始まりまでのライン
            path.move(to: startPoint)
            path.addLine(to: CGPoint(x: rect.width - paddingValue - roundValue, y: paddingValue))
            
            // 2. 右上の角の丸みを描画
            path.addArc(center: CGPoint(x: rect.width - paddingValue - roundValue, y: paddingValue + roundValue),
                        radius: roundValue,
                        startAngle: .degrees(270),
                        endAngle: .degrees(0),
                        clockwise: false)
            
            // 3. 右側のライン（右上から右下まで）
            path.addLine(to: CGPoint(x: rect.width - paddingValue, y: rect.height - paddingValue - roundValue))
            
            // 4. 右下の丸みを描画
            path.addArc(center: CGPoint(x: rect.width - paddingValue - roundValue, y: rect.height - paddingValue - roundValue),
                        radius: roundValue,
                        startAngle: .degrees(0),
                        endAngle: .degrees(90),
                        clockwise: false)
            
            // 5. 下側のラインを描画 (エンターキー下部の水平ライン)
            path.addLine(to: CGPoint(x: rect.width / 4 + paddingValue + roundValue, y: rect.height - paddingValue))
            
            // 6. 左下の角の丸みを描画
            path.addArc(center: CGPoint(x: rect.width / 4 + paddingValue + roundValue, y: rect.height - paddingValue - roundValue),
                        radius: roundValue,
                        startAngle: .degrees(90),
                        endAngle: .degrees(180),
                        clockwise: false)
            
            // 7. 左側のライン1本目を描画
            path.addLine(to: CGPoint(x: rect.width / 4 + paddingValue, y: rect.height / 2 - paddingValue + roundValue))
            // 8. 左中央の丸みを描画
            path.addArc(center: CGPoint(x: rect.width / 4 + paddingValue - roundValue, y: rect.height / 2 - paddingValue + roundValue),
                        radius: roundValue,
                        startAngle: .degrees(0),
                        endAngle: .degrees(-90),
                        clockwise: true)
            // 9. 中央のラインを描画
            path.addLine(to: CGPoint(x: paddingValue + roundValue, y: rect.height / 2 - paddingValue))
            
            // 10. 左下の角の丸みを描画
            path.addArc(center: CGPoint(x: paddingValue + roundValue, y: rect.height / 2 - paddingValue - roundValue),
                        radius: roundValue,
                        startAngle: .degrees(90),
                        endAngle: .degrees(180),
                        clockwise: false)
            // 11. 左側のライン2本目
            path.addLine(to: CGPoint(x: paddingValue, y: paddingValue + roundValue))
            
            //12. 左上の丸みを描画
            path.addArc(center: CGPoint(x: paddingValue + roundValue, y: paddingValue + roundValue),
                        radius: roundValue,
                        startAngle: .degrees(180),
                        endAngle: .degrees(270),
                        clockwise: false)
            
            // パスを閉じる
            path.closeSubpath()
        }
    }
}
struct EnterShape_UK_HighLight: Shape {
    let frameValue: CGFloat
    private var  centerRoundValue: CGFloat {
        frameValue * 0.07
    }
    private var roundValue: CGFloat {
        frameValue * 0.14
    }
    
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            // スタートポイント(左上の角丸終わりから時計回りに描画)
            let startPoint = CGPoint(x: roundValue, y: 0)
            // 1. 左上から右上の丸みの始まりまでのライン
            path.move(to: startPoint)
            path.addLine(to: CGPoint(x: rect.width - roundValue, y: 0))
            
            // 2. 右上の角の丸みを描画
            path.addArc(center: CGPoint(x: rect.width - roundValue, y: roundValue),
                        radius: roundValue,
                        startAngle: .degrees(270),
                        endAngle: .degrees(0),
                        clockwise: false)
            
            // 3. 右側のライン（右上から右下まで）
            path.addLine(to: CGPoint(x: rect.width, y: rect.height - roundValue))
            
            // 4. 右下の丸みを描画
            path.addArc(center: CGPoint(x: rect.width - roundValue, y: rect.height - roundValue),
                        radius: roundValue,
                        startAngle: .degrees(0),
                        endAngle: .degrees(90),
                        clockwise: false)
            
            // 5. 下側のラインを描画 (エンターキー下部の水平ライン)
            path.addLine(to: CGPoint(x: rect.width / 4 + roundValue, y: rect.height))
            
            // 6. 左下の角の丸みを描画
            path.addArc(center: CGPoint(x: rect.width / 4 + roundValue, y: rect.height - roundValue),
                        radius: roundValue,
                        startAngle: .degrees(90),
                        endAngle: .degrees(180),
                        clockwise: false)
            
            // 7. 左側のライン1本目を描画
            path.addLine(to: CGPoint(x: rect.width / 4, y: rect.height / 2 + roundValue))
            // 8. 左中央の丸みを描画
            path.addArc(center: CGPoint(x: rect.width / 4 - centerRoundValue, y: rect.height / 2 + centerRoundValue),
                        radius: centerRoundValue,
                        startAngle: .degrees(0),
                        endAngle: .degrees(-90),
                        clockwise: true)
            // 9. 中央のラインを描画
            path.addLine(to: CGPoint(x: roundValue, y: rect.height / 2))
            
            // 10. 左下の角の丸みを描画
            path.addArc(center: CGPoint(x: roundValue, y: rect.height / 2 - roundValue),
                        radius: roundValue,
                        startAngle: .degrees(90),
                        endAngle: .degrees(180),
                        clockwise: false)
            // 11. 左側のライン2本目
            path.addLine(to: CGPoint(x: 0, y: roundValue))
            
            //12. 左上の丸みを描画
            path.addArc(center: CGPoint(x: roundValue, y: roundValue),
                        radius: roundValue,
                        startAngle: .degrees(180),
                        endAngle: .degrees(270),
                        clockwise: false)
            
            // パスを閉じる
            path.closeSubpath()
        }
    }
}
