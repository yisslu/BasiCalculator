//
//  ViewController.swift
//  BasiCalculator
//
//  Created by Diplomado on 19/10/24.
//

import UIKit

class CalculatorViewController: UIViewController {

    private var customView: CalculatorView {
        return view as! CalculatorView
    }
    
    override func loadView() {
        view = CalculatorView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.backgroundColor = .systemBackground
    }


}

