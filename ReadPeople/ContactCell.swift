//
//  ContactCell.swift
//  ReadPeople
//
//  Created by liumingming on 2017/7/14.
//  Copyright © 2017年 LMM. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell
{
    @IBOutlet weak var mNameLabel: UILabel!
    @IBOutlet weak var mPhoneLabel: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

}
