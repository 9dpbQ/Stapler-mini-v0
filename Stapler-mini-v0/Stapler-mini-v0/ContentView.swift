///メインのビュー
///色々なビューをここに集結。
import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: [SortDescriptor(\Preset.presetName, order: .forward)]) private var presets: [Preset]
    
    @State private var isEditing: Bool = false
    @State private var selectedPresetID: UUID? = nil
    @FocusState private var isPresetNameFocused: Bool
    
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State private var isSheetPresented_AddPreset: Bool = false
    @State private var isSheetPresented_Export: Bool = false
    @State private var selectedKeyboardLayout: KeyboardLayout? = nil
    
    @State private var selectedPreset: Preset? = nil
    @State private var selectedKeyboardKey: KeyboardKey = .initial
    @State private var isInspectorPresented: Bool = false
    
    
    var body: some View {
        NavigationSplitView {
            List(selection: $selectedPresetID) {
                ForEach(presets, id: \.id) { preset in
                    NavigationLink {
                        PresetView(preset: .constant(preset), selectedKeyboardKey: $selectedKeyboardKey)
                            .navigationTitle(preset.presetName)
                            .toolbar {
                                ToolbarItem {
                                    Button(action: {
                                        isSheetPresented_Export = true
                                    }) {
                                        Image(systemName: "square.and.arrow.up")
                                    }
                                }
                            }
                    } label: {
                        PresetLabelView(
                            preset: preset,
                            isEditing: $isEditing,
                            selectedPresetID: $selectedPresetID,
                            isFocused: $isPresetNameFocused,
                            onDelete: {
                                if let index = presets.firstIndex(where: { $0.id == preset.id }) {
                                    modelContext.delete(presets[index])
                                    selectedPreset = nil
                                }
                            }
                        )
                    }
                    .onChange(of: selectedPresetID) {
                        isEditing = false
                        selectedPreset = preset
                    }
                }
            }
            .navigationSplitViewColumnWidth(min: 180, ideal: 200, max: 220)
            .toolbar {
                ToolbarItem {
                    Button(action: {isSheetPresented_AddPreset = true }) {
                        Label("Add Preset", systemImage: "plus")
                    }
                    
                    
                }
            }
            
        } detail: {//Presetが選択されていない状態のビュー
            Text("Select or Add a preset from + button.")
        }
        .inspector(isPresented: $isInspectorPresented) {
            SelectedDetailView(selectedKeyboardKey: $selectedKeyboardKey, selectedPreset: selectedPreset)
                .inspectorColumnWidth(min: 180, ideal: 200, max: 220)
                .toolbar {
                    ToolbarItem {
                        Button {
                            isInspectorPresented.toggle()
                        } label: {
                            Label("toggle inspector", systemImage: "sidebar.right")
                        }
                        
                    }
                }
        }
        .sheet(isPresented: $isSheetPresented_AddPreset) {
            AddPresetSheetView(
                selectedKeyboardType: $selectedKeyboardLayout,
                isSheetPresented: $isSheetPresented_AddPreset,
                onDecision: addPreset,
                importPreset: {
                    loadPreset { preset in
                        if let preset = preset {
                            modelContext.insert(preset)
                            // Presetが正常に読み込まれた場合の処理
                            print("Loaded Preset: \(preset.presetName)")
                        } else {
                            // 読み込みが失敗またはキャンセルされた場合の処理
                            print("Failed or Canceled to load Preset.")
//                            showingAlert = true
//                            alertMessage = "Failed to load Preset. .stapler file is only importable"
                        }
                    }
                }
            )
        }
        .sheet(isPresented: $isSheetPresented_Export) {
            if let index = presets.firstIndex(where: { $0.id == selectedPresetID }) {
                let preset = presets[index]
                ExportSheetView(preset: preset)
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Import Result"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
        //        .frame(minWidth: 1000, maxWidth: .infinity, minHeight: 800, maxHeight: .infinity)//ウィンドウの最小、最大サイズ
    }
    private func addPreset(keyboardLayout: KeyboardLayout?) {
        guard let keyboardLayout = keyboardLayout else { return }
        let newPreset = Preset(presetName: "New Preset", keyboardLayout: keyboardLayout)
        modelContext.insert(newPreset)
    }
    private func deletePresets(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(presets[index])
            }
        }
    }
    
}


#Preview {
    ContentView()
        .modelContainer(for: Preset.self, inMemory: true)
}


