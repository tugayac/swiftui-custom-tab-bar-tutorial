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
    
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: iconName)
                .frame(minWidth: 25, minHeight: 25) // 1
            Text(label)
                .font(.caption)
        }
        .padding([.top, .bottom], 5) // 2
        .foregroundColor(Color(UIColor.systemGray))
        .frame(maxWidth: .infinity)
    }
}

struct CustomTabBarItem_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarItem(iconName: "clock.fill", label: "Recents")
            .previewLayout(.fixed(width: 80, height: 80))
    }
}
