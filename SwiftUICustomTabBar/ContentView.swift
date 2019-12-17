//
//  ContentView.swift
//  SwiftUICustomTabBar
//
//  Created by Arda Tugay on 12/12/19.
//  Copyright © 2019 ardatugay. All rights reserved.
//

import SwiftUI

struct TabBarItemData {
    var tag: Int
    var content: AnyView
}

struct TabBarPreferenceData {
    var tabBarBounds: CGRect? = nil
    var tabBarItemData: [TabBarItemData] = []
}

struct TabBarPreferenceKey: PreferenceKey {
    typealias Value = TabBarPreferenceData

    static var defaultValue: TabBarPreferenceData = TabBarPreferenceData()

    static func reduce(value: inout TabBarPreferenceData, nextValue: () -> TabBarPreferenceData) {
        if let tabBarBounds = nextValue().tabBarBounds {
            value.tabBarBounds = tabBarBounds
        }
        value.tabBarItemData.append(contentsOf: nextValue().tabBarItemData)
    }
}

struct ContentView: View {
    @State private var selection: Int = 0
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            HStack(alignment: .lastTextBaseline) {
                CustomTabBarItem(iconName: "star.fill",
                                 label: "Favorites",
                                 selection: $selection,
                                 tag: 0)
                {
                    Text("Favorites Content")
                }
                CustomTabBarItem(iconName: "clock.fill",
                                 label: "Recents",
                                 selection: $selection,
                                 tag: 1)
                {
                    Text("Recents Content")
                }
                CustomTabBarItem(iconName: "person.crop.circle",
                                 label: "Contacts",
                                 selection: $selection,
                                 tag: 2)
                {
                    Text("Contacts Content")
                }
                CustomTabBarItem(iconName: "circle.grid.3x3.fill",
                                 label: "Keypad",
                                 selection: $selection,
                                 tag: 3)
                {
                    Text("Keypad Content")
                }
                CustomTabBarItem(iconName: "recordingtape",
                                 label: "Voicemail",
                                 selection: $selection,
                                 tag: 4)
                {
                    Text("Voicemail Content")
                }
            }
            .background(
                GeometryReader { parentGeometry in
                    Rectangle()
                        .fill(Color(UIColor.systemGray2))
                        .frame(width: parentGeometry.size.width, height: 0.5)
                        .position(x: parentGeometry.size.width / 2, y: 0)
                }
            )
            .background(Color(UIColor.systemGray6))
            .overlay(
                GeometryReader { geometry in
                    Rectangle()
                        .fill(Color.clear)
                        .preference(key: TabBarPreferenceKey.self,
                                    value: TabBarPreferenceData(tabBarBounds: geometry.frame(in: .named("customTabBar")))
                        )
                }
            )
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .overlayPreferenceValue(TabBarPreferenceKey.self) { (preferences: TabBarPreferenceData) in
            return GeometryReader { geometry in
                self.createTabBarContentOverlay(geometry, preferences)
            }
        }
        .coordinateSpace(name: "customTabBar")
    }
    
    private func createTabBarContentOverlay(_ geometry: GeometryProxy,
                                            _ preferences: TabBarPreferenceData) -> some View {
        let tabBarBounds = preferences.tabBarBounds != nil ? preferences.tabBarBounds! : .zero // 1
        let contentToDisplay = preferences.tabBarItemData.first(where: { $0.tag == self.selection }) // 2
        
        return ZStack {
            if contentToDisplay == nil { // 3
                Text("Empty View")
            } else {
                contentToDisplay!.content // 4
            }
        }
        .frame(width: geometry.size.width,
               height: geometry.size.height - tabBarBounds.size.height,
               alignment: .center) // 5
        .position(x: geometry.size.width / 2,
                  y: (geometry.size.height - tabBarBounds.size.height) / 2) // 6
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
