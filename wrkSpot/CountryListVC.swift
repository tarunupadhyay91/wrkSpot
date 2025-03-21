//
//  CountryListVC.swift
//  wrkSpot
//
//  Created by Tarun Upadhyay on 21/03/25.
//

import UIKit

class CountryListVC: UIViewController,UITableViewDelegate,UITableViewDataSource,dataProtocol,btnAction {
    func btnAction(value: Int) {
        self.filterV.isHidden = !self.filterV.isHidden
        modelObj.getFilteredArray(value: value)
    }
    
    func dataReceived() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    @IBOutlet weak var filterV: UIView!
    @IBOutlet weak var dateLbl: UILabel!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    let modelObj = CountryListViewModel()
    var isFilterShow = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "CountryTableViewCell", bundle: nil), forCellReuseIdentifier: "CountryTableViewCell")
        modelObj.getCountryList()
        modelObj.delegate = self
        
        let dateStr = modelObj.getDateAndTime()
        dateLbl.text = dateStr
        
        self.navigationController?.navigationBar.isHidden = true
        let viewObj = instanceFromNib()
        viewObj.translatesAutoresizingMaskIntoConstraints = true
        
        self.filterV.bounds = viewObj.bounds
         self.filterV.addSubview(viewObj)
        self.filterV.isHidden = true
        
        viewObj.delegate = self
    }
    
    @IBAction func filterButtonPressed(_ sender: UIButton) {
        self.filterV.isHidden = !self.filterV.isHidden
    }
    
    func instanceFromNib() -> filterView {
        return UINib(nibName: "filterView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! filterView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelObj.filteredArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath) as? CountryTableViewCell else { return UITableViewCell() }
        let countryObj = modelObj.filteredArray[indexPath.row]
        cell.countryNameLbl.text = countryObj.name
        cell.capitalLbl.text = "Capital: " + (countryObj.capital ?? "")
        cell.currencyLbl.text = "Currency: " + (countryObj.currency ?? "")
        cell.populationLbl.text = "Population: " + String(countryObj.population ?? 0)
  
        if let imageUrlStr = countryObj.media?.flag{
            if imageUrlStr.isEmpty == false {
                cell.countryImage.imageFrom(url: URL(string: imageUrlStr)!)
            }
        }
            return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    

}

extension UIImageView{
  func imageFrom(url:URL){
      if url.absoluteString != ""{
    DispatchQueue.global().async { [weak self] in
        if let data = try? Data(contentsOf: url){
            if let image = UIImage(data:data){
                DispatchQueue.main.async{
                    self?.image = image
                }
            }
        }
      }
    }
  }
}
