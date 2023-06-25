//
//  FoodCell.swift
//  TestTask
//
//  Created by Влад Тимчук on 16.06.2023.
//

import UIKit
import SnapKit

class FoodCell: UITableViewCell {

    static let identifier = "FoodCell"
    private let separator = UIView()
    private let backroundCircleView = UIView()
    private let iconView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        // separator
        separator.backgroundColor = .separator
        contentView.addSubview(separator)
        
        // textLabel
        textLabel?.font = UIFont(name: "FixelText-Medium", size: 16)
        textLabel?.textColor = UIColor(hex: "#222631")

        // detailTextLabel
        detailTextLabel?.font = UIFont(name: "FixelText-Medium", size: 12)
        detailTextLabel?.textColor = UIColor(hex: "#8C94A6")
        
        // leftView
        backroundCircleView.frame = CGRect(x: 16, y: 14, width: 32, height: 32)
        backroundCircleView.backgroundColor = UIColor(hex: "#F5F7FA")
        backroundCircleView.layer.cornerRadius = backroundCircleView.frame.width / 2
        contentView.addSubview(backroundCircleView)
        backroundCircleView.addSubview(iconView)
        let iconImage = UIImage(named: "Fork-Spoon")
        iconView.image = iconImage
        
        //MARK: - Layout
        
        separator.snp.makeConstraints { make in
            make.height.equalTo(1/UIScreen.main.scale)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview().offset(70)
        }
        
        backroundCircleView.snp.makeConstraints { make in
            make.width.height.equalTo(32)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(16)
        }
        
        textLabel?.snp.makeConstraints({ make in
            make.top.equalToSuperview().offset(10)
            make.left.equalTo(backroundCircleView.snp.right).offset(12)
            make.height.equalTo(24)
            make.width.equalTo(67)
        })
        
        detailTextLabel?.snp.makeConstraints({ make in
            make.top.equalToSuperview().offset(34)
            make.left.equalTo(backroundCircleView.snp.right).offset(12)
            make.height.equalTo(16)
            make.width.equalTo(83)
        })
        
        iconView.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.width.equalTo(20)
            make.left.equalToSuperview().offset(6)
            make.top.equalToSuperview().offset(6)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func chooseTextForCell(cell: FoodCell, indexPath: IndexPath) {
        cell.textLabel?.text = Food.foodList[indexPath.row].name
        cell.detailTextLabel?.text = "\(Food.foodList[indexPath.row].weight)г, \(Food.foodList[indexPath.row].calories) ккал"
        let accessoryLabel = UILabel()
        accessoryLabel.text = "\(Food.foodList[indexPath.row].addedDate)"
        accessoryLabel.font = UIFont(name: "FixelText-Medium", size: 12)
        accessoryLabel.textColor = UIColor(hex: "#8C94A6")
        accessoryLabel.sizeToFit()
        cell.accessoryView = accessoryLabel
    }
    
    func cellStyle(indexPath: IndexPath) {
        if indexPath.row == 0 {
            // First cell in section
            roundCorners([.topLeft, .topRight], radius: 16)
            showSeparator()
        } else if indexPath.row == 1 {
            // Last cell in section
            roundCorners([.bottomLeft, .bottomRight], radius: 16)
            hideSeparator()
        }
    }
    
    func hideSeparator() {
        separator.isHidden = true
    }
    
    func showSeparator() {
        separator.isHidden = false
    }
    
}
