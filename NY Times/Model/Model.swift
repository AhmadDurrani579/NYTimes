//
//  File.swift
//  NY Times
//
//  Created by Ahmed Durrani on 20/01/2022.
//

import Foundation

struct NYTime : Decodable {
   var status: String?
    var copyright: String?
    var response: ResponseOfNYTime?
}
struct ResponseOfNYTime : Decodable , Hashable {
    var docs : [DocsNYTIME]
}

struct DocsNYTIME : Decodable , Hashable {
    var web_url: String?
    var snippet: String?
    var lead_paragraph: String?
    var abstract: String?
    var print_page: String?
    var source: String?
    var pub_date : String?
    var document_type : String?
    var news_desk : String?
    var section_name : String?
    var type_of_material : String?
    var _id : String?
    var uri : String?
}
