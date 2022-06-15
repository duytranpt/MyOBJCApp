//
//  People.swift
//  MyOBJCApp
//
//  Created by Duy Tran on 08/06/2022.
//

import Foundation

struct People: Decodable {
    let root: [Person]

    enum CodingKeys: String, CodingKey {
      case root
    }
}
