//
//  ViewController.swift
//  TestTask
//
//  Created by Влад Тимчук on 12.06.2023.
//

import SnapKit
import UIKit

class ViewController: UIViewController {
    
    private let navigationBar = UINavigationBar()
    private let tableView = UITableView()
    private let header = UIView()

    private let exitButton = UIButton(type: .system)
    private let infoButton = UIButton(type: .system)
    private let nextViewButton = UIButton(type: .custom)
    private let upperText = UILabel()
    private let lowerText = UILabel()
    private let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                        
        view.tintColor = UIColor(red: 249/255, green: 74/255, blue: 57/255, alpha: 1)
        view.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
//        setupNavigationBar()
//        setupUITableView()
//        setupHeaderUIView()
        setupExitUIButton()
        setupInfoUIButton()
        setupNextViewUIButton()
        setupTopBarText()
        setupUISearchbar()
        
    }
    
    private func setupNavigationBar() {
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        let navigationItem = UINavigationItem(title: "My Screen")
//        navigationItem.leftBarButtonItem = exitButton
        
        navigationBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 44)

        navigationBar.setItems([navigationItem], animated: false)
        
        view.addSubview(navigationBar)
    }
    
    private func setupUITableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.backgroundColor = .gray
        
//        tableView.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
//            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
//            make.left.equalTo(view.safeAreaLayoutGuide.snp.left)
//            make.right.equalTo(view.safeAreaLayoutGuide.snp.right)
            
//            make.top.equalToSuperview()
//            make.bottom.equalToSuperview()
//            make.leading.equalToSuperview()
//            make.trailing.equalToSuperview()
//        }
        
        tableView.tableHeaderView = header
        view.addSubview(tableView)
    }
        
    private func setupHeaderUIView() {
        
        header.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 25)
        header.backgroundColor = .yellow
        
    }
    
    private func setupExitUIButton() {
        let xmarkSymbol = UIImage(systemName: "xmark")
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 11)
        exitButton.setImage(xmarkSymbol?.withConfiguration(symbolConfiguration), for: .normal)
        exitButton.tintColor = .black
        
        view.addSubview(exitButton)
        
        exitButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.left.equalToSuperview().offset(20)
        }
    }
    
    private func setupInfoUIButton() {
        let ellipsisSymbol = UIImage(systemName: "ellipsis")
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 14)
        infoButton.setImage(ellipsisSymbol?.withConfiguration(symbolConfiguration), for: .normal)
        infoButton.tintColor = .black

        view.addSubview(infoButton)
        
        infoButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.right.equalToSuperview().offset(-20)
        }
    }
    
    private func setupNextViewUIButton() {
        let arrowRightSymbol = UIImage(systemName: "arrow.right")
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 25)
        nextViewButton.setImage(arrowRightSymbol?.withConfiguration(symbolConfiguration), for: .normal)
        nextViewButton.tintColor = .white
        nextViewButton.backgroundColor = .systemBlue
        nextViewButton.layer.cornerRadius = 27.5
        
        view.addSubview(nextViewButton)
        
        nextViewButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(60)
            make.right.equalToSuperview().offset(-20)
            make.width.equalTo(55)
            make.height.equalTo(55)
        }
    }
    
    private func setupTopBarText() {
        upperText.text = "ДОДАТИ ЇЖУ"
        upperText.textColor = UIColor(red: 249/255, green: 74/255, blue: 57/255, alpha: 1)
        upperText.font = UIFont(name: "FixelText-Medium", size: 12)
        
        view.addSubview(upperText)
        
        upperText.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(60)
            make.left.equalToSuperview().offset(15)
        }
        
        lowerText.text = "Сніданок"
        lowerText.textColor = .black
        lowerText.font = UIFont(name: "FixelText-SemiBold", size: 20)
        
        view.addSubview(lowerText)
        
        lowerText.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(80)
            make.left.equalToSuperview().offset(15)
        }
    }
    
    private func setupUISearchbar() {
        searchBar.placeholder = "Пошук"
        searchBar.searchBarStyle = .minimal
        searchBar.setImage(UIImage(named: "search-loap"), for: .search, state: .normal)
        searchBar.searchTextField.font = UIFont(name: "FixelText-Regular", size: 14) ?? UIFont.systemFont(ofSize: 14)
        searchBar.searchTextField.textColor = UIColor(red: 140/255, green: 148/255, blue: 166/255, alpha: 1)
        // Настройка шрифта текста Placeholder
        if let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField {
            textFieldInsideSearchBar.attributedPlaceholder = NSAttributedString(string: "Пошук", attributes: [NSAttributedString.Key.font: UIFont(name: "FixelText-Regular", size: 16) ?? UIFont.systemFont(ofSize: 16)])
        }
        // Настройка цвета текста Placeholder
        if let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField {
            textFieldInsideSearchBar.attributedPlaceholder = NSAttributedString(string: "Пошук", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 140/255, green: 148/255, blue: 166/255, alpha: 1)])
        }
        
        
        view.addSubview(searchBar)
        
        searchBar.snp.makeConstraints { make in
          make.top.equalTo(view.safeAreaLayoutGuide).offset(150) // Установите необходимые вам значения
          make.leading.equalToSuperview().offset(20) // Установите необходимые вам значения
          make.trailing.equalToSuperview().offset(-20) // Установите необходимые вам значения
//          make.height.equalTo(270) // Установите необходимые вам значения
        }

    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 20.0
//    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = "Text"
        
        if indexPath.row == 0 {
            // First cell in section
            cell.roundCorners([.topLeft, .topRight], radius: 15)
        } else if indexPath.row == 2 - 1 {
            // Last cell in section
            cell.roundCorners([.bottomLeft, .bottomRight], radius: 15)
        } else {
            // Middle cells
            cell.roundCorners([], radius: 0)
        }
        
        return cell
    }
    
}

extension UIView {
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )

        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        layer.mask = maskLayer
    }
}
