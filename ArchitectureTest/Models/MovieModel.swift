//
//  MovieModel.swift
//  ArchitectureTest
//
//  Created by Kailash on 7/29/18.
//  Copyright © 2018 Kailash. All rights reserved.
//

import Foundation

class Movie {
    var title:String
    var description: String
    
    init(movieTitle movie:String, andDescription desc:String){
        self.title = movie;
        self.description = desc;
    }
}
