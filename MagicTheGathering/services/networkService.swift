//
//  NetworkService.swift
//  MagicTheGathering
//
//  Created by Ivan Kramarchuk on 09/09/2019.
//  Copyright © 2019 i0532386223.me. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

class networkService {
       
    static func getCards(searchText: String?, completion: @escaping (Bool, [Datum]?) -> ()) {
        var parameters: Parameters = defaultSort
        var url = mainUrl
        if let searchText = searchText {
            if searchText.count > 0 {
                parameters["q"] = searchText
                url += keyField
            }
        }
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON { (responseData) -> Void in
            switch responseData.result {
            case .success(_):
                if((responseData.result.value) != nil) {
                    if responseData.response?.statusCode == 200 {
                        let decoder = JSONDecoder()
                        if let data = responseData.data {
                            do {
                                let result = try decoder.decode(Cards.self, from: data)
                                completion(true, result.data)
                                return
                            } catch {
                                print(error)
                            }
                        }
                    }
                    if responseData.response?.statusCode == 404 {
                        completion(true, nil)
                        return
                    }
                }
                completion(false, nil)
                break
            case .failure(let error):
                print(error)
                completion(false, nil)
            }
        }
    }
    
    static func placeImage(imagePath: String, completion: @escaping (UIImage?) -> ()) {
        Alamofire.request(imagePath).responseImage { response in
            if let image = response.result.value {
                completion(image)
            } else {
                completion(noPhotoImage)
            }
        }
    }
    
}
