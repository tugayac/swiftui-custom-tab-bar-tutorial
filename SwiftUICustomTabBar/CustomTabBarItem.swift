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
        VStack {
            Image(systemName: iconName)
            Text(label)
                .font(.caption)
        }
        .foregroundColor(Color(UIColor.systemGray))
        .frame(maxWidth: .infinity) // 1
    }
}

struct CustomTabBarItem_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarItem(iconName: "clock.fill", label: "Recents")
            .previewLayout(.fixed(width: 80, height: 80)) // 2
    }
}
