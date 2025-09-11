//
//  AppColor.swift
//  Cookcademy
//
//  Created by dzthnxf dthf on 04.07.25.
//

import SwiftUI

struct AppColor {
    static let background: Color = Color(.sRGB,
                                         red: 228/255,
                                         green: 235/255,
                                         blue: 250/255,
                                         opacity: 1)
    static let foreground: Color = Color(.sRGB,
                                         red: 118/255,
                                         green: 119/255,
                                         blue: 231/255,
                                         opacity: 1)
}

extension Color: RawRepresentable {
    public init?(rawValue: String) {  // String utf8 -> Data -> [Double] -> Color.
    do {
        let encodedData = rawValue.data(using: .utf8)! // Преобразует String utf8 в Data
      let components = try JSONDecoder().decode([Double].self, from: encodedData) // Декодирует encodedData из Data в [Double]
        self = Color(red: components[0], // Создаёт Color, используя значения массива components в качестве red, green, blue, opacity
                   green: components[1],
                   blue: components[2],
                   opacity: components[3])
    }
    catch {
      return nil
    }
  }
  
  public var rawValue: String { // Color -> String? utf8
      guard let cgFloatComponents = UIColor(self).cgColor.components else { return "" } // Перевоит Color в [GFloat]. Например, [1.0, 0.0, 0.0, 1.0]
    let doubleComponents = cgFloatComponents.map { Double($0) } // Переводит cgFloatComponents из [GFloat] в [Double]
    do {
      let encodedComponents = try JSONEncoder().encode(doubleComponents)  // Кодирует doubleComponents из [Double] в Data
      return String(data: encodedComponents, encoding: .utf8) ?? "" // Кодирует encodedComponents из Data в String? utf8
    }
    catch {
      return ""
    }
  }
}


