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
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }

        }
    }
}

struct Navbar_Previews: PreviewProvider {
    static var previews: some View {
        Navbar()
    }
}
