//
//  HeaderView.swift
//  NY Times
//
//  Created by Ahmed Durrani on 20/01/2022.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Button {
                    
                } label: {
                    Image(systemName: "text.justify")
                        .foregroundColor(.white)
                        .font(.system(.title2 , design: .serif))
                }
                
              Text("NY Times Most Popular")
                    .foregroundColor(.white)
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                
                Spacer()
                
                Button {
                } label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)
                        .font(.system(.title2))
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "info.circle.fill")
                        .foregroundColor(.white)
                        .font(.system(.title2 , design: .serif))
                }
            }.padding(.leading , 5)
             .padding(.trailing , 5)
            Divider()
                .background(Color.gray)

         } .frame(maxHeight: 100, alignment: .bottom)
            .background(
                Color(red: 80/255.0, green: 227/255.0, blue: 194/255.0, opacity: 1.0))
          .ignoresSafeArea(.all, edges: .all)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
