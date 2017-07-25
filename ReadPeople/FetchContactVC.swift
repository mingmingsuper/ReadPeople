//
//  FetchContactVC.swift
//  ReadPeople
//
//  Created by liumingming on 2017/7/14.
//  Copyright © 2017年 LMM. All rights reserved.
//

import UIKit
import Contacts

class FetchContactVC: UIViewController
{
    @IBOutlet weak var mTableView: UITableView!
    
    var mContacts:[CNContact] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setupUI()
        self.authorization()
    }
    
    func setupUI()
    {
        mTableView.dataSource = self
        mTableView.delegate = self
        mTableView.estimatedRowHeight = 50
    }
    
    func authorization()
    {
        //获取授权状态
        let status = CNContactStore.authorizationStatus(for: .contacts)
        if status == .notDetermined
        {
            //创建通讯录对象
            let store = CNContactStore()
            
            //请求授权
            store.requestAccess(for: .contacts, completionHandler: { (result, error) in
                if result
                {
                    print("授权成功")
                }
                else
                {
                    print("授权失败\(error.debugDescription)")
                }
            })
        }

    }
    
    
    @IBAction func fetchClick(_ sender: Any)
    {
        loadData()
    }
    
    func loadData()
    {
        let status = CNContactStore.authorizationStatus(for: .contacts)
        guard status == .authorized else { return }
        let store = CNContactStore()
        
        let keys = [CNContactFamilyNameKey,CNContactGivenNameKey,CNContactPhoneNumbersKey]
        
        let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
        do
        {
            try store.enumerateContacts(with: request, usingBlock: { [weak self] (contact, stop) in
                self?.mContacts.append(contact)
            })
        }
        catch
        {
            
        }
        self.mTableView.reloadData()
    }

}


extension FetchContactVC:UITableViewDelegate,UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mContacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contact", for: indexPath) as! ContactCell
        let contact = mContacts[indexPath.row]
        cell.mNameLabel.text = contact.familyName + contact.givenName
        cell.mPhoneLabel.text = contact.phoneNumbers.reduce("", { (phones, phoneNumber) -> String in
            return phones + phoneNumber.value.stringValue
        })
        return cell
    }
}
