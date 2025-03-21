//
//  filterView.swift
//  wrkSpot
//
//  Created by Tarun Upadhyay on 21/03/25.
//

import UIKit
protocol btnAction{
    func btnAction(value:Int)
}
class filterView: UIView {

    var delegate:btnAction?
    convenience init() {
        self.init()
    }

    
    
    @IBAction func oneMBtnAction(_ sender: UIButton) {
        delegate?.btnAction(value: 1000000)
    }
    
    @IBAction func fiveMBtnAction(_ sender: UIButton) {
        delegate?.btnAction(value: 5000000)
    }
    @IBAction func tenMBtnAction(_ sender: UIButton) {
        delegate?.btnAction(value: 10000000)
    }
    
    
}
