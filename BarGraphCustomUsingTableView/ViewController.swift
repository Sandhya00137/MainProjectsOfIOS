//
//  ViewController.swift
//  BarGraphCustomUsingTableView
//
//  Created by Sandhya Kollati on 06/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    let myView = CustomView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myView.frame = CGRect(x: 10, y: 0, width: view.frame.size.width - 20 , height: view.frame.size.height)
        myView.backgroundColor = .white
        view.addSubview(myView)
     }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myView.dataArray = [BarChartValues(month: "1", salesValue: myView.salesValues[0], barColour: .blue, salesValueColour: .systemOrange),
                            BarChartValues(month: "2", salesValue: myView.salesValues[1], barColour: .red, salesValueColour: .systemBlue),BarChartValues(month: "3", salesValue: myView.salesValues[2], barColour: .green, salesValueColour: .systemPink)
                            ,BarChartValues(month: "4", salesValue: myView.salesValues[3], barColour: .brown, salesValueColour: .systemGray2)
                            ,BarChartValues(month: "5", salesValue:myView.salesValues[4], barColour:.cyan, salesValueColour: .systemYellow)
                            ,BarChartValues(month: "6", salesValue: myView.salesValues[5], barColour:.darkGray, salesValueColour: .systemCyan )
                            ]
        

    }
}
