import UIKit

class ApiService: NSObject {
    static let sharedInstance = ApiService()
    typealias ApiData = [(title: String, imageName: String, thumb: String)]
    var downloadData = ApiData()
    let baseUrl = "https://jsonplaceholder.typicode.com/photos/"
    func fetchVideos(_ completion: @escaping (ApiData?, Error?) -> (Void)) {
       fetchFeedForUrlString("\(baseUrl)", completion: completion)
    }
    func fetchFeedForUrlString(_ urlString: String,
                               completion: @escaping (ApiData?, Error?) -> (Void)) {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, _, error) in
            if error != nil {
                completion(nil, error)
                return
            }
            do {
                guard let parsedData = try JSONSerialization.jsonObject(with: data!, options: []) as? NSArray
                    else { return }
                let count = parsedData.count
                 for index in 0...count-1 {
                    guard let aObject = parsedData[index] as? [String : AnyObject] else { return }
                     let new = aObject["id"]!
                     self.downloadData.append((title: "\(aObject["title"]!)",
                        imageName: "https://source.unsplash.com/2200x1260/?\(new)",
                         thumb: "\(aObject["thumbnailUrl"]!)"))
                }
                    DispatchQueue.main.async(execute: {
                        completion(self.downloadData, nil)
                     })
            } catch let jsonError {
                completion(nil, jsonError)
            }
        }) .resume()
    }
}
