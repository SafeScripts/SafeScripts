//
//  ReminderCell.swift
//  SafeScripts
//
//  Created by Chad Brady on 10/27/18.
//  Copyright © 2018 SafeScripts. All rights reserved.
//

import UIKit

public class ReminderCell: UITableViewCell {
    
    let textView = UITextView()
    let timeView = UITextView()
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(textView)
        contentView.addSubview(timeView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureCell(viewModel: PillBoxReminderViewModel) {
        textView.text = viewModel.medicationName
        textView.textColor = .black
        textView.font = UIFont.systemFont(ofSize: 16)
        
        timeView.text = viewModel.timeOfDay
        timeView.textColor = .gray
        timeView.font = UIFont.systemFont(ofSize: 16)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        _ = sizeThatFits(bounds.size)
    }
    
    public override func sizeThatFits(_ size: CGSize) -> CGSize {
        var cellSize = CGSize.zero
        
        var textViewFrame = CGRect.zero
        textViewFrame.origin.x = 12
        textViewFrame.origin.y = 12
        textViewFrame.size = textView.sizeThatFits(size)
        
        cellSize.width = size.width
        cellSize.height = textViewFrame.maxY + 12
        
        textView.frame = textViewFrame
        
        var timeFrame = CGRect.zero
        timeFrame.size = timeView.sizeThatFits(size)
        timeFrame.origin.x = size.width - timeFrame.width - 12
        timeFrame.origin.y = 12
        
        timeView.frame = timeFrame
        
        return cellSize
    }
    
}
