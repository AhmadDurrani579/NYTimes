//
//  ContentView.swift
//  NY Times
//
//  Created by Ahmed Durrani on 20/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ViewModel()
    @State var searchText = ""
    @State private var isLoading = false

    var body: some View {
        ZStack {
            
            VStack {
                HeaderView()
                    .padding(.horizontal , 0)
                    .padding(.vertical , 0)
                
                TextField("Search Text", text: $searchText)
                    .padding(7)
                    .background(Color(.systemGray5))
                    .cornerRadius(13)
                    .padding(.horizontal , 15)

                ScrollView(.vertical , showsIndicators: false) {
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 10, alignment: .top)], alignment: .leading, spacing: 0 , content: {
                        ForEach((viewModel.results).filter({"\($0)".contains(searchText) || searchText.isEmpty }) , id: \.self) { newsItem in
                            ViewOfNewsItem(item: newsItem)
                        }
                    })
                }
            }
             
            if viewModel.loading == false {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .black))
                        .scaleEffect(3)
            }
        }.onAppear{startNetWorkCall()}
        .ignoresSafeArea( edges: .all)
        
    }
    
    func startNetWorkCall() {
        isLoading = false
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            isLoading = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ActivityIndicatorView: View {
//    @Binding var isPresented:Bool
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1))
            ProgressView {
                Text("Loading...")
                    .font(.title2)
            }
        }.frame(width: 120, height: 120, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 25).stroke(.gray,lineWidth: 2))

    }
}
