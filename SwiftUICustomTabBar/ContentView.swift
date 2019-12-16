//
//  ContentView.swift
//  SwiftUICustomTabBar
//
//  Created by Arda Tugay on 12/12/19.
//  Copyright © 2019 ardatugay. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Int = 0 // 1
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) { // 2
            ZStack { // 3
                if (selection == 0) {
                    favoritesContent()
                } else if (selection == 1) {
                    recentsContent()
                } else if (selection == 2) {
                    contactsContent()
                } else if (selection == 3) {
                    keypadContent()
                } else if (selection == 4) {
                    voicemailContent()
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            HStack(alignment: .lastTextBaseline) {
                CustomTabBarItem(iconName: "star.fill",
                                 label: "Favorites",
                                 onTap: { self.selection = 0 }) // 4
                CustomTabBarItem(iconName: "clock.fill",
                                 label: "Recents",
                                 onTap: { self.selection = 1 })
                CustomTabBarItem(iconName: "person.crop.circle",
                                 label: "Contacts",
                                 onTap: { self.selection = 2 })
                CustomTabBarItem(iconName: "circle.grid.3x3.fill",
                                 label: "Keypad",
                                 onTap: { self.selection = 3 })
                CustomTabBarItem(iconName: "recordingtape",
                                 label: "Voicemail",
                                 onTap: { self.selection = 4 })
            }
            .frame(maxWidth: .infinity)
            .background(
                GeometryReader { parentGeometry in
                    Rectangle()
                        .fill(Color(UIColor.systemGray2))
                        .frame(width: parentGeometry.size.width, height: 0.5)
                        .position(x: parentGeometry.size.width / 2, y: 0)
                }
            )
            .background(Color(UIColor.systemGray6))
        }.frame(maxHeight: .infinity, alignment: .bottom)
    }
    
    private func favoritesContent() -> some View {
        return Text("Favorites Content")
    }
    
    private func recentsContent() -> some View {
        return Text("Recents Content")
    }
    
    private func contactsContent() -> some View {
        return Text("Contacts Content")
    }
    
    private func keypadContent() -> some View {
        return Text("Keypad Content")
    }
    
    private func voicemailContent() -> some View {
        return Text("Voicemail Content")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
