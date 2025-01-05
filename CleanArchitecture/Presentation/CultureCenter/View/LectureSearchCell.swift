//
//  LectureSearchCell.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import UIKit

class LectureSearchCell: UITableViewCell {
    @IBOutlet weak var lectureTitleLabel: UILabel!
    @IBOutlet weak var lectureSubTitleLabel: UILabel!
    @IBOutlet weak var lecturePriceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension LectureSearchCell {
    func bindData(data: CultureLecture, row: Int) {
        self.lectureTitleLabel.text = data.crsNm
        self.lectureSubTitleLabel.text = data.tuition
        self.lecturePriceLabel.text = data.tuition
    }
}

