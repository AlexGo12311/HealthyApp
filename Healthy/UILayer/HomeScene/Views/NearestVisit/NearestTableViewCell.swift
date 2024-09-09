//
//  NearestTableViewCell.swift
//  Healthy
//
//  Created by Alex Neumark on 22.08.2024.
//

import UIKit

protocol NearestTableViewCellDelegate: AnyObject {
    func didTappedReschedule()
    func didTappedCancel()
}

class NearestTableViewCell: UITableViewCell {
    //MARK: Properties
    static let identifier = "NearestTableViewCell"
    weak var delegate: NearestTableViewCellDelegate?
    
    // MARK: Views
    private let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let view: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .Montserrat.SemiBold.size(of: 16)
        label.textColor = AccentColors.blackColor
        return label
    }()
    
    private let doctorTypeLabel: UILabel = {
        let label = UILabel()
        label.font = .Montserrat.Regular.size(of: 12)
        label.textColor = AccentColors.blackColor
        label.numberOfLines = 0
        return label
    }()
    
    private let doctorImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 16
        return image
    }()
    
    private let starImage: UIImageView = {
        let star = UIImageView()
        star.image = UIImage.init(resource: .star)
        star.contentMode = .scaleAspectFill
        star.clipsToBounds = true
        return star
    }()
    
    private let raitingDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .Montserrat.Regular.size(of: 12)
        label.textColor = AccentColors.blackColor
        label.text = "Rating"
        label.numberOfLines = 0
        return label
    }()
    
    private let raitingLabel: UILabel = {
        let label = UILabel()
        label.font = .Montserrat.SemiBold.size(of: 12)
        label.textColor = AccentColors.blackColor
        label.numberOfLines = 0
        return label
    }()
    
    private let appointmentView: UIView = {
        let view = UIView()
        view.backgroundColor = AccentColors.dateViewColor
        view.layer.cornerRadius = 16
        return view
    }()
    
    private let timerImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(resource: .timer)
        return image
    }()
    
    private let calendarImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(resource: .calendar)
        return image
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .Montserrat.SemiBold.size(of: 12)
        label.textColor = AccentColors.blackColor
        label.numberOfLines = 0
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = .Montserrat.SemiBold.size(of: 12)
        label.textColor = AccentColors.blackColor
        label.numberOfLines = 0
        return label
    }()
    
    private let stack = UIStackView()
    private let resheduleButton = MainButton(appearence: .fill, title: "Reshedule")
    private let cancelButton = MainButton(appearence: .plain, title: "Cancel")
    
    @objc private func buttonTapped(_ sender: MainButton) {
        switch sender {
        case resheduleButton:
            delegate?.didTappedReschedule()
        case cancelButton:
            delegate?.didTappedCancel()
        default:
            return
        }
    }
    
//    resheduleButton.action = delegate?.didTappedReschedule
//    cancelButton.action = delegate?.didTappedCancel
//    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        mainView.frame = contentView.bounds
    }
    
    // MARK: - Cell configuration
    func configure(doctorName: String, doctorType: String, doctorPhoto: UIImage, raiting: Float16, date: String, time: String) {
        self.nameLabel.text = doctorName
        self.doctorTypeLabel.text = doctorType
        self.doctorImage.image = doctorPhoto
        self.raitingLabel.text = "\(raiting) out of 5"
        self.dateLabel.text = date
        self.timeLabel.text = time
    }
}

// MARK: - View configure
private extension NearestTableViewCell {
    func setupCell() {
        setupMainView()
        setupView()
        setupNameLabel()
        setupDoctorTypeLabel()
        setupDocotorImage()
        setupStarImage()
        setupRaitingDescriptionLabel()
        setupRaitingLabel()
        setupAppointmentView()
        setupStack()
        setupButtons()
    }
    
    func setupMainView() {
        contentView.addSubview(mainView)
    }
    
    func setupView() {
        mainView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: mainView.topAnchor),
            view.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16),
            view.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16)
        ])
    }
    
    func setupNameLabel() {
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            nameLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -194)
        ])
    }
    
    func setupDoctorTypeLabel(){
        view.addSubview(doctorTypeLabel)
        doctorTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            doctorTypeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            doctorTypeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            doctorTypeLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -178)
        ])
    }
    
    func setupDocotorImage() {
        view.addSubview(doctorImage)
        doctorImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            doctorImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            doctorImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            doctorImage.widthAnchor.constraint(equalToConstant: 80),
            doctorImage.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    func setupStarImage() {
        view.addSubview(starImage)
        starImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            starImage.topAnchor.constraint(equalTo: doctorTypeLabel.bottomAnchor, constant: 8),
            starImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            starImage.widthAnchor.constraint(equalToConstant: 32),
            starImage.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
    
    func setupRaitingDescriptionLabel() {
        view.addSubview(raitingDescriptionLabel)
        raitingDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            raitingDescriptionLabel.leadingAnchor.constraint(equalTo: starImage.trailingAnchor, constant: 4),
            raitingDescriptionLabel.topAnchor.constraint(equalTo: doctorTypeLabel.bottomAnchor, constant: 12)
        ])
    }
    
    func setupRaitingLabel(){
        view.addSubview(raitingLabel)
        raitingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            raitingLabel.leadingAnchor.constraint(equalTo: starImage.trailingAnchor, constant: 4),
            raitingLabel.topAnchor.constraint(equalTo: raitingDescriptionLabel.bottomAnchor)
        ])
    }
    
    func setupAppointmentView() {
        view.addSubview(appointmentView)
        appointmentView.addSubview(timeLabel)
        appointmentView.addSubview(timeLabel)
        
        appointmentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            appointmentView.topAnchor.constraint(equalTo: doctorImage.bottomAnchor, constant: 16),
            appointmentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            appointmentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            appointmentView.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        // Calendar image layout setup
        appointmentView.addSubview(calendarImage)
        calendarImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            calendarImage.leadingAnchor.constraint(equalTo: appointmentView.leadingAnchor, constant: 16),
            calendarImage.topAnchor.constraint(equalTo: appointmentView.topAnchor, constant: 16),
            calendarImage.bottomAnchor.constraint(equalTo: appointmentView.bottomAnchor, constant: -16),
            calendarImage.widthAnchor.constraint(equalToConstant: 16)
        ])
        
        // Date label layout setup
        appointmentView.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: calendarImage.trailingAnchor, constant: 8),
            dateLabel.topAnchor.constraint(equalTo: appointmentView.topAnchor, constant: 18),
            dateLabel.bottomAnchor.constraint(equalTo: appointmentView.bottomAnchor, constant: -18)
        ])
        
        appointmentView.addSubview(timeLabel)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            timeLabel.trailingAnchor.constraint(equalTo: appointmentView.trailingAnchor, constant: -16),
            timeLabel.topAnchor.constraint(equalTo: appointmentView.topAnchor, constant: 18),
            timeLabel.bottomAnchor.constraint(equalTo: appointmentView.bottomAnchor, constant: -18)
        ])
        
        appointmentView.addSubview(timerImage)
        timerImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            timerImage.trailingAnchor.constraint(equalTo: timeLabel.leadingAnchor, constant: -8),
            timerImage.topAnchor.constraint(equalTo: appointmentView.topAnchor, constant: 16),
            timerImage.bottomAnchor.constraint(equalTo: appointmentView.bottomAnchor, constant: -16),
            timerImage.widthAnchor.constraint(equalToConstant: 16)
        ])
        
    }
    
    func setupStack() {
        view.addSubview(stack)
        stack.axis = .horizontal
        stack.spacing = 16
        stack.distribution = .fillEqually
        stack.addArrangedSubview(resheduleButton)
        stack.addArrangedSubview(cancelButton)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: appointmentView.bottomAnchor, constant: 16),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17.5),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17.5),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16)
        ])
    }
    
    func setupButtons() {
        resheduleButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    
}
