//
//  LanguagesViewController.swift
//  WeatherDemo
//
//  Created by VDima Tsurkan on 9/22/17.
//  Copyright © 2017 Dima Tsurkan. All rights reserved.
//

import UIKit

class LanguagesViewController: UIViewController {

    let tableView = UITableView()
    let languages = [dynamicLocalizableString("English"),
                     "German",
                     "Hindi",
                     "Italian",
                     "Japanese",
                     dynamicLocalizableString("Russian")]
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureTable()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.localizeUI),
                                               name: NSNotification.Name(rawValue:DynamicLanguageServiceDidDetectLanguageSwitchNotificationKey),
                                               object: nil)

    }
    
    // MARK: - Internal
    
    private func configureView() {
        navigationItem.title = dynamicLocalizableString("Select language")
        view.backgroundColor = UIColor(red: 240/255, green: 239/255, blue: 244/255, alpha: 1)
    }
    
    private func configureTable() {
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        self.view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func selectLanguage(at index: Int) {
        if index == 0 {
            LanguageService.service.switchToLanguage(.en)
        } else if index == 5 {
            LanguageService.service.switchToLanguage(.ru)
        }
    }

}

extension LanguagesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectLanguage(at: indexPath.row)
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
}

extension LanguagesViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.accessoryType = cell.isSelected ? .checkmark : .none
        cell.selectionStyle = .none
        cell.textLabel?.text = languages[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
}

// MARK: - Localizable
extension LanguagesViewController: Localizable {
    
    @objc func localizeUI() {
        navigationItem.title = dynamicLocalizableString("Select language")
        navigationItem.backBarButtonItem?.title = dynamicLocalizableString("Settings")
        tableView.reloadData()
    }
}
