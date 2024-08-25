
import UIKit

protocol NewInvestigationCellDelegate: AnyObject {
    func didTappedNewInvestigation(sender: NewInvestigationCell)
}

class NewInvestigationCell: UITableViewCell {
    static let indentifier = "NewInvestigationCell"
    
    weak var delegate: NewInvestigationCellDelegate?
    private let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let view: UIView = {
        let button = UIView()
        button.backgroundColor = .white
        button.layer.cornerRadius = 16
        
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .Montserrat.SemiBold.size(of: 14)
        label.textColor = AccentColors.blackColor
        return label
    }()
    
    private let mainTextLabel: UILabel = {
        let label = UILabel()
        label.font = .Montserrat.Regular.size(of: 12)
        label.textColor = AccentColors.blackColor
        label.numberOfLines = 0
        return label
    }()
    
    private let mainImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    @objc func viewTapped() {
        delegate?.didTappedNewInvestigation(sender: self)
    }
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        mainView.frame = contentView.bounds
    }
    
    func configureCell(with image: UIImage, title: String, and text: String) {
        titleLabel.text = title
        mainTextLabel.text = text
        mainImage.image = image
    }
    
    private func setupCell() {
        setupMainView()
        setupView()
        setupImage()
        setupTitle()
        setupText()
    }
}

private extension NewInvestigationCell {
    func setupMainView() {
        contentView.addSubview(mainView)
    }
    
    func setupView() {
        mainView.addSubview(view)
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.addGestureRecognizer(tapRecognizer)
        view.isUserInteractionEnabled = true
        setupShadow(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: mainView.topAnchor),
            view.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16),
            view.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16)
        ])
    }
    
    func setupImage() {
        view.addSubview(mainImage)
        mainImage.layer.masksToBounds = true
        mainImage.clipsToBounds = true
        mainImage.layer.cornerRadius = 16
        
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
//            mainImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            mainImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            mainImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -247/*-266*/)
            mainImage.widthAnchor.constraint(equalToConstant: 80),
            mainImage.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    func setupTitle() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: mainImage.trailingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -78)
        ])
    }
    
    func setupText() {
        view.addSubview(mainTextLabel)
        mainTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainTextLabel.leadingAnchor.constraint(equalTo: mainImage.trailingAnchor, constant: 8),
            mainTextLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            mainTextLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
//            mainTextLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16)
        ])
    }
}


