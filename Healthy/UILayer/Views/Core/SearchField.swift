
import UIKit

class SearchField: UITextField {
    
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("SearchTextField error")
    }
    
    private func setupLayout() {
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.backgroundColor = .white
        self.attributedPlaceholder = NSAttributedString(
            string: "Search",
            attributes: [NSAttributedString.Key.font: UIFont.Montserrat.Regular.size(of: 14), NSAttributedString.Key.foregroundColor: AccentColors.searchColor ?? UIColor.systemFill]
        )
        self.placeholder = "Search"
        self.layer.borderColor = AccentColors.mainBlue?.cgColor
        self.font = UIFont.Montserrat.Regular.size(of: 14)
        
        let imageView = UIImageView(frame: CGRect(x: 8, y: 0, width: 28, height: 28))
        imageView.image = UIImage(resource: .magnifer)
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 8 + 28 + 4, height: 28))
        leftPaddingView.addSubview(imageView)
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height))
        self.leftView = leftPaddingView
        self.leftViewMode = .always
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
