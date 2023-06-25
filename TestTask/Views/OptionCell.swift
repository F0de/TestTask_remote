//
//  OptionCell.swift
//  TestTask
//
//  Created by Влад Тимчук on 23.06.2023.
//

import UIKit
import SnapKit

class OptionCell: UITableViewCell {
    
    static let identifier = "OptionCell"
    private let separator = UIView()
    private let iconView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        // separator
        separator.backgroundColor = .separator
        contentView.addSubview(separator)
        
        // textLabel
        textLabel?.font = UIFont(name: "FixelText-Medium", size: 16)
        textLabel?.textColor = UIColor(hex: "#222631")
        
        // leftView
        
        contentView.addSubview(iconView)
        
        //MARK: - Layout
        
        separator.snp.makeConstraints { make in
            make.height.equalTo(1/UIScreen.main.scale)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview().offset(70)
        }
        
        textLabel?.snp.makeConstraints({ make in
            make.top.equalToSuperview().offset(16)
            make.left.equalTo(iconView.snp.right).offset(16)
            make.height.equalTo(24)
            make.width.equalTo(147)
        })
        
        iconView.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.width.equalTo(24)
            make.left.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(16)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    func chooseIconForCell(indexPath: IndexPath) {
        switch indexPath.row {
        case 0: iconView.image = UIImage(named: "fire")
        case 1: iconView.image = UIImage(named: "scaner-barcode")
        default: iconView.image = UIImage(systemName: "questionmark.circle")
        }
    }
    
    func chooseTextForCell(indexPath: IndexPath) {
        switch indexPath.row {
        case 0: textLabel?.text = "Швидке додавання"
        case 1: textLabel?.text = "Сканувати"
        default: textLabel?.text = ""
        }
    }
}
