//
//  NewsFeedParserModel.swift
//  NewsFeedApp
//
//  Created by babita pal on 23/07/21.
//

import Foundation

class NewsFeedParserModel: NSObject {
    
    public var thumbnail: String?
    public var pubDate: String?
    public var link: String?
    public var title: String?
    public var author: String?
    
    init(thumbnail: String,pubDate: String, link: String, title: String, author: String) {
        self.thumbnail = thumbnail
        self.pubDate = pubDate
        self.link = link
        self.title = title
        self.author = author
    }
//    var newsDataArray:[NSMutableDictionary] = []
//    var elements = NSMutableDictionary()
//    var element = String()
//    var thumbnail = NSMutableString()
//    var pubDate = NSMutableString()
//    var link = NSMutableString()
//    var author = NSMutableString()
//
//    init(data: Data?) {
//        super.init()
//        if let newsFeedData = data {
//            let parser = XMLParser(data: newsFeedData)
//            parser.delegate = self
//            parser.parse()
//        }
//    }
//
//
//    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String])
//    {
//        element = elementName
//        if (elementName as NSString).isEqual(to: "items")
//        {
//            elements = NSMutableDictionary()
//            elements = [:]
//            pubDate = NSMutableString()
//            pubDate = ""
//            link = NSMutableString()
//            link = ""
//            author = NSMutableString()
//            author = ""
//            thumbnail = NSMutableString()
//            thumbnail = ""
//        }
//
//    }
//
//    func parser(_ parser: XMLParser, foundCharacters string: String)
//    {
//        if element.isEqual("pubDate") {
//            pubDate.append(string)
//        } else if element.isEqual("link") {
//            link.append(string)
//        } else if element.isEqual("author") {
//            author.append(string)
//        } else if element.isEqual("thumbnail") {
//            thumbnail.append(string)
//        }
//
//    }
//
//    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
//    {
//        if (elementName as NSString).isEqual(to: "items") {
//            if !pubDate.isEqual(nil) {
//                elements.setObject(pubDate, forKey: "pubDate" as NSCopying)
//            }
//            if !link.isEqual(nil) {
//                elements.setObject(link, forKey: "link" as NSCopying)
//            }
//            if !author.isEqual(nil) {
//                elements.setObject(author, forKey: "author" as NSCopying)
//            }
//            if !thumbnail.isEqual(nil) {
//                elements.setObject(thumbnail, forKey: "thumbnail" as NSCopying)
//            }
//
//            newsDataArray.append(elements)
//        }
//    }
//
}
