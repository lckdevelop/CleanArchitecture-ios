//
//  LectureSearchCell.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 1/5/25.
//

import UIKit
import Domain
import CoreKit

class LectureSearchCell: UITableViewCell {
    @IBOutlet weak var lectureTitleLabel: UILabel!
    @IBOutlet weak var lectureSubTitleLabel: UILabel!
    @IBOutlet weak var lecturePriceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension LectureSearchCell {
    func bindData(data: CultureLectureEntity, row: Int) {
        self.lectureTitleLabel.text = data.crsNm
        
        if let applyCntCal = data.applyCntCal, let nickNm = data.nickNm, let timeclassinfo = data.timeclassinfo {
            self.lectureSubTitleLabel.text = "\(applyCntCal)회 | \(nickNm) | \(timeclassinfo)"
        }
        if let tuition = data.tuition {
            self.lecturePriceLabel.text = "\(tuition.numberWithCommaFormat)원"
        }
    }
}

