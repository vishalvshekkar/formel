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
    
    let viewModel = ViewModel()
    var dataSource = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerReusableViews(tableView)
        dataSource = setupDataSource()
    }
    
    func reloadView() {
        dataSource = setupDataSource()
        tableView.reloadData()
    }
    
    func createTestVC() {
        //Here the storyboard is alive as long as this function is being executed.
        let storyboard = UIStoryboard.instantiateStoryboardOfType(.Main)
        let testVC = storyboard?.instantiateViewController(TestViewController)
        
        //Here, the scope of the storyboard instance is not present within this function. It's already deallocated.
        let darshansTestVC: TestViewController? = UIStoryboard.StoryboardType.Main.instantiateViewController()
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

//MARK: - UI
extension UILogic {
    
    struct Section {
        var header: HeaderType
        var cells: [CellType]
        var footer: FooterType
    }
    
    private func registerReusableViews(tableView: UITableView) {
        tableView.registerReusableCell(ImagesCell)
    }
    
    private func setupDataSource() -> [Section] {
        var sections = [Section]()
        
        //Section 0
        var sectionZeroCells = [CellType]()
        if viewModel.isSocialConnectionPresent()
        {
            sectionZeroCells.append(.Social)
        }
        if viewModel.isDescriptionPresent()
        {
            sectionZeroCells.append(.Description)
        }
        sections.append(Section(header: .NoHeader, cells: sectionZeroCells, footer: .Button))
        
        //Section 1
        
        if viewModel.isMusicPresent()
        {
            sections.append(Section(header: .Plain, cells: [.Music], footer: .Button))
        }
        //.
        //.
        //.
        //Section x
        if viewModel.isEquipmentPresent()
        {
            sections.append(Section(header: .Plain, cells: [.Equipment], footer: .Button))
        }
        
        return sections
    }
    
    
    enum HeaderType {
        case Plain
        case Button
        case NoHeader
        
        func getheaderView() -> UITableViewHeaderFooterView {
            var headerView: UITableViewHeaderFooterView
            switch self {
            case Plain:
                headerView = UITableViewHeaderFooterView()
            case Button:
                headerView = UITableViewHeaderFooterView()
            case NoHeader:
                headerView = UITableViewHeaderFooterView()
            }
            return headerView
        }
        
    }
    
    enum CellType {
        case Social
        case Equipment
        case Description
        case Music
        case Review
        
        func getCell(tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell {
            var cellType: UITableViewCell
            switch self {
            case Social:
//                let cell = tableView.dequeueReusableCellWithIdentifier(<#T##identifier: String##String#>, forIndexPath: <#T##NSIndexPath#>) as? ImagesCell
                let cell: ImagesCell = tableView.dequeueReusableCell(indexPath: indexPath)
                cellType = cell
            case Equipment:
                cellType = UITableViewCell()
            case Description:
                cellType = UITableViewCell()
            case Music:
                cellType = UITableViewCell()
            case Review:
                cellType = UITableViewCell()
            }
            return cellType
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