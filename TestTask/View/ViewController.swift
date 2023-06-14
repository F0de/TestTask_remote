//
//  ViewController.swift
//  TestTask
//
//  Created by Влад Тимчук on 12.06.2023.
//

import SnapKit
import UIKit

class ViewController: UIViewController {
    
    let tableView = UITableView()
    let navigationBar = UINavigationBar()
    let exitButton = UIBarButtonItem()
    let infoButton = UIButton(type: .system)
    let header = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupNavigationBar()
        setupUITableView()
        setupHeaderUIView()
        setupExitUIButton()
        setupInfoUIButton()
        
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
//        navigationBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 44)
//        
//        navigationItem.leftBarButtonItem = exitButton
//        navigationBar.setItems([navigationItem], animated: false)
//        view.addSubview(navigationBar)
    }
    
    private func setupUITableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            make.left.equalTo(view.safeAreaLayoutGuide)
            make.right.equalTo(view.safeAreaLayoutGuide)
            
//            make.top.equalToSuperview()
//            make.bottom.equalToSuperview()
//            make.leading.equalToSuperview()
//            make.trailing.equalToSuperview()
        }
        
        tableView.tableHeaderView = header
        view.addSubview(tableView)
    }
        
    private func setupHeaderUIView() {
        
        header.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 25)
        header.backgroundColor = .yellow
        
    }
    
    private func setupExitUIButton() {
        let xmarkSymbol = UIImage(systemName: "xmark")
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 12)
        exitButton.image = xmarkSymbol?.withConfiguration(symbolConfiguration)
        exitButton.style = .plain
        exitButton.target = self
//        exitButton.setTitleColor(.black, for: .normal)
        exitButton.tintColor = .black
        

//        exitButton.snp.makeConstraints { make in
//            make.left.equalToSuperview().offset(20)
//            make.centerY.equalToSuperview()
//        }
    }
    
    private func setupInfoUIButton() {
        let ellipsisSymbol = UIImage(systemName: "ellipsis")
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 12)
        infoButton.setImage(ellipsisSymbol?.withConfiguration(symbolConfiguration), for: .normal)
        infoButton.setTitleColor(.black, for: .normal)
        infoButton.tintColor = .black

        header.addSubview(infoButton)
        
        infoButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
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
        return cell
    }
    
}
