//
//  CustomView.swift
//  BarGraphCustomUsingTableView
//
//  Created by Sandhya Kollati on 06/09/22.
//

import Foundation
import UIKit

class CustomView : UIView, UITableViewDelegate, UITableViewDataSource {
    
    var dataArray :[BarChartValues] = []
    var salesValues : [Int] = []
    var minValue : Int = 1
    var maxValue : Int = 100
    var rangeValuesArray : [Int] = []
    
    let tableview = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createTableView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createTableView()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let label  = UILabel()
        label.text = "Months"
        label.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        label.frame = CGRect(x: 0, y: frame.height/2 - 30, width: 20, height: 60)
        addSubview(label)
        
        let myview = UIView(frame: CGRect(x: 0, y: frame.height - 120 , width: frame.width, height: 150))
        addSubview(myview)
        
        let firstStack = creatingImageView(color: .yellow,  width: myview.frame.width / 3, text: "Correct answers")
        let secondStack = creatingImageView(color: .blue,  width: myview.frame.width / 3, text: "Incorrect Answers")
        let thirdStack = creatingImageView(color: .red,  width: myview.frame.width / 3, text: "Skipped Visited")
        
        let stackview = UIStackView(arrangedSubviews: [firstStack,secondStack,thirdStack])
        stackview.distribution = .fillEqually
        stackview.frame = CGRect(x: 0, y: 10, width: myview.frame.width, height: 15)
        stackview.spacing = 4.5
        stackview.clipsToBounds = true
        myview.addSubview(stackview)
        
        let secondFirstLabel = creatingImageView(color: .gray, width: myview.frame.width / 3, text: "partially Correct")
        
        let secondSecondLabel = creatingImageView(color: .green, width: myview.frame.width / 3, text: "skipped Not Visited")
        
        let secondStackview = UIStackView(arrangedSubviews: [secondFirstLabel,secondSecondLabel])
        secondStackview.distribution = .fill
        secondStackview.frame = CGRect(x: 0, y: 45, width: myview.frame.width, height: 15)
        secondStackview.spacing = 2.0
        secondStackview.clipsToBounds = true
        myview.addSubview(secondStackview)
        
    }
    func createTableView()
    {
        
        tableview.delegate = self
        tableview.dataSource = self
        tableview.backgroundColor = .black
        tableview.separatorStyle = .none
        tableview.showsVerticalScrollIndicator = false
        addSubview(tableview)
        
        
        tableview.translatesAutoresizingMaskIntoConstraints = false
        
        tableview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        tableview.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableview.topAnchor.constraint(equalTo: topAnchor,constant: 50).isActive = true
        tableview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -120).isActive = true
        

       
        
        let createPostNib = UINib(nibName: "TableViewCell", bundle: nil)
        tableview.register(createPostNib, forCellReuseIdentifier: "cell")
        
        
        
        
    }
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.dataLabel.text = dataArray[indexPath.row].month
        cell.widthConstr.constant = translateWidthValueToXPosition(value: Float(dataArray[indexPath.row].salesValue) / Float(100.0))
        cell.dataView.backgroundColor = dataArray[indexPath.row].barColour
        cell.mainImageView.backgroundColor = .darkGray
        cell.secondImageView.backgroundColor = dataArray[indexPath.row].salesValueColour
        cell.callback = { cell in
            guard let index = tableView.indexPath(for: cell) else{
                return
            }
            print(index)
        }
        return cell
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: 60))
        
        let verticalLineView = UIView(frame: CGRect(x: 51 , y: 0, width: 1, height: headerView.frame.height))
        verticalLineView.backgroundColor = .black
        headerView.addSubview(verticalLineView)
        
        let label = UILabel(frame: CGRect(x: 150, y: 0, width: headerView.frame.width, height: 20))
        label.text = "Sales Value"
        headerView.addSubview(label)
        
        
        let firstLabel = creatingLabels(text: String(rangeValuesArray[0]), width: 20, alignment: .center)
        
        
        let secondLabel = creatingLabels(text: String(rangeValuesArray[1]), width: 20, alignment: .center)
        
        
        let thirdLabel = creatingLabels(text: String(rangeValuesArray[2]), width: 20, alignment: .center)
        
        
        
        let fourthLabel = creatingLabels(text: String(rangeValuesArray[3]), width: 20, alignment: .center)
        
        
        let fifthLabel = creatingLabels(text: String(rangeValuesArray[4]), width: 20, alignment: .center)
        
        
        let stackview = UIStackView(arrangedSubviews: [firstLabel,secondLabel,thirdLabel,fourthLabel,fifthLabel])
        stackview.contentMode = .center
        stackview.axis = .horizontal
        stackview.spacing = 0
        stackview.distribution = .fillEqually
        stackview.frame = CGRect(x: 52, y: 25, width: headerView.frame.width - 71, height: 25)
        stackview.clipsToBounds = true
        headerView.addSubview(stackview)
        print("sandhya",stackview.frame.width)
        
        let secondFirstLabel = creatingLabels(text: "|", width: 20, alignment: .center)
       
        
        let secondSecondLabel = creatingLabels(text: "|", width: 20, alignment: .center)
        
        
        let secondThirdLabel = creatingLabels(text: "|", width: 20, alignment: .center)
        
        
        let secondFourthLabel = creatingLabels(text: "|", width: 20, alignment: .center)
        
        
        let secondFifthLabel = creatingLabels(text: "|", width: 20, alignment: .center)
        
        
        let secondStackview = UIStackView(arrangedSubviews:[secondFirstLabel,secondSecondLabel,secondThirdLabel,secondFourthLabel,secondFifthLabel] )
        secondStackview.axis = .horizontal
        secondStackview.frame = CGRect(x: 52, y: 50 , width: headerView.frame.width - 75, height: 11)
        secondStackview.distribution = .fillEqually
        headerView.addSubview(secondStackview)
        
        
        let horizontalLineView = UIView(frame: CGRect(x: 0, y: 60, width: headerView.frame.width, height: 1))
        horizontalLineView.backgroundColor = .black
        headerView.addSubview(horizontalLineView)
        
        headerView.backgroundColor = .white
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    private func translateWidthValueToXPosition(value : Float) -> CGFloat {
        let width = CGFloat(value) * (frame.width - 92)
        return abs(width)
    }
    private func creatingLabels(text : String , width : CGFloat ,alignment : NSTextAlignment) -> UILabel{
        let label = UILabel()
        label.widthAnchor.constraint(equalToConstant: width).isActive = true
        label.heightAnchor.constraint(equalToConstant: 10).isActive = true
        label.text = text
        label.textAlignment = alignment
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = UIColor.darkGray
        return label
    }
    private func creatingImageView(color : UIColor  , width : CGFloat,text : String) -> UIStackView
    {
        let label = UILabel()
        label.widthAnchor.constraint(equalToConstant: 35).isActive = true
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
        label.text = text
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.textColor = UIColor.darkGray
        
        let imageview = UIImageView()
        imageview.backgroundColor = color
        imageview.heightAnchor.constraint(equalToConstant: 15).isActive = true
        imageview.widthAnchor.constraint(equalToConstant: 15).isActive = true
        imageview.layer.cornerRadius = 7.0
        
        let stackView = UIStackView(arrangedSubviews: [imageview , label])
        stackView.axis = .horizontal
        stackView.widthAnchor.constraint(equalToConstant: width).isActive = true
        stackView.spacing = 4.0
        stackView.distribution = .fill
        return stackView
    }
}
