//
//  CountryListViewModel.swift
//  wrkSpot
//
//  Created by Tarun Upadhyay on 21/03/25.
//
class CountryListViewModel {
    
    let networkManagerObj = NetworkManager()
    func getCountryList(){
        networkManagerObj.countryListdetails()
    }
}

