//
//  APIClient.swift
//  ArchitectureTest
//
//  Created by Kailash on 7/29/18.
//  Copyright © 2018 Kailash. All rights reserved.
//

import UIKit

class APIClient: NSObject {
    public func fetchMovies(completion:@escaping (Dictionary<String, Any>?) -> ()) -> [Movie]? {
        let session = URLSession()
        let task = session.dataTask(with: URL(string: API.GET_IMAGES)!){data,response,error in
            if let error = error {
                print("\(error)");
                completion(nil);
                return [Movie]();
            }else if let data = data{
                let responseCode = response as? HTTPURLResponse;
                if (responseCode?.statusCode == 200){
//                    if let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [NSDictionary]{
//
//                    }
                    print("\(data)");
                    completion(nil);
                    return [Movie]();
                }
            }
        }
        task.resume();
    }
}
