///出力するときのシート用のビュー。


import SwiftUI
import UniformTypeIdentifiers
import PDFKit


struct CustomShapeButtonStyle<S: Shape>: ButtonStyle {
    let shape: S
    let fillColor: Color
    let frameSize: CGSize
    
    func makeBody(configuration: Configuration) -> some View {
        shape
            .fill(fillColor)
            .frame(width: frameSize.width, height: frameSize.height)
            .overlay(
                configuration.label
            )
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)  // 押した時のアニメーション
//            .animation(.easeInOut, value: configuration.isPressed)
    }
}

struct ExportSheetView: View {
    let preset: Preset
    let keySize: CGFloat = 65
    @State var showingAlert: Bool = false
    @State var alertMessage: String = ""
    @Environment(\.dismiss) private var dismiss
    
    @State private var showSuccessCheckMark_otherFile = false
    @State private var showSuccessCheckMark_JSONFile = false
    @State private var animateScale = false
    
    var body: some View {
        ZStack {
            mainSheetView
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("エクスポート結果"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
            // 成功時のチェックマーク表示
            if showSuccessCheckMark_otherFile {
                SuccessCheckMarkView_otherFile(isPresented: $showSuccessCheckMark_otherFile, animateScale: $animateScale)
            }
            if showSuccessCheckMark_JSONFile {
                SuccessCheckMarkView_JSON(isPresented: $showSuccessCheckMark_JSONFile, animateScale: $animateScale)
            }
        }
        .animation(.easeInOut, value: showSuccessCheckMark_otherFile)
        .animation(.easeInOut, value: showSuccessCheckMark_JSONFile)
    }
    
    private var mainSheetView: some View {
        VStack(spacing: 0) {
            ZStack {
                HStack {
                    Button(action: {dismiss()}) {
                        Image(systemName: "xmark.circle")
                            .font(.system(size: 35))
                    }
                    .buttonStyle(CustomShapeButtonStyle(
                        shape: Circle(),
                        fillColor: .clear,
                        frameSize: CGSize(width: 40, height: 40)))
                    .padding()
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text("\(preset.presetName)").font(.largeTitle)
                    Spacer()
                }
                VStack {
                    Spacer()
                    HStack{
                        Spacer()
                        Text("VendorID: \(preset.vendorID)")
                        Text("ProductID: \(preset.productID)")
                        Divider().frame(height: 10)
                        Text("KeyCode Region: \(preset.keyCodeRegion)")
                    }
                    .font(.caption)
                    .padding()
                }
            }
            Divider()
            // プリセットを受け取って、レイヤーまで一覧できるキーボードビュー
            KeyboardView_AllLayer(keySize: keySize, preset: preset)
            Divider()
            HStack {
                Menu {
                    Button {
                        exportPNG_AllLayer()
                    } label: {
                        Label("Export All Layer as PNG", systemImage: "photo")
                    }
                    Button {
                        exportPDF_AllLayer()
                    } label: {
                        Label("Export All Layer as PDF", systemImage: "photo")
                    }
                    Button {
                        exportPDF_EachLayer()
                    } label: {
                        Label("Export EachLayer as PDF", systemImage: "photo.stack")
                    }
                } label: {
                    Label("Export Image", systemImage: "photo")
                        .padding()
                }
                Button{
                    exportPreset(preset)
                } label: {
                    Label("Share Preset as stapler", systemImage: "square.and.arrow.up")
                }
                Button{
                    exportJSON()
                } label: {
                    Label ("Export as json", systemImage: "document.badge.gearshape")
                }
                
            }
            .padding()
        }
    }

    // 共通のエクスポート結果表示処理
    func handleExportResult(success: Bool, message: String? = nil, fileURL: URL? = nil) {
        if success {
            showExportSuccessMessage(fileURL: fileURL)
        } else {
            showExportFailureMessage(errorMessage: message)
        }
    }
    func exportJSON() {
        JSONExporter.exportJSON(preset, showingAlert: $showingAlert, alertMessage: $alertMessage, animationBool: $showSuccessCheckMark_JSONFile)
    }

    func exportPNG_AllLayer() {
        let allLayer = KeyboardView_AllLayer(keySize: 100, preset: preset)
        let renderer = ImageRenderer(content: allLayer)

        let savePanel = NSSavePanel()
        savePanel.allowedContentTypes = [UTType.png]
        savePanel.nameFieldStringValue = "\(preset.presetName).png"

        savePanel.begin { response in
            if response == .OK, let url = savePanel.url {
                if let imageData = renderer.nsImage?.tiffRepresentation,
                   let bitmap = NSBitmapImageRep(data: imageData),
                   let pngData = bitmap.representation(using: .png, properties: [:]) {
                    do {
                        try pngData.write(to: url)
                        handleExportResult(success: true, fileURL: url)
                    } catch {
                        handleExportResult(success: false, message: error.localizedDescription)
                    }
                } else {
                    handleExportResult(success: false, message: "画像の生成に失敗しました。")
                }
            } else {
                showExportCancelledMessage()
            }
        }
    }

    // PDF出力の処理
    func exportPDF_AllLayer() {
        let allLayer = KeyboardView_AllLayer(keySize: keySize, preset: preset)
        let renderer = ImageRenderer(content: allLayer)

        let savePanel = NSSavePanel()
        savePanel.allowedContentTypes = [UTType.pdf]
        savePanel.nameFieldStringValue = "\(preset.presetName).pdf"

        savePanel.begin { response in
            if response == .OK, let url = savePanel.url {
                renderer.render { size, context in
                    var box = CGRect(x: 0, y: 0, width: size.width, height: size.height)
                    guard let pdfContext = CGContext(url as CFURL, mediaBox: &box, nil) else {
                        return
                    }

                    pdfContext.beginPDFPage(nil)
                    context(pdfContext)
                    pdfContext.endPDFPage()
                    pdfContext.closePDF()
                    
                    handleExportResult(success: true, fileURL: url)
                }
            } else {
                showExportCancelledMessage()
            }
        }
    }
    func exportPDF_EachLayer() {
        // 各レイヤーのビューを作成
        let eachLayer012 = VStack {
            KeyboardView_EachLayer(keySize: 100, preset: preset, layer: preset.layer0).padding(.vertical, 10)
            KeyboardView_EachLayer(keySize: 100, preset: preset, layer: preset.layer1).padding(.vertical, 10)
            KeyboardView_EachLayer(keySize: 100, preset: preset, layer: preset.layer2).padding(.vertical, 10)
        }
        let eachLayer345 = VStack {
            KeyboardView_EachLayer(keySize: 100, preset: preset, layer: preset.layer3).padding(.vertical, 10)
            KeyboardView_EachLayer(keySize: 100, preset: preset, layer: preset.layer4).padding(.vertical, 10)
            KeyboardView_EachLayer(keySize: 100, preset: preset, layer: preset.layer5).padding(.vertical, 10)
        }
        let eachLayer678 = VStack {
            KeyboardView_EachLayer(keySize: 100, preset: preset, layer: preset.layer6).padding(.vertical, 10)
            KeyboardView_EachLayer(keySize: 100, preset: preset, layer: preset.layer7).padding(.vertical, 10)
            KeyboardView_EachLayer(keySize: 100, preset: preset, layer: preset.layer8).padding(.vertical, 10)
        }
        // PDFの保存パネル
        let savePanel = NSSavePanel()
        savePanel.allowedContentTypes = [UTType.pdf]
        savePanel.nameFieldStringValue = "\(preset.presetName)_forEachLayer.pdf"
        
        savePanel.begin { response in
            if response == .OK, let url = savePanel.url {
                // PDFのレンダリング処理を開始
                let renderers = [
                    ImageRenderer(content: eachLayer012),
                    ImageRenderer(content: eachLayer345),
                    ImageRenderer(content: eachLayer678)

                ]
                
                // PDFデータの準備
                let pdfData = NSMutableData()
                let pdfConsumer = CGDataConsumer(data: pdfData as CFMutableData)!
                
                // 最初のレイヤーのサイズを取得してmediaBoxを設定
                var initialSize: CGSize = .zero
                renderers.first?.render { size, _ in
                    initialSize = size
                }
                var mediaBox = CGRect(origin: .zero, size: initialSize)
                
                guard let pdfContext = CGContext(consumer: pdfConsumer, mediaBox: &mediaBox, nil) else {
                    showExportFailureMessage(errorMessage: "Failed to create PDF context")
                    return
                }
                
                for (index, renderer) in renderers.enumerated() {
                    renderer.render { size, context in
                        let box = CGRect(origin: .zero, size: size)
                        print("Layer \(index) rendered size: \(size)")
                        
                        // 新しいPDFページの開始（各ページに正確なサイズを設定）
                        let pageInfo = [kCGPDFContextMediaBox: box] as CFDictionary
                        pdfContext.beginPDFPage(pageInfo)
                        context(pdfContext)  // 各レイヤーのビューをレンダリング
                        pdfContext.endPDFPage()  // ページを閉じる
                    }
                }
                pdfContext.closePDF()
                
                // PDFデータをファイルに保存
                do {
                    try pdfData.write(to: url)
                    showExportSuccessMessage(fileURL: url) // 成功時の処理
                } catch {
                    showExportFailureMessage(errorMessage: "Failed to write PDF: \(error)") // ファイル保存中のエラー処理
                }
            } else {
                showExportCancelledMessage() // ユーザーがキャンセルした場合の処理
            }
        }
    }
    // 成功時のメッセージ表示
    func showExportSuccessMessage(fileURL: URL?) {
        print("ファイルが正常に保存されました。")
//        alertMessage = "ファイルが正常に保存されました。"
//        showingAlert = true
        withAnimation {
            showSuccessCheckMark_otherFile = true
        }
        // クイックルックやFinderで開く
        if let fileURL = fileURL {
            NSWorkspace.shared.activateFileViewerSelecting([fileURL])
        }
    }

    // 失敗時のメッセージ表示
    func showExportFailureMessage(errorMessage: String?) {
        alertMessage = errorMessage ?? "エクスポート中にエラーが発生しました。"
        showingAlert = true
        print(alertMessage)
    }

    // キャンセル時のメッセージ表示
    func showExportCancelledMessage() {
        print("保存がキャンセルされました。")
    }
}


struct SuccessCheckMarkView_JSON: View {
    @Binding var isPresented: Bool
    @Binding var animateScale: Bool
    var body: some View {

            
        VStack(spacing: 20) {
            Image(systemName: "checkmark.circle")
                .symbolEffect(.bounce.up, options: .repeat(3), isActive: isPresented)
                .font(.system(size: 60))
                .foregroundColor(.green)
        }
        .padding()
        .frame(width: 300, height: 200)
        .scaleEffect(animateScale ? 1.0 : 0.5) // 初期状態と表示後の大きさ
        .onAppear {
            withAnimation/*(.easeInOut(duration: 0.3)) */{
                animateScale = true // 表示と同時にスケールアップ
            }
            //            playNotificationSound() // 通知音を鳴らす
            playCustomSound()
            autoDismiss() // 一定時間後に自動で非表示
        }
        .onDisappear {
            animateScale = false // アラートが非表示になった時にリセット
        }
    }
        
    
//     一定時間後にアラートを自動的に非表示にする関数
    private func autoDismiss() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            isPresented = false
        }
    }
    
    // 通知音を鳴らす関数
    private func playNotificationSound() {
        let sound = NSSound(named: NSSound.Name("Submarine")) // システム通知音を指定
        sound?.play() // サウンドを再生
    }
    // カスタム音声ファイルを再生する関数
    private func playCustomSound() {
        if let soundURL = Bundle.main.url(forResource: "Success1", withExtension: "wav") { // "customSound.mp3"ファイルを指定
            let sound = NSSound(contentsOf: soundURL, byReference: false) // ファイルパスからサウンドをロード
            sound?.play() // カスタムサウンドを再生
        } else {
            print("カスタムサウンドファイルが見つかりませんでした")
        }
    }
}


struct SuccessCheckMarkView_otherFile: View {
    @Binding var isPresented: Bool
    @Binding var animateScale: Bool
    var body: some View {

            
        VStack(spacing: 20) {
            Image(systemName: "checkmark.circle")
                .symbolEffect(.bounce.up, options: .repeat(3), isActive: isPresented)
                .font(.system(size: 60))
                .foregroundColor(.green)
        }
        .padding()
        .frame(width: 300, height: 200)
        .scaleEffect(animateScale ? 1.0 : 0.5) // 初期状態と表示後の大きさ
        .onAppear {
            withAnimation/*(.easeInOut(duration: 0.3)) */{
                animateScale = true // 表示と同時にスケールアップ
            }
           
            autoDismiss() // 一定時間後に自動で非表示
        }
        .onDisappear {
            animateScale = false // アラートが非表示になった時にリセット
        }
    }
        
    
//     一定時間後にアラートを自動的に非表示にする関数
    private func autoDismiss() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            isPresented = false
        }
    }
}


