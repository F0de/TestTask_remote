//
//  AddMealView.swift
//  TestTask
//
//  Created by Влад Тимчук on 16.06.2023.
//

import UIKit
import SnapKit
import BetterSegmentedControl

class AddMealView: UIView {
    //MARK: - Properties
    lazy var tableView = UITableView()
    lazy var whiteView = UIView()
    lazy var exitButton = UIButton(type: .system)
    lazy var infoButton = UIButton(type: .system)
    lazy var nextViewButton = UIButton(type: .custom)
    lazy var upperText = UILabel()
    lazy var lowerText = UILabel()
    lazy var searchBar = SearchBar(placeholder: "Пошук")
    lazy var segmentControl = BetterSegmentedControl()
    lazy var searchBarUI = UISearchBar()
    var numberOfRowsInSection = 2
    var numberOfSections = 2
    var headerText = "Останні продукти"
    enum Pages {
        case searchPage, selectedPage, myMealPage
    }
    var page = Pages.searchPage
    
    //MARK: - Initializers
    init() {
        super.init(frame: .zero)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup Views Methods
    
    func setupWhiteView() {
        whiteView.backgroundColor = .white
        whiteView.layer.cornerRadius = 25
        whiteView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    func setupExitUIButton() {
        let xmarkSymbol = UIImage(systemName: "xmark")
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 10)
        exitButton.setImage(xmarkSymbol?.withConfiguration(symbolConfiguration), for: .normal)
        exitButton.tintColor = .black
    }
    
    func setupInfoUIButton() {
        let ellipsisSymbol = UIImage(systemName: "ellipsis")
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 10)
        infoButton.setImage(ellipsisSymbol?.withConfiguration(symbolConfiguration), for: .normal)
        infoButton.tintColor = .black
    }
    
    func setupNextViewUIButton() {
        let arrowRightSymbol = UIImage(systemName: "arrow.right")
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 24)
        nextViewButton.setImage(arrowRightSymbol?.withConfiguration(symbolConfiguration), for: .normal)
        nextViewButton.tintColor = .white
        nextViewButton.backgroundColor = .systemBlue
        nextViewButton.layer.cornerRadius = 24
    }
    
    func setupTopBarText() {
        upperText.text = "ДОДАТИ ЇЖУ"
        upperText.textColor = UIColor(red: 249/255, green: 74/255, blue: 57/255, alpha: 1)
        upperText.font = UIFont(name: "FixelText-Medium", size: 12)
        
        lowerText.text = "Сніданок"
        lowerText.textColor = .black
        lowerText.font = UIFont(name: "FixelText-SemiBold", size: 20)
    }
    
    func setupSegmentControl() {
        segmentControl.segments = LabelSegment.segments(
            withTitles: ["Пошук", "Обране","Мої блюда"],
            normalBackgroundColor: .clear,
            normalFont: UIFont(name: "FixelText-SemiBold", size: 12),
            normalTextColor: UIColor(hex: "#8C94A6"),
            selectedFont: UIFont(name: "FixelText-SemiBold", size: 12),
            selectedTextColor: .white
        )
        segmentControl.indicatorView.backgroundColor = UIColor(hex: "#F94A39")
        segmentControl.setOptions([.backgroundColor(UIColor(hex: "#F5F7FA")), .cornerRadius(12)])
        segmentControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
    }
    
    func setupUITableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(FoodCell.self, forCellReuseIdentifier: FoodCell.identifier)
        tableView.register(OptionCell.self, forCellReuseIdentifier: OptionCell.identifier)
        tableView.register(SelectedFoodCell.self, forCellReuseIdentifier: SelectedFoodCell.identifier)
        tableView.register(MealCell.self, forCellReuseIdentifier: MealCell.identifier)
        
        tableView.backgroundColor = .clear
        tableView.headerView(forSection: 0)?.tintColor = .white
        tableView.separatorStyle = .none
    }
    
    //MARK: - Setting Views
    func setupViews() {
        tintColor = UIColor(red: 249/255, green: 74/255, blue: 57/255, alpha: 1)
        backgroundColor = UIColor(hex: "#F5F7FA")
        
        setupWhiteView()
        setupExitUIButton()
        setupInfoUIButton()
        setupNextViewUIButton()
        setupTopBarText()
        setupSegmentControl()
        setupUITableView()
        
        addSubViews()
        
        setupLayout()
    }
    
    //MARK: - Setting
    func addSubViews() {
        addSubview(whiteView)
        addSubview(exitButton)
        addSubview(infoButton)
        addSubview(nextViewButton)
        addSubview(upperText)
        addSubview(lowerText)
        addSubview(searchBar)
        addSubview(segmentControl)
        addSubview(tableView)
    }
    
    //MARK: - Layout
    func setupLayout() {
        
        whiteView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(segmentControl.snp_bottomMargin).offset(30)
        }
        
        exitButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(10)
            make.left.equalToSuperview().offset(16)
        }
        
        infoButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(15)
            make.right.equalToSuperview().offset(-20)
        }
        
        nextViewButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(51)
            make.right.equalToSuperview().offset(-20)
            make.width.equalTo(48)
            make.height.equalTo(48)
        }
        
        upperText.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(57)
            make.left.equalToSuperview().offset(15)
        }
        
        lowerText.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(73)
            make.left.equalToSuperview().offset(15)
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(nextViewButton.snp_bottomMargin).offset(31)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.height.equalTo(48)
        }
        
        segmentControl.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp_bottomMargin).offset(36)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(36)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(whiteView.snp.bottom)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview()
        }
        
        
    }
    
    //MARK: - Actions
    @objc func segmentedControlValueChanged(_ sender: BetterSegmentedControl) {
        if sender.index == 0 {
            page = Pages.searchPage
            self.numberOfSections = 2
            self.numberOfRowsInSection = 2
            self.headerText = "Останні продукти"
        } else if sender.index == 1 {
            page = Pages.selectedPage
            self.numberOfSections = 1
            self.numberOfRowsInSection = Food.foodList.count
            self.headerText = "Останні продукти"
        } else if sender.index == 2 {
            page = Pages.myMealPage
            self.numberOfSections = 1
            self.numberOfRowsInSection = Meal.mealList.count
            self.headerText = "Мої блюда"
        }
        tableView.reloadData()
    }
    
}

//MARK: - Extensions
extension AddMealView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension AddMealView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 56))
        headerView.backgroundColor = UIColor(hex: "#F5F7FA")
        
        let label = UILabel(frame: CGRect(x: 0, y: 5, width: tableView.frame.width - 30, height: 24))
        label.textColor = UIColor(hex: "#222631")
        label.font = UIFont(name: "FixelText-Medium", size: 16)
        
        if section == 0 {
            label.text = headerText
        } else {
            label.text = "Інші опції"
        }
        
        headerView.addSubview(label)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if page == Pages.searchPage {
            if indexPath.section == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: FoodCell.identifier, for: indexPath) as? FoodCell else {
                    fatalError("The TableView cold not dequeue a FoodCell in AddMealView")
                }
                cell.chooseTextForCell(cell: cell, indexPath: indexPath)
                cell.cellStyle(indexPath: indexPath)
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: OptionCell.identifier, for: indexPath) as? OptionCell else {
                    fatalError("The TableView cold not dequeue a OptionCell in AddMealView")
                }
                cell.accessoryType = .disclosureIndicator
                cell.chooseTextForCell(indexPath: indexPath)
                cell.chooseIconForCell(indexPath: indexPath)
                cell.cellStyle(indexPath: indexPath)
                return cell
            }
        } else if page == Pages.selectedPage {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SelectedFoodCell.identifier, for: indexPath) as? SelectedFoodCell else {
                fatalError("The TableView cold not dequeue a SelectedFoodCell in AddMealView")
            }
            cell.chooseTextForCell(cell: cell, indexPath: indexPath)
            cell.cellStyle(indexPath: indexPath)
            return cell
        } else if page == Pages.myMealPage {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MealCell.identifier, for: indexPath) as? MealCell else {
                fatalError("The TableView cold not dequeue a MealCell in AddMealView")
            }
            cell.accessoryType = .disclosureIndicator
            cell.chooseTextForCell(cell: cell, indexPath: indexPath)
            cell.cellStyle(indexPath: indexPath)
            return cell
        }
        return UITableViewCell()
    }
}
