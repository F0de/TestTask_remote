//
//  ProductCell.swift
//  TestTask
//
//  Created by Влад Тимчук on 16.06.2023.
//

import UIKit
import SnapKit

class ProductCell: UITableViewCell {

    static let identifier = "ProductCell"
    private let separator = UIView()
    private let backroundCircleView = UIView()
    private let iconView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
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
        
        // separator
        separator.backgroundColor = .separator
        contentView.addSubview(separator)
        
        //MARK: - Layout
        separator.snp.makeConstraints { make in
            make.height.equalTo(1/UIScreen.main.scale)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
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
    
    func hideSeparator() {
        separator.isHidden = true
    }
    
}
