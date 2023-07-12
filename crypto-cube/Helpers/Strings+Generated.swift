// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum S {
  /// Localizable.strings
  ///   crypto-cube
  /// 
  ///   Created by Maciej Dubowik on 28/06/2023.
  internal static let title = S.tr("Localizable", "title", fallback: "Crypto Cube")
  internal enum Font {
    internal enum Lato {
      /// Lato-Bold
      internal static let bold = S.tr("Localizable", "Font.Lato.bold", fallback: "Lato-Bold")
      /// Lato-ExtraBold
      internal static let extraBold = S.tr("Localizable", "Font.Lato.extraBold", fallback: "Lato-ExtraBold")
      /// Lato-Regular
      internal static let regular = S.tr("Localizable", "Font.Lato.regular", fallback: "Lato-Regular")
      /// Lato-SemiBold
      internal static let semiBold = S.tr("Localizable", "Font.Lato.semiBold", fallback: "Lato-SemiBold")
    }
  }
  internal enum Color {
    /// A0A0A0
    internal static let lightGray = S.tr("Localizable", "color.lightGray", fallback: "A0A0A0")
    /// FFA500
    internal static let orange = S.tr("Localizable", "color.orange", fallback: "FFA500")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension S {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
