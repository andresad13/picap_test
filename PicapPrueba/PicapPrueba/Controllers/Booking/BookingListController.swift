//
//  BookingListController.swift
//  PicapPrueba
//
//  Created by Leonel Alfonso on 1/18/19.
//  Copyright © 2019 Leonel Alfonso. All rights reserved.
//

import UIKit

class BookingListController: UIView {
var Bookings: [Booking] = []
    func getBookingList(page : Int, completionHandler: @escaping ( _ BookRes: [Booking]) -> ())  {
        let strURL = NSLocalizedString("url_list", comment: "")
        let page = 1
        AFWrapper.requestGETURL(strURL, page , success: {
            (JSONResponse) -> Void in
            for i in stride(from: 0, to:JSONResponse.count , by: 1) {
                let booking = Booking(id: "\(JSONResponse[i]["_id"])", address: "\(JSONResponse[i]["address"])", name: "\(JSONResponse[i]["driver"]["name"])", price: "\(JSONResponse[i]["final_cost_cents"])",plate: "\(JSONResponse[i]["served_vehicle"]["plates"])" ,  photo: "\(JSONResponse[i] ["driver"]["photo_url"])", status: "\(JSONResponse[i]["status_cd"])")
                self.Bookings.append(booking)
            }
            completionHandler(self.Bookings)
        }) {
            (error) -> Void in
            print(error)
        }
    }
    func getBookingDetail(idDetail : String, completionHandler: @escaping ( _ BookRes: [String]) -> ())  {
        
        let strURL = "\(NSLocalizedString("url_detail", comment: ""))\(idDetail)"
        AFWrapper.requestDetailGETURL(strURL , success: {
            (JSONResponse) -> Void in            
            let datailArray = ["\(JSONResponse["address"])","\(JSONResponse["trv_distance_str"])", "\(JSONResponse["status_cd"])", "\(JSONResponse["estimated_cost"]["subunits"])", "\(JSONResponse["driver"]["name"])", "\(JSONResponse["driver"]["phone"])", "\(JSONResponse["driver"]["rating_as_driver"])", "\(JSONResponse["driver"]["photo_url"])"
            
            , "\(JSONResponse["passenger"]["name"])", "\(JSONResponse["passenger"]["phone"])", "\(JSONResponse["passenger"]["rating_as_passenger"])", "\(JSONResponse["passenger"]["photo_url"])"]
            completionHandler(datailArray)
        }) {
            (error) -> Void in
            print(error)
        }
    }
}
