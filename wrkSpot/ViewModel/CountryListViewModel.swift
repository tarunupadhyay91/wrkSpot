//
//  CountryListViewModel.swift
//  wrkSpot
//
//  Created by Tarun Upadhyay on 21/03/25.
//

import Foundation
protocol dataProtocol{
    func dataReceived()
}
class CountryListViewModel {
    
    let networkManagerObj = NetworkManager()
    var responseModel:[country]?
    var filteredArray = [country]()
    var delegate:dataProtocol?
    func getCountryList(){
        networkManagerObj.countryListdetails { response,data  in
            print("response receive",response)
            if response == true {
                self.getCountry(data: data)
            }
        }
    }
    
    func getCountry(data:Data?){
            let jsonDecoder = JSONDecoder()
        responseModel = try! jsonDecoder.decode([country].self, from: data!)
        filteredArray = responseModel!
        delegate?.dataReceived()
    }
    
    func getFilteredArray(value:Int){
        filteredArray.removeAll()
        
        for item in responseModel! {
            if (item.population ?? 0) < value {
                filteredArray.append(item)
                print(item.name!)
            }
        }
        delegate?.dataReceived()
    }
    
    func getDateAndTime()->String {
        let currentDate = Date()

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMM HH:mm a "
        let formattedDate = dateFormatter.string(from: currentDate)
        
        let currentTimeZone = TimeZone.current
        
        print(formattedDate, currentTimeZone.abbreviation()!)
        return formattedDate + currentTimeZone.abbreviation()!
    }
}

