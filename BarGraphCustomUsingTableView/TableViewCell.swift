//
//  TableViewCell.swift
//  BarGraphCustomUsingTableView
//
//  Created by Sandhya Kollati on 22/08/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    var callback : ((UITableViewCell) -> Void)?
    @IBOutlet weak var dataLabel : UILabel!
    @IBOutlet weak var dataView : UIView!
    @IBOutlet weak var mainImageView : UIView!
    @IBOutlet weak var secondImageView : UIView!
    @IBOutlet weak var widthConstr : NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedOnView))
        dataView.addGestureRecognizer(tapGesture)
        mainImageView.layer.cornerRadius = 7.0
        secondImageView.layer.cornerRadius = 5.0
    }
    @objc func tappedOnView()
    {
        callback?(self)
    }
}
