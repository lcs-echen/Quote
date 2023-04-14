//
//  QuoteModel.swift
//  Quote
//
//  Created by Evelyn Chen on 2023-04-14.
//

import Foundation

struct Quote: Codable{
    var quoteText: String
    var quoteAuthor: String
    var senderName: String
    var senderLink: String
    var quoteLink: String
}

let firstQuote = Quote(quoteText:"The intuition of free will gives us the truth. ", quoteAuthor:"Corliss Lamont", senderName:"", senderLink:"", quoteLink: "")
