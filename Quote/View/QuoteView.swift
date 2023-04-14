//
//  QuoteView.swift
//  Quote
//
//  Created by Evelyn Chen on 2023-04-14.
//

import SwiftUI

struct QuoteView: View {
    
    @State var currentQuote: Quote?
    
    var body: some View {
        NavigationView{
            VStack{
                
                Spacer()
                
                if let currentQuote = currentQuote{
                    Text(currentQuote.quoteText)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .padding(20)
                    
                    
                    Text("-- " + currentQuote.quoteAuthor)
                        .font(.title3)
                        .multilineTextAlignment(.center)
                    
                }else{
                    ProgressView()
                }
                
                Spacer()
                
                Button(action: {
                                     

                                     Task {
                                         // Get another Quote
                                         withAnimation {
                                             currentQuote = nil
                                         }
                                         currentQuote = await NetworkService.fetch()
                                     }
                                 }, label: {
                                     Text("Fetch another one")
                                 })
                                 .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Random Quotes")
        }
        .task {
            currentQuote = await NetworkService.fetch()
        }
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView()
    }
}
