//
//  CustomTabBarItem.swift
//  SwiftUICustomTabBar
//
//  Created by Arda Tugay on 12/13/19.
//  Copyright © 2019 ardatugay. All rights reserved.
//

import SwiftUI

struct CustomTabBarItem: View {
    let iconName: String
    let label: String
    let selection: Binding<Int> // 1
    let tag: Int // 2
    
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: iconName)
                .frame(minWidth: 25, minHeight: 25)
            Text(label)
                .font(.caption)
        }
        .padding([.top, .bottom], 5)
        .foregroundColor(fgColor()) // 4
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .onTapGesture {
            self.selection.wrappedValue = self.tag // 3
        }
    }
    
    private func fgColor() -> Color {
        return selection.wrappedValue == tag ? Color(UIColor.systemBlue) : Color(UIColor.systemGray)
    }
}

struct CustomTabBarItem_Previews: PreviewProvider {
    static var selection: Int = 0
    static var selectionBinding = Binding<Int>(get: { selection }, set: { selection = $0 })
    
    static var previews: some View {
        CustomTabBarItem(iconName: "clock.fill", label: "Recents", selection: selectionBinding, tag: 0)
            .previewLayout(.fixed(width: 80, height: 80))
    }
}
