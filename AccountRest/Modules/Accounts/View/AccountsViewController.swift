//
//  AccountsAccountsViewController.swift
//  AccountRest
//
//  Created by ACR on 26/09/2017.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class AccountsViewController: UIViewController, AccountsViewInput, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    var output: AccountsViewOutput!

    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func backToMainView(_ sender: UIButton) {
        output.backFromAccountsViewToMainView()
    }
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: AccountsViewInput
    func setupInitialState() {
    }
    
    func startLoading() {
        
    }
    
    
    // UITableViewdataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let nameOfSection : String = output.key(index: section){
            if  output.section(key: nameOfSection) != nil{
                return output.section(key: nameOfSection)! .count
            }
            else{
                return 0
            }
        }
        else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCellID", for: indexPath)
        if let key: String = output.key(index: indexPath.section){
            if output.section(key: key) != nil{
                let account: SWAccount = output.section(key: key)![indexPath.row]
                if let accountCell : SWAccountViewCell = cell as? SWAccountViewCell{
                    accountCell.setAccountAttributes(account: account, delegate: self.output)
                    return accountCell
                }
            }
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return output.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.output.key(index: section)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func reloadViewSection(index: Int) {
        self.tableView.reloadSections(IndexSet(integer: index), with: UITableViewRowAnimation.fade)
    }
    
    func reloadViewTable() {
        self.tableView.reloadData()
    }
    

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.output.selected(key: indexPath.section, row: indexPath.row)
    }
    //UISearchBarDelegate
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
