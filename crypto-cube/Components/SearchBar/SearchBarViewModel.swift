//
//  SearchBarViewModel.swift
//  crypto-cube
//
//  Created by Maciej Dubowik on 11/07/2023.
//

import Foundation

class SearchBarViewModel: ObservableObject {
    @Published var text = ""
    @Published var searchResults: [CoreCrypto] = []

    func getCrypto(){
        APIFetchHandler.sharedInstance.fetchCryptoData(searchedResult: text) { result in
            self.searchResults = result as? [CoreCrypto] ?? []
        }
    }

}
