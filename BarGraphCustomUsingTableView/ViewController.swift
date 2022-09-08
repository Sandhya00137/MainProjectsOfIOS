//
//  ViewController.swift
//  BarGraphCustomUsingTableView
//
//  Created by Sandhya Kollati on 06/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    let myView = CustomView()
    var valuePerRange : Int = 0
    var someValue : Int =   0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myView.frame = CGRect(x: 10, y: 0, width: view.frame.size.width - 20 , height: view.frame.size.height)
        myView.backgroundColor = .white
        view.addSubview(myView)
       // Stackview has five labels
        valuePerRange = myView.maxValue / 5
        for _ in 1...12
        {
            let randomValue = Int.random(in: myView.minValue...myView.maxValue)
            myView.salesValues.append(randomValue)
        }
        for _ in 1...5{
            
            someValue = someValue + valuePerRange
            myView.rangeValuesArray.append(someValue)
        }
        print(myView.salesValues)
        
       }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myView.dataArray = [BarChartValues(month: "Jan", salesValue: 0, barColour: .blue, salesValueColour: .systemOrange),
                            BarChartValues(month: "Feb", salesValue: myView.salesValues[1], barColour: .red, salesValueColour: .systemBlue),BarChartValues(month: "Mar", salesValue: myView.salesValues[2], barColour: .green, salesValueColour: .systemPink)
                            ,BarChartValues(month: "Apr", salesValue: myView.salesValues[3], barColour: .brown, salesValueColour: .systemGray2)
                            ,BarChartValues(month: "May", salesValue:myView.salesValues[4], barColour:.cyan, salesValueColour: .systemYellow)
                            ,BarChartValues(month: "Jun", salesValue: myView.salesValues[5], barColour:.darkGray, salesValueColour: .systemCyan )
                            ,BarChartValues(month: "Jul", salesValue: myView.salesValues[6], barColour: .magenta, salesValueColour: .systemPink)
                            ,BarChartValues(month: "Aug", salesValue: myView.salesValues[7], barColour:  .red, salesValueColour: .systemBlue)
                            ,BarChartValues(month: "Sep", salesValue: myView.salesValues[8], barColour: .green, salesValueColour: .systemGray)
                            ,BarChartValues(month: "Oct", salesValue: myView.salesValues[9], barColour: .lightGray, salesValueColour: .systemCyan)
                            ,BarChartValues(month: "Nov", salesValue: myView.salesValues[10], barColour: .blue, salesValueColour: .systemYellow)
                            ,BarChartValues(month: "Dec", salesValue:  myView.salesValues[11], barColour: .orange, salesValueColour: .yellow)]
    }
}
    
    

