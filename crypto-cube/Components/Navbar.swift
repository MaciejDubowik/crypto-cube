//
//  Navbar.swift
//  crypto-cube
//
//  Created by Maciej Dubowik on 28/06/2023.
//

import SwiftUI

struct Navbar: View {
    var body: some View {
        TabView {
            HomeView()
                .badge(2)
                .tabItem {
                    Label("Received", systemImage: "tray.and.arrow.down.fill")
                }
            SearchView()
                .tabItem {
                    Label("Sent", systemImage: "tray.and.arrow.up.fill")
                }

        }
    }
}

struct Navbar_Previews: PreviewProvider {
    static var previews: some View {
        Navbar()
    }
}
