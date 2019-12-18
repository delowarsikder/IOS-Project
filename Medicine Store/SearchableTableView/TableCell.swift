//
//  TableCell.swift
//  SearchableTableView
//
//  Created by Delowar on 12/5/19.
//  Copyright © 2019 Delowar. All rights reserved.
//

import UIKit

protocol TableViewNew {
    func onClickCell(index : Int)
}

class TableCell: UITableViewCell {

    @IBOutlet var ImageView: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var rollLabel: UILabel!
    
    var cellDelegate:TableViewNew?
    var index:IndexPath?
    
    
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func viewDetails(_ sender: Any) {        cellDelegate?.onClickCell(index: index!.row)
    }
}
