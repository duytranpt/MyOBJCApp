//
//  Person.swift
//  MyOBJCApp
//
//  Created by Duy Tran on 08/06/2022.
//

import Foundation

struct Person: Decodable {
    let fullName: String
    let dateOfBirth: String
    let phoneNumber: String
    let gender: Bool
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case dateOfBirth = "date_of_birth"
        case phoneNumber = "phone_number"
        case gender = "sex"
    }
}

extension Person: Display {
    var hoTen: String {
        fullName
    }
    
    var ngaySinh: String {
        dateOfBirth
    }
    
    var sdt: String {
        phoneNumber
    }
    
    var gioiTinh: Bool {
        gender
    }
    
 
}
