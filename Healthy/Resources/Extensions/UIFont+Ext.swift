//
//  UIFont+Ext.swift
//  Healthy
//
//  Created by Alex Neumark on 22.07.2024.
//

import UIKit

extension UIFont {
    enum Montserrat {
        enum Black {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Montserrat.black, size: size)!
            }
        }
        enum BlackItalic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Montserrat.blackItalic, size: size)!
            }
        }
        enum Bold {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Montserrat.bold, size: size)!
            }
        }
        enum BoldItalic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Montserrat.boldItalic, size: size)!
            }
        }
        enum ExtraBold {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Montserrat.extraBold, size: size)!
            }
        }
        enum ExtraBoldItalic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Montserrat.extraBoldItalic, size: size)!
            }
        }
        enum ExtraLight {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Montserrat.extraLight, size: size)!
            }
        }
        enum ExtraLightItalic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Montserrat.extraLightItalic, size: size)!
            }
        }
        enum Italic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Montserrat.italic, size: size)!
            }
        }
        enum Light {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Montserrat.light, size: size)!
            }
        }
        enum LightItalic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Montserrat.lightItalic, size: size)!
            }
        }
        enum Medium {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Montserrat.medium, size: size)!
            }
        }
        enum MediumItalic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Montserrat.mediumItalic, size: size)!
            }
        }
        enum Regular {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Montserrat.regular, size: size)!
            }
        }
        enum SemiBold {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Montserrat.semiBold, size: size)!
            }
        }
        enum SemiBoldItalic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Montserrat.semiBoldItalic, size: size)!
            }
        }
        enum Thin {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Montserrat.thin, size: size)!
            }
        }
        enum ThinItalic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Montserrat.thinItalic, size: size)!
            }
        }
    }
}

private extension UIFont {
    enum Constants {
        enum Montserrat {
            static let black = "Montserrat-Black"
            static let blackItalic = "Montserrat-BlackItalic"
            static let bold = "Montserrat-Bold"
            static let boldItalic = "Montserrat-BoldItalic"
            static let extraBold = "Montserrat-ExtraBold"
            static let extraBoldItalic = "Montserrat-ExtraBoldItalic"
            static let extraLight = "Montserrat-ExtraLight"
            static let extraLightItalic = "Montserrat-ExtraLightItalic"
            static let italic = "Montserrat-Italic"
            static let light = "Montserrat-Light"
            static let lightItalic = "Montserrat-LightItalic"
            static let medium = "Montserrat-Medium"
            static let mediumItalic = "Montserrat-MediumItalic"
            static let regular = "Montserrat-Regular"
            static let semiBold = "Montserrat-SemiBold"
            static let semiBoldItalic = "Montserrat-SemiBoldItalic"
            static let thin = "Montserrat-Thin"
            static let thinItalic = "Montserrat-ThinItalic"
            
        }
    }
}
