//
//  SelectedFoodCell.swift
//  TestTask
//
//  Created by Влад Тимчук on 24.06.2023.
//

import UIKit
import SnapKit

class SelectedFoodCell: UITableViewCell {

    static let identifier = "SelectedFoodCell"
    private let separator = UIView()
    private let backroundCircleView = UIView()
    private let iconView = UIImageView()
    private let backroundCircleViewSmall = UIView()
    private let iconViewSmall = UIImageView() // create heart and backround circle
    
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
        
        // leftViewSmall
        backroundCircleViewSmall.frame = CGRect(x: 22, y: 2, width: 12, height: 12)
        backroundCircleViewSmall.backgroundColor = UIColor(hex: "#F94A39")
        backroundCircleViewSmall.layer.cornerRadius = backroundCircleViewSmall.frame.width / 2
        backroundCircleView.addSubview(backroundCircleViewSmall)
        backroundCircleViewSmall.addSubview(iconViewSmall)
        let iconImageSmall = UIImage(named: "heart-checkmark")
        iconViewSmall.image = iconImageSmall
        
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
        
        iconView.snp.makeConstraints { make in
            make.height.width.equalTo(20)
            make.left.top.equalToSuperview().offset(6)
        }
        
        backroundCircleViewSmall.snp.makeConstraints { make in
            make.width.height.equalTo(12)
            make.left.equalTo(20)
        }
        
        iconViewSmall.snp.makeConstraints { make in
            make.height.width.equalTo(8)
            make.left.top.equalToSuperview().offset(2)
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
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func chooseTextForCell(cell: SelectedFoodCell, indexPath: IndexPath) {
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
        } else if indexPath.row == Food.foodList.count - 1 {
            // Last cell in section
            roundCorners([.bottomLeft, .bottomRight], radius: 16)
            hideSeparator()
        } else {
            // Middle cells
            roundCorners([], radius: 0)
            showSeparator()
        }
    }
    
    func hideSeparator() {
        separator.isHidden = true
    }
    
    func showSeparator() {
        separator.isHidden = false
    }
    
}
