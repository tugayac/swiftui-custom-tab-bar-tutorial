//
//  CustomTabBarItem.swift
//  SwiftUICustomTabBar
//
//  Created by Arda Tugay on 12/13/19.
//  Copyright © 2019 ardatugay. All rights reserved.
//

import SwiftUI

struct CustomTabBarItem<Content: View>: View {
    let iconName: String
    let label: String
    let selection: Binding<Int>
    let tag: Int
    let content: () -> Content
    
    init(iconName: String,
         label: String,
         selection: Binding<Int>,
         tag: Int,
         @ViewBuilder _ content: @escaping () -> Content) {
        self.iconName = iconName
        self.label = label
        self.selection = selection
        self.tag = tag
        self.content = content
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: iconName)
                .frame(minWidth: 25, minHeight: 25)
            Text(label)
                .font(.caption)
        }
        .padding([.top, .bottom], 5)
        .foregroundColor(fgColor())
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .onTapGesture { self.selection.wrappedValue = self.tag }
        .preference(key: TabBarPreferenceKey.self,
                    value: TabBarPreferenceData(
                        tabBarItemData: [TabBarItemData(tag: tag,
                                                        content: AnyView(self.content()) // 3
                        )]
                    )
        )
    }
    
    private func fgColor() -> Color {
        return selection.wrappedValue == tag ? Color(UIColor.systemBlue) : Color(UIColor.systemGray)
    }
}

struct CustomTabBarItem_Previews: PreviewProvider {
    static var selection: Int = 0
    static var selectionBinding = Binding<Int>(get: { selection }, set: { selection = $0 })
    
    static var previews: some View {
        CustomTabBarItem(iconName: "clock.fill", label: "Recents", selection: selectionBinding, tag: 0) {
            Text("Empty View")
        }
        .previewLayout(.fixed(width: 80, height: 80))
    }
}
