//
//  ViewController.swift
//  TestTask
//
//  Created by Влад Тимчук on 12.06.2023.
//

import SnapKit
import UIKit

//MARK: - AddMealViewController
final class AddMealViewController: UIViewController {
    
    //MARK: - Private Property
    private let navigationBar = UINavigationBar()
    private let tableView = UITableView()
//    private let header = UIView()
    
    private let whiteView = UIView()
    private let exitButton = UIButton(type: .system)
    private let infoButton = UIButton(type: .system)
    private let nextViewButton = UIButton(type: .custom)
    private let upperText = UILabel()
    private let lowerText = UILabel()
    private let searchBar = SearchBar(placeholder: "Пошук")
    private let segmentControl = UISegmentedControl(items:["Пошук","Обране","Мої блюда"])
    
    private let searchBarUI = UISearchBar()
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    //MARK: - Setup Views Methods
    
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
        
        tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.identifier)
        
        tableView.backgroundColor = .clear
        tableView.separatorInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        
//        tableView.tableHeaderView = header
        view.addSubview(tableView)
    }
    
//    private func setupHeaderUIView() {
//
//        header.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50)
//        header.backgroundColor = .yellow
//
//    }
    
    private func setupWhiteView() {
        whiteView.backgroundColor = .white
        whiteView.layer.cornerRadius = 25
        whiteView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    private func setupExitUIButton() {
        let xmarkSymbol = UIImage(systemName: "xmark")
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 11)
        exitButton.setImage(xmarkSymbol?.withConfiguration(symbolConfiguration), for: .normal)
        exitButton.tintColor = .black
    }
    
    private func setupInfoUIButton() {
        let ellipsisSymbol = UIImage(systemName: "ellipsis")
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 14)
        infoButton.setImage(ellipsisSymbol?.withConfiguration(symbolConfiguration), for: .normal)
        infoButton.tintColor = .black
    }
    
    private func setupNextViewUIButton() {
        let arrowRightSymbol = UIImage(systemName: "arrow.right")
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 32)
        nextViewButton.setImage(arrowRightSymbol?.withConfiguration(symbolConfiguration), for: .normal)
        nextViewButton.tintColor = .white
        nextViewButton.backgroundColor = .systemBlue
        nextViewButton.layer.cornerRadius = 27.5
    }
    
    private func setupTopBarText() {
        upperText.text = "ДОДАТИ ЇЖУ"
        upperText.textColor = UIColor(red: 249/255, green: 74/255, blue: 57/255, alpha: 1)
        upperText.font = UIFont(name: "FixelText-Medium", size: 12)
        
        lowerText.text = "Сніданок"
        lowerText.textColor = .black
        lowerText.font = UIFont(name: "FixelText-SemiBold", size: 20)
    }
    
    private func setupUISegmentPicker() {
        segmentControl.layer.cornerRadius = 12
        segmentControl.layer.masksToBounds = true
        segmentControl.selectedSegmentIndex = 0
        segmentControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        segmentControl.backgroundColor = UIColor(red: 245/255, green: 247/255, blue: 250/255, alpha: 1)
        segmentControl.selectedSegmentTintColor = UIColor(red: 249/255, green: 74/255, blue: 57/255, alpha: 1)
        
        //MARK: убрать разделители, скорее всего создать кастомный(уже создал в ChatGPT)
        
        let normalTextAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor(red: 140/255, green: 148/255, blue: 166/255, alpha: 1)
        ]
        segmentControl.setTitleTextAttributes(normalTextAttributes, for: .normal)

        let selectedTextAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        segmentControl.setTitleTextAttributes(selectedTextAttributes, for: .selected)
    }
    
    //MARK: - Actions
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        
    }
    
}


//MARK: - Setting Views
private extension AddMealViewController {
    func setupView() {
        view.tintColor = UIColor(red: 249/255, green: 74/255, blue: 57/255, alpha: 1)
        view.backgroundColor = UIColor(red: 245/255, green: 247/255, blue: 250/255, alpha: 1)
        
        //        setupNavigationBar()
        setupUITableView()
//        setupHeaderUIView()
        setupWhiteView()
        setupExitUIButton()
        setupInfoUIButton()
        setupNextViewUIButton()
        setupTopBarText()
        setupUISegmentPicker()
        
        addSubViews()
        
        setupLayout()
    }
}

//MARK: - Setting
private extension AddMealViewController {
    func addSubViews() {
        view.addSubview(whiteView)
        view.addSubview(exitButton)
        view.addSubview(infoButton)
        view.addSubview(nextViewButton)
        view.addSubview(upperText)
        view.addSubview(lowerText)
        view.addSubview(searchBar)
        view.addSubview(segmentControl)
    }
}

//MARK: - Layout
private extension AddMealViewController {
    func setupLayout() {
        
        whiteView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(320)
        }
        
        exitButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.left.equalToSuperview().offset(20)
        }
        
        infoButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.right.equalToSuperview().offset(-20)
        }
        
        nextViewButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(60)
            make.right.equalToSuperview().offset(-20)
            make.width.equalTo(55)
            make.height.equalTo(55)
        }
        
        upperText.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(60)
            make.left.equalToSuperview().offset(15)
        }
        
        lowerText.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(80)
            make.left.equalToSuperview().offset(15)
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(140)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(48)
        }
        
        segmentControl.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp_bottomMargin).offset(35)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(36)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(whiteView.snp_bottomMargin)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview()
        }
    }
}

extension AddMealViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension AddMealViewController: UITableViewDataSource {
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 20
//    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.identifier, for: indexPath) as? ProductCell else {
            fatalError("The TableView cold not dequeue a ProductCell in AddMealViewController")
        }
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
