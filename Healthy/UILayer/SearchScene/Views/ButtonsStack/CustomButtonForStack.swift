import UIKit


enum CustomButtonStyle {
    case doctors
    case pharmacy
    case hospitals
}
class CustomButtonForStack: UIView {
    // MARK: - Views
    
    private let doctorsImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(resource: .doctorsLogo)
        return image
    }()
    
    private let pharmacyImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(resource: .pharmacyLogo)
        
        return image
    }()
    
    private let hospitalsImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(resource: .hospitalsLogo)
        return image
    }()
    
    private let buttonTitle: UILabel = {
        let label = UILabel()
        label.font = .Montserrat.Regular.size(of: 14)
        return label
    }()
    
    private let buttonStyle: CustomButtonStyle
    

    init(buttonStyle: CustomButtonStyle) {
        self.buttonStyle = buttonStyle
        super.init(frame: .zero)
        self.layer.cornerRadius = 20
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        switch buttonStyle {
        case .doctors:
            setupDoctorsButton()
        case .pharmacy:
            setupPharmacyButton()
        case .hospitals:
            setupHospitalsButton()
        }
    }
    
    // MARK: - Doctors button
    private func setupDoctorsButton () {
        self.addSubview(doctorsImage)
        doctorsImage.translatesAutoresizingMaskIntoConstraints = false
        
        // DoctorsImage constraints
        NSLayoutConstraint.activate([
            doctorsImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 36),
            doctorsImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -36),
            doctorsImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 19),
            doctorsImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -37)
        ])
        
        self.addSubview(buttonTitle)
        buttonTitle.text = "Doctors"
        buttonTitle.textColor = AccentColors.textColor
        buttonTitle.translatesAutoresizingMaskIntoConstraints = false
        
        // buttonTitle constraints
        NSLayoutConstraint.activate([
            buttonTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonTitle.topAnchor.constraint(equalTo: doctorsImage.bottomAnchor, constant: 4)
        ])

        self.backgroundColor = AccentColors.doctors
    }
    
    // MARK: - Pharmacy button
    private func setupPharmacyButton() {
        self.addSubview(pharmacyImage)
        pharmacyImage.translatesAutoresizingMaskIntoConstraints = false
        
        // DoctorsImage constraints
        NSLayoutConstraint.activate([
            pharmacyImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 36),
            pharmacyImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -36),
            pharmacyImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 19),
            pharmacyImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -37)
        ])
        
        self.addSubview(buttonTitle)
        buttonTitle.text = "Pharmacy"
        buttonTitle.textColor = AccentColors.textColor
        buttonTitle.translatesAutoresizingMaskIntoConstraints = false
        
        // buttonTitle constraints
        NSLayoutConstraint.activate([
            buttonTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonTitle.topAnchor.constraint(equalTo: pharmacyImage.bottomAnchor, constant: 4)
        ])

        self.backgroundColor = AccentColors.pharmacy
    }
    
    // MARK: - Hospitals button
    private func setupHospitalsButton() {
        self.addSubview(hospitalsImage)
        hospitalsImage.translatesAutoresizingMaskIntoConstraints = false
        
        // DoctorsImage constraints
        NSLayoutConstraint.activate([
            hospitalsImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 36),
            hospitalsImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -36),
            hospitalsImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 19),
            hospitalsImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -37)
        ])
        
        self.addSubview(buttonTitle)
        buttonTitle.text = "Hospitals"
        buttonTitle.textColor = AccentColors.textColor
        buttonTitle.translatesAutoresizingMaskIntoConstraints = false
        
        // buttonTitle constraints
        NSLayoutConstraint.activate([
            buttonTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonTitle.topAnchor.constraint(equalTo: hospitalsImage.bottomAnchor, constant: 4)
        ])

        self.backgroundColor = AccentColors.hospitals
    }
}

//#Preview("CustomButtonForStack", traits: .fixedLayout(width: 104, height: 88)) {
//    CustomButtonForStack(buttonStyle: .pharmacy)
//}
