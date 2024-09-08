//
//  NavigationWrapper.swift
//  CoInfo
//
//  Created by dopamint on 9/8/24.
//

import SwiftUI

struct CommonNavigationView: ViewModifier {
    let title: String
    
    func body(content: Content) -> some View {
        content
            .navigationTitle(title)
            .toolbar {
                Image(systemName: "person.crop.circle")
                    .font(.system(size: 25))
            }
    }
}

extension View {
    func navigationBarWithProfile(title: String) -> some View {
        self.modifier(CommonNavigationView(title: title))
    }
}
