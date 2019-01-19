//
//  BookingModel.swift
//  PicapPrueba
//
//  Created by Leonel Alfonso on 1/18/19.
//  Copyright © 2019 Leonel Alfonso. All rights reserved.
//

import Foundation


class Booking {
    var id: String
    var address: String
    var name: String
    var price: String
    var plate: String
    var photo: String
    var status: String
    
    func getId() -> String {
        return id
    }
    
    init(id: String, address: String, name: String, price: String, plate: String ,photo: String, status: String) {
        self.id = id
        self.address = address
        self.name = name
        self.price = price
        self.photo = photo
        self.plate = plate
        self.status = status
    }
}
