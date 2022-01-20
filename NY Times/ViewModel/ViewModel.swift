//
//  ViewModel.swift
//  NY Times
//
//  Created by Ahmed Durrani on 20/01/2022.
//

import SwiftUI
import Combine

class ViewModel: ObservableObject {
    @Published var results = [DocsNYTIME]()
    var pub: AnyPublisher<(data: Data, response: URLResponse), URLError>? = nil
    var sub: Cancellable? = nil
    @Published var loading = false

    init() {
        
        guard let url = URL(string: "https://api.nytimes.com/svc/search/v2/articlesearch.json?q=election&api-key=PANwDyQltdbj1Rogs7l3TTZxtrx8N8Ky") else {return}
        pub = URLSession.shared.dataTaskPublisher(for: url)
                .eraseToAnyPublisher()
        sub = pub?.sink(
            receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    fatalError(error.localizedDescription)
                }
            },
            receiveValue: { item in
                do {
                    let item = try JSONDecoder().decode(NYTime.self , from: item.data)
                    DispatchQueue.main.async {
                        self.results = item.response?.docs  ?? []
                        self.loading = true
                    }
                } catch {
                      print("Failed to decode \(error)")
                  }
                }
            )
        }
}
