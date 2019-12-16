//
//  ContentView.swift
//  SwiftUICustomTabBar
//
//  Created by Arda Tugay on 12/12/19.
//  Copyright © 2019 ardatugay. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack(alignment: .lastTextBaseline) {
                CustomTabBarItem(iconName: "star.fill", label: "Favorites")
                CustomTabBarItem(iconName: "clock.fill", label: "Recents")
                CustomTabBarItem(iconName: "person.crop.circle", label: "Contacts")
                CustomTabBarItem(iconName: "circle.grid.3x3.fill", label: "Keypad")
                CustomTabBarItem(iconName: "recordingtape", label: "Voicemail")
            }
            .frame(maxWidth: .infinity)
            .background(
                GeometryReader { parentGeometry in // 2
                    Rectangle()
                        .fill(Color(UIColor.systemGray2))
                        .frame(width: parentGeometry.size.width, height: 0.5) // 3
                        .position(x: parentGeometry.size.width / 2, y: 0) // 4
                }
            )
            .background(Color(UIColor.systemGray6)) // 5
        }.frame(maxHeight: .infinity, alignment: .bottom) // 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
