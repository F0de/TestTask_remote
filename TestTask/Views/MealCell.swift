//
//  MealCell.swift
//  TestTask
//
//  Created by Влад Тимчук on 24.06.2023.
//

import UIKit
import SnapKit

class MealCell: UITableViewCell {
    
    static let identifier = "MealCell"
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
        backroundCircleView.backgroundColor = UIColor(hex: "#2F6AFC")
        backroundCircleView.layer.cornerRadius = backroundCircleView.frame.width / 2
        contentView.addSubview(backroundCircleView)
        backroundCircleView.addSubview(iconView)
        let iconImage = UIImage(named: "coffee-cup")
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
        
        iconView.snp.makeConstraints { make in
            make.height.width.equalTo(20)
            make.left.top.equalToSuperview().offset(6)
        }
        
        textLabel?.snp.makeConstraints({ make in
            make.top.equalToSuperview().offset(10)
            make.left.equalTo(backroundCircleView.snp.right).offset(12)
            make.height.equalTo(24)
            make.width.equalTo(153)
        })
        
        detailTextLabel?.snp.makeConstraints({ make in
            make.top.equalToSuperview().offset(34)
            make.left.equalTo(backroundCircleView.snp.right).offset(12)
            make.height.equalTo(16)
            make.width.equalTo(142)
        })
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func chooseTextForCell(cell: MealCell, indexPath: IndexPath) {
        cell.textLabel?.text = "\(Meal.mealList[indexPath.row].name) - \(Meal.mealList[indexPath.row].calories) ккал"
        cell.detailTextLabel?.text = "\(Meal.mealList[indexPath.row].foodList[0]), \(Meal.mealList[indexPath.row].foodList[1]), \(Meal.mealList[indexPath.row].foodList[2])"
    }
    
    func cellStyle(indexPath: IndexPath) {
        if indexPath.row == 0 {
            // First cell in section
            roundCorners([.topLeft, .topRight], radius: 16)
            showSeparator()
        } else if indexPath.row == Meal.mealList.count - 1 {
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
