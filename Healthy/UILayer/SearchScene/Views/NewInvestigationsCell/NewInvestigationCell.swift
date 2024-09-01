
import UIKit

protocol NewInvestigationCellDelegate: AnyObject {
    func didTappedNewInvestigation(sender: NewInvestigationCell)
}

class NewInvestigationCell: UITableViewCell {
    static let indentifier = "NewInvestigationCell"
    let cellView = CellView()
    
    weak var delegate: NewInvestigationCellDelegate?
    
    @objc func viewTapped() {
        delegate?.didTappedNewInvestigation(sender: self)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        setupCellView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        cellView.frame = contentView.bounds
    }
    
    func configureCell(with image: UIImage, title: String, and text: String) {
        cellView.titleLabel.text = title
        cellView.mainTextLabel.text = text
        cellView.mainImage.image = image
    }
}

fileprivate extension NewInvestigationCell {
    func setupCellView() {
        contentView.addSubview(cellView)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        cellView.addGestureRecognizer(tapGesture)
        cellView.isUserInteractionEnabled = true
    }
}
