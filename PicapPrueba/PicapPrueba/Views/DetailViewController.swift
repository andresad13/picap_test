//
//  DetailViewController.swift
//  PicapPrueba
//
//  Created by Leonel Alfonso on 1/19/19.
//  Copyright © 2019 Leonel Alfonso. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var idDetail:String?
    @IBOutlet weak var statusText: UILabel!
    @IBOutlet weak var addressText: UILabel!
    @IBOutlet weak var distanceText: UILabel!
    @IBOutlet weak var priceText: UILabel!
    @IBOutlet weak var driverImage: UIImageView!
    @IBOutlet weak var driverName: UILabel!
    @IBOutlet weak var driverLabel: UILabel!
    @IBOutlet weak var driverStars: UILabel!
    @IBOutlet weak var driverPhone: UILabel!
    @IBOutlet weak var passengerImage: UIImageView!
    @IBOutlet weak var passengerName: UILabel!
    @IBOutlet weak var passengerLabel: UILabel!
    @IBOutlet weak var passengerPhone: UILabel!
    @IBOutlet weak var passengerStars: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let listBooking = BookingListController()
        listBooking.getBookingDetail(idDetail: idDetail!){BookRes in
        for i in stride(from: 0, to:BookRes.count , by: 1) {
            }
            self.driverLabel?.text = NSLocalizedString("driver", comment: "")
            self.passengerLabel?.text = NSLocalizedString("passenger", comment: "")
            switch BookRes[2] {
            case "0":
                self.statusText?.text = NSLocalizedString("looking_for_driver", comment: "")
                break
            case "1":
                self.statusText?.text = NSLocalizedString("driver_en_route", comment: "")
                break
                
            case "2":
                self.statusText?.text = NSLocalizedString("waiting_for_passenger", comment: "")
                break
            case "3":
                self.statusText?.text = NSLocalizedString("passenger_on_board", comment: "")
                break
                
            case "4":
                self.statusText?.text = NSLocalizedString("finished_by_driver", comment: "")
                break
            case "100":
                self.statusText?.text = NSLocalizedString("canceled_by_driver", comment: "")
                break
            case "102":
                self.statusText?.text = NSLocalizedString("canceled_by_passenger", comment: "")
                break
            case "101":
                self.statusText?.text = NSLocalizedString("expred", comment: "")
                break
            default:
                self.statusText?.text = ""
                break
            }
            self.addressText?.text = BookRes[0]
            self.distanceText?.text = BookRes[1]
            self.priceText?.text = "$\(BookRes[3])"
            self.driverName?.text = "\(BookRes[4])"
            self.driverPhone?.text = "\(BookRes[5])"
            self.driverStars?.text = "★: \(BookRes[6])"
            self.passengerName?.text = "\(BookRes[8])"
            self.passengerPhone?.text = "\(BookRes[9])"
            self.passengerStars?.text = "★: \(BookRes[10])"
            do {
                let url = URL(string: BookRes[7])
                let data = try Data(contentsOf: url!)
                self.driverImage.image = UIImage(data: data)
            }
            catch{
                print(error)
            }
            do {
                let url = URL(string: BookRes[11])
                let data = try Data(contentsOf: url!)
                self.passengerImage.image = UIImage(data: data)
            }
            catch{
                print(error)
            }
        }
    }
}
