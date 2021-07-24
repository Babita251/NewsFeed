//
//  NewsViewController.swift
//  NewsFeedApp
//
//  Created by babita pal on 23/07/21.
//

import UIKit

struct Book {
    var bookTitle: String
    var bookAuthor: String
}

class NewsViewController: UIViewController,XMLParserDelegate {
    
    //
    
//    MARK:- Outlets
    @IBOutlet weak var viewParentView: UIView!
    @IBOutlet weak var myTable: UITableView!

//    MARK:- Private
    private var newsFeedModel: [NewsFeedParserModel] = []
    private var pageNumber: Int = 1
    private var url = URL(string: "https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fgithub.com%2Fdjango%2Fdjango%2Freleases.atom&api_key=wvflftpaghphulzzepmapkbjcrdbejldld8mcsrs")
   
//    http://91.212.43.32/XML/news.xml?username=mydesqxml3&password=mydesqxml3&usergroup=MYDESQ&Source=DJQS%2CDJNW%2CAWND%2CAWNF%2CAWID%2CAWFD%2CNBBC%2CBBCS%2CBBCN%2CAWTF%2CAWTG%2CMMDP&Company=CH0432492467
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewParentView.backgroundColor = COMMON_BACKGROUND_COLOR
        myTable.backgroundColor = COMMON_BACKGROUND_COLOR
        myTable.separatorStyle = .none
        fetchNewsFeedData()
        registerCell()
        
    }

    private func fetchNewsFeedData() {
        if let path = url {
            let request = NSMutableURLRequest(url: path)
            let session = URLSession.shared
            request.httpMethod = "POST"
            let paramString = "page=\(pageNumber)"
            request.httpBody = paramString.data(using: String.Encoding.utf8)

            session.dataTask(with: request as URLRequest, completionHandler: { ( data: Data?, response: URLResponse?, error: Error?) -> Void in
                guard let realResponse = response as? HTTPURLResponse,
                    realResponse.statusCode == 200 else {
                        print("Not a 200 response")
                        return
                }
                if let dataObj = data {
                    do {
                       
                        let dict = try JSONSerialization.jsonObject(with: dataObj, options: []) as? NSDictionary
                        if let arrOfDict = dict?["items"] as? [NSDictionary]{
                            for obj in arrOfDict {
                                let thumbnail = obj["thumbnail"] as? String
                                let pubDate = obj["pubDate"] as? String
                                let link = obj["link"] as? String
                                let title = obj["title"] as? String
                                let author = obj["author"] as? String
                                let model = NewsFeedParserModel(thumbnail: thumbnail ?? "", pubDate: pubDate ?? "", link: link ?? "", title: title ?? "", author: author ?? "")
                                self.newsFeedModel.append(model)
                            }
                            
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                }
                DispatchQueue.main.async {
                    self.myTable.reloadData()
                }
                
                
            }).resume()
        }
    }
    
    private func registerCell() {
        myTable.register(UINib(nibName:"NewsFeedTableViewCell", bundle:nil), forCellReuseIdentifier: "NewsFeedTableViewCell")
        myTable.register(UINib(nibName:"NewsFeedTopTableViewCell", bundle:nil), forCellReuseIdentifier: "NewsFeedTopTableViewCell")
        
        myTable.tableFooterView = UIView.init(frame: .zero)
    }

}

extension NewsViewController:  UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsFeedModel.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 260
        }
        return 120
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: "NewsFeedTopTableViewCell") as? NewsFeedTopTableViewCell {
                let source =  newsFeedModel[indexPath.row]
                cell.lblDate.text = source.pubDate
                cell.lblNewsText.text = source.title

                if let thumbnail = source.thumbnail,let url = URL(string: thumbnail) {
                    if let data = try? Data(contentsOf: url) {
                        cell.imgView.image = UIImage(data: data)
                    }
                }
                return cell
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "NewsFeedTableViewCell") as? NewsFeedTableViewCell {
                let source =  newsFeedModel[indexPath.row]
                cell.lblDate.text = source.pubDate
                cell.lblNewsText.text = source.title

                if let thumbnail = source.thumbnail,let url = URL(string: thumbnail) {
                    if let data = try? Data(contentsOf: url) {
                        cell.imgView.image = UIImage(data: data)
                    }
                }
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
}
