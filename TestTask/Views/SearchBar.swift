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
    private let padding = UIEdgeInsets(top: 0, left: 45, bottom: 0, right: 15)
    private let paddingLeftView = UIEdgeInsets(top: 13, left: 15, bottom: 13, right: 347)
    
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
        backgroundColor = UIColor(red: 245/255, green: 247/255, blue: 250/255, alpha: 1)
        textColor = UIColor(red: 140/255, green: 148/255, blue: 166/255, alpha: 1)
        layer.cornerRadius = 12
        leftView = UIImageView(image: UIImage(named: "search-loap"))
        leftViewMode = .always
        font = UIFont(name: "FixelText-Regular", size: 16) ?? UIFont.systemFont(ofSize: 16)
        
        
        // Настройка шрифта для placeholder
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "FixelText-Regular", size: 16) ?? UIFont.systemFont(ofSize: 16),
            .foregroundColor: UIColor(red: 140/255, green: 148/255, blue: 166/255, alpha: 1)
        ]
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
    }
}
