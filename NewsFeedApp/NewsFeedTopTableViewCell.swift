//
//  NewsFeedTableViewCell.swift
//  NewsFeedApp
//
//  Created by babita pal on 23/07/21.
//

import UIKit

class NewsFeedTopTableViewCell: UITableViewCell {

    
    //    MARK:- Outlets
    @IBOutlet weak var viewParentView: UIView!
    @IBOutlet weak var viewLineView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblNewsText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewParentView.backgroundColor = COMMON_BACKGROUND_COLOR
        
        lblNewsText.textColor = COMMON_GREEN_COLOR
        lblNewsText.font = boldFontSize14
        
        lblDate.textColor = COMMON_SUBTITLE_COLOR
        lblDate.font = fontSize10
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
