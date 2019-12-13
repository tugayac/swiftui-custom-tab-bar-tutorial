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
        HStack(alignment: .lastTextBaseline) {
            CustomTabBarItem(iconName: "star.fill", label: "Favorites")
            CustomTabBarItem(iconName: "clock.fill", label: "Recents")
            CustomTabBarItem(iconName: "person.crop.circle", label: "Contacts")
            CustomTabBarItem(iconName: "circle.grid.3x3.fill", label: "Keypad")
            CustomTabBarItem(iconName: "recordingtape", label: "Voicemail")
        }.frame(maxWidth: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
