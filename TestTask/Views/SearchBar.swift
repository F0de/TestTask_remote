//
//  SearchBar.swift
//  TestTask
//
//  Created by Влад Тимчук on 15.06.2023.
//

import UIKit
import SnapKit

//MARK: - SearchBar
final class SearchBar: UITextField {
    
    //MARK: - Private Propertiy
    private let padding = UIEdgeInsets(top: 0, left: 52, bottom: 0, right: 15)
    private let paddingLeftView = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 330)
    
    //MARK: - Initializers
    init(placeholder: String) {
        super.init(frame: .zero)
        setupSearchBar(placeholder: placeholder)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Override Methods
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: paddingLeftView)
    }
    
    //MARK: - Private Methods
    private func setupSearchBar(placeholder: String) {
        backgroundColor = UIColor(hex: "#F5F7FA")
        textColor = UIColor(hex: "#8C94A6")
        layer.cornerRadius = 12
        let imageView = UIImageView(image: UIImage(named: "search-loap"))
        imageView.contentMode = .center
        let iconSize = CGSize(width: 24, height: 24)
        imageView.frame = CGRect(x: 0, y: 0, width: iconSize.width, height: iconSize.height)
        let offsetView = UIView(frame: CGRect(x: 0, y: 0, width: iconSize.width, height: iconSize.height))
        offsetView.addSubview(imageView)
        leftView = offsetView
        leftViewMode = .always
        font = UIFont(name: "FixelText-Regular", size: 16) ?? UIFont.systemFont(ofSize: 16)
        
        // Настройка шрифта для placeholder
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "FixelText-Regular", size: 16) ?? UIFont.systemFont(ofSize: 16),
            .foregroundColor: UIColor(hex: "#8C94A6")
        ]
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
    }
}
