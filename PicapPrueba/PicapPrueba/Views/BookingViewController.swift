//
//  ViewController.swift
//  PicapPrueba
//
//  Created by Leonel Alfonso on 1/18/19.
//  Copyright © 2019 Leonel Alfonso. All rights reserved.
//

import UIKit

class BookingViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    var BookingsArray: [Booking] = []
    var sender: String = ""
    var Sender: String = ""
    var flagList: Int = 0
    var pageControl: Int = 1
    var flagControl:Bool = false
    
    @IBOutlet weak var nextButton: UIButton!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            as! HeadlineTableViewCellController
        
        if(flagControl == false){
        let listBooking = BookingListController()
        
        listBooking.getBookingList(page: pageControl){BookRes in
            
            self.BookingsArray = BookRes
            
            cell.StatusTitle?.text = NSLocalizedString("status", comment: "")
            
            
            switch self.BookingsArray[self.flagList].status {
            case "0":
                cell.statusText?.text = NSLocalizedString("looking_for_driver", comment: "")
                break
            case "1":
                cell.statusText?.text = NSLocalizedString("driver_en_route", comment: "")
                break
                
            case "2":
                cell.statusText?.text = NSLocalizedString("waiting_for_passenger", comment: "")
                break
            case "3":
                cell.statusText?.text = NSLocalizedString("passenger_on_board", comment: "")
                break
                
            case "4":
                cell.statusText?.text = NSLocalizedString("finished_by_driver", comment: "")
                break
            case "100":
                cell.statusText?.text = NSLocalizedString("canceled_by_driver", comment: "")
                break
            case "102":
                cell.statusText?.text = NSLocalizedString("canceled_by_passenger", comment: "")
                break
            case "101":
                cell.statusText?.text = NSLocalizedString("expred", comment: "")
                break
            default:
                cell.statusText?.text = ""
                break
            }
            
            
            if(self.BookingsArray[self.flagList].name == "null"){
                cell.BookingTitle?.text = ""
            }
            else{
                 cell.BookingTitle?.text = self.BookingsArray[self.flagList].name
            }
           
            
            if(self.BookingsArray[self.flagList].plate == "null"){
                cell.DriverTitle?.text = ""
            }
            else{
                cell.DriverTitle?.text = self.BookingsArray[self.flagList].plate
            }
            
            
            if(self.BookingsArray[self.flagList].address == "null"){
                cell.AddressTitle?.text = ""
            }
            else{
                cell.AddressTitle?.text = self.BookingsArray[self.flagList].address
            }
            
            if(self.BookingsArray[self.flagList].price == "null"){
                cell.PriceTitle?.text = ""
            }
            else{
                cell.PriceTitle?.text = "$\(self.BookingsArray[self.flagList].price)"
            }

            do {
                let url = URL(string: self.BookingsArray[self.flagList].photo)
                let data = try Data(contentsOf: url!)
                cell.PhotoDriver.image = UIImage(data: data)
            }
            catch{
                print(error)
            }
            
            
            
            self.flagList = self.flagList + 1
            if (self.flagList == 20){
                self.flagList = 0
                self.flagControl = true

            }
            
            
            
            }
        }
        else{
            
            switch self.BookingsArray[self.flagList].status {
            case "0":
                cell.statusText?.text = NSLocalizedString("looking_for_driver", comment: "")
                break
            case "1":
                cell.statusText?.text = NSLocalizedString("driver_en_route", comment: "")
                break
                
            case "2":
                cell.statusText?.text = NSLocalizedString("waiting_for_passenger", comment: "")
                break
            case "3":
                cell.statusText?.text = NSLocalizedString("passenger_on_board", comment: "")
                break
                
            case "4":
                cell.statusText?.text = NSLocalizedString("finished_by_driver", comment: "")
                break
            case "100":
                cell.statusText?.text = NSLocalizedString("canceled_by_driver", comment: "")
                break
            case "102":
                cell.statusText?.text = NSLocalizedString("canceled_by_passenger", comment: "")
                break
            case "101":
                cell.statusText?.text = NSLocalizedString("expred", comment: "")
                break
            default:
                cell.statusText?.text = ""
                break
            }
            
            if(self.BookingsArray[self.flagList].name == "null"){
                cell.BookingTitle?.text = ""
            }
            else{
                cell.BookingTitle?.text = self.BookingsArray[self.flagList].name
            }
            
            
            if(self.BookingsArray[self.flagList].plate == "null"){
                cell.DriverTitle?.text = ""
            }
            else{
                cell.DriverTitle?.text = self.BookingsArray[self.flagList].plate
            }
            
            
            if(self.BookingsArray[self.flagList].address == "null"){
                cell.AddressTitle?.text = ""
            }
            else{
                cell.AddressTitle?.text = self.BookingsArray[self.flagList].address
            }
            
            if(self.BookingsArray[self.flagList].price == "null"){
                cell.PriceTitle?.text = ""
            }
            else{
                cell.PriceTitle?.text = "$\(self.BookingsArray[self.flagList].price)"
            }
            
            
            
            self.flagList = self.flagList + 1
            if (self.flagList == 20){
                self.flagList = 0
               
                
            }
            
        }
           
        
           
        
         return cell
      
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nextButton?.setTitle( NSLocalizedString("next_text", comment: ""), for: .normal)
     
   
       
        
    }
     func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        Sender = "\(self.BookingsArray[indexPath.row+1].id)"
        self.performSegue(withIdentifier: "toDetail", sender: sender)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let dvc = segue .destination as! UINavigationController
            
            if let chidVC = dvc.topViewController as? DetailViewController {
                chidVC.idDetail = Sender
                
                
            }
        }
    }
    

    @IBAction func nextPage(_ sender: Any) {
        pageControl = pageControl + 1
    }
}
