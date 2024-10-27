//
//  CustomizeKeyTabView.swift
//  SwiftData Test Project2
//
//  Created by qdpb on 2024/09/14.
//

import SwiftUI

struct CustomizeKeyTabView: View {
    @State private var searchText: String = ""
    @State private var selectedTab: String = "" // 現在選択中のタブを管理
    //    @Binding var externalSearchFieldFocuse: Bool // PresetViewからのバインディング
    @FocusState private var internalSearchFieldFocus: Bool // 独自のFocusState
    //
    // 全カテゴリーのキーをフィルタリング
    var filteredAllKeys: [CustomizeKey] {
        let allKeys = CustomKeyDataSet.allCategories.flatMap { $0.keys }
        if searchText.isEmpty {
            return allKeys
        } else {
            return allKeys.filter { key in
                key.afterDisplaySymbol.localizedCaseInsensitiveContains(searchText)
//                key.afterKeyOutPut.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    let columns = [
        GridItem(.adaptive(minimum: 65 - 65 * 0.07 + 2.5, maximum: 100))
    ]
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                ForEach(CustomKeyDataSet.allCategories, id: \.id) { category in
                    ScrollView(.vertical) {
                        LazyVGrid(columns: columns, spacing: 5) {
                            ForEach(category.keys, id: \.id) { key in
                                CustomizeKeyView_1u(customizeKey: key)
                            }
                        }
                        .padding()
                    }
                    .tabItem {
                        Text(category.name)
                    }
                    .tag(category.name)
                }
                
                VStack {
                    ScrollView(.vertical) {
                        LazyVGrid(columns: columns, spacing: 5) {
                            ForEach(filteredAllKeys, id: \.id) { key in
                                CustomizeKeyView_1u(customizeKey: key)
                            }
                        }
                        .padding()
                    }
                    
                }
                .tabItem {
                    Text("All")
                }
                .tag("All")
            }
            
            if selectedTab == "All" {
                VStack {
                    HStack {
                        Spacer()
                        // 検索バーを表示する
                        TextField("Search in All Keys", text: $searchText)
                            .background().cornerRadius(6)
                            .frame(width: 150)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.trailing, 10)
                            .focused($internalSearchFieldFocus)
                            .onSubmit{internalSearchFieldFocus = false}
                    }
                    
                    Spacer()
                }
                //            .onChange(of: externalSearchFieldFocuse) { oldValue, newValue in
                //                internalSearchFieldFocus = newValue
                //            }
            }
        }
    }
}


// CustomizeKey and CustomKeyDataSet structures remain the same
//ビューを小分けしにたら処理が軽くなるんじゃないかと試したけど無意味でした

//struct CustomizeKeyTabView: View {
//    let columns = [
//        GridItem(.adaptive(minimum: 70, maximum: 200)) // 最小・最大幅を調整
//    ]
//
//    var body: some View {
//        TabView {
//            ForEach(CustomKeyDataSet.allCategories, id: \.id) { category in
//                CustomizeCategoryView(category: category, columns: columns)
//                    .tabItem {
//                        Text(category.name)
//                    }
//            }
//        }
//    }
//}
//
//struct CustomizeCategoryView: View {
//    let category: CustomKeyCategory
//    let columns: [GridItem]
//
//    var body: some View {
//        ScrollView(.vertical) {
//            CustomizeKeyGridView(keys: category.keys, columns: columns)
//                .padding()
//        }
//    }
//}
//
//struct CustomizeKeyGridView: View {
//    let keys: [CustomizeKey]
//    let columns: [GridItem]
//
//    var body: some View {
//        LazyVGrid(columns: columns, spacing: 5) {
//            ForEach(keys, id: \.id) { key in
//                CustomizeKeyItemView(customizeKey: key)
//            }
//        }
//    }
//}
//
//struct CustomizeKeyItemView: View {
//    let customizeKey: CustomizeKey
//
//    var body: some View {
//        CustomizeKeyView_1u(customizeKey: customizeKey)
//    }
//}

//#Preview {
//    CustomizeKeyTabView()
//}
