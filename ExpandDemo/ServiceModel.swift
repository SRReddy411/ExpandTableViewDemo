//
//  ServiceModel.swift
//  ExpandDemo
//
//  Created by RamiReddy on 20/03/21.
//  Copyright © 2021 RamiReddy. All rights reserved.
//

import Foundation



class ServicesModel{
    var title:String!
    var description:String!
    init(data:NSDictionary) {
        if let tit = data["title"]{
            self.title = tit as? String
        }
        
        if let desc = data["description"]{
            self.description = desc as? String
        }
    }
}
