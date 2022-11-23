// CalendarHomeDateCell.swift
// FunnyPuny. Created by Zlata Guseva.

import JTAppleCalendar
import SnapKit
import UIKit

// MARK: - CalendarHomeDateCell

class CalendarHomeDateCell: JTACDayCell {
    private var dayOfWeekLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textPrimary
        label.font = .regular14
        label.backgroundColor = .backgroundGlobe
        label.textAlignment = .center
        label.layer.cornerRadius = 9
        return label
    }()

    private var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textPrimary
        label.font = .regular12
        label.backgroundColor = .backgroundGlobe
        label.layer.borderColor = UIColor.backgroundBoarder?.cgColor
        label.layer.borderWidth = 1
        label.textAlignment = .center
        label.layer.cornerRadius = 20
        label.clipsToBounds = true
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        addSubviews()
        makeConstraints()
    }

    private func addSubviews() {
        addSubview(dayOfWeekLabel)
        addSubview(dateLabel)
    }

    private func makeConstraints() {
        dayOfWeekLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.size.equalTo(20)
        }

        dateLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
            make.size.equalTo(40)
        }
    }
}

// MARK: Configurable

extension CalendarHomeDateCell: Configurable {
    func configure(with viewModel: CalendarCellViewModel) {
        dateLabel.text = viewModel.date.string(dateFormat: .formatdd)
        dayOfWeekLabel.text = viewModel.date.string(dateFormat: .formatEEEEE)
        dayOfWeekLabel.textColor = viewModel.date.isToday ? .textPrimary : .textSecondary
        dateLabel.layer.borderColor = viewModel.date.isToday
            ? UIColor.backgroundAccent?.cgColor
            : UIColor.backgroundBoarder?.cgColor
        dateLabel.backgroundColor = viewModel.backgroundColor
    }
}
