//
//  ViewController.swift
//  Formel
//
//  Created by Vishal V Shekkar on 28/05/16.
//  Copyright © 2016 Vishal V. Shekkar. All rights reserved.
//

import UIKit

private typealias TableViewHandling = ViewController
private typealias UILogic = ViewController

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells(tableView)
        dataSource = setupDataSource()
    }
    
    func reloadView() {
        dataSource = setupDataSource()
        tableView.reloadData()
    }
}

extension TableViewHandling: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].cells.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return dataSource[indexPath.section].cells[indexPath.row].getCell(tableView, indexPath: indexPath)
    }
    
}

extension UILogic {
    
    private func registerCells(tableView: UITableView) {
        tableView.registerReusableCell(ImagesCell)
    }
    
    private func setupDataSource() -> [Section] {
        var sections = [Section]()
        sections.append(Section(header: .Plain, cells: [.Plain], footer: .Plain))
        return sections
    }
    
    struct Section {
        var header: HeaderType
        var cells: [CellType]
        var footer: FooterType
    }
    
    enum HeaderType {
        case Plain
        case Button
        
        func getheaderView() -> UITableViewHeaderFooterView {
            var headerView: UITableViewHeaderFooterView
            switch self {
            case Plain:
                headerView = UITableViewHeaderFooterView()
            case Button:
                headerView = UITableViewHeaderFooterView()
            }
            return headerView
        }
    }
    
    enum CellType {
        case Plain
        case Button
        
        func getCell(tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell {
            var headerView: UITableViewCell
            switch self {
            case Plain:
                let cell: ImagesCell = tableView.dequeueReusableCell(indexPath: indexPath)
                headerView = cell
            case Button:
                headerView = UITableViewCell()
            }
            return headerView
        }
    }
    
    enum FooterType {
        case Plain
        case Button
        
        func getfooterView() -> UITableViewHeaderFooterView {
            var footerView: UITableViewHeaderFooterView
            switch self {
            case Plain:
                footerView = UITableViewHeaderFooterView()
            case Button:
                footerView = UITableViewHeaderFooterView()
            }
            return footerView
        }
    }
    
}