//
//  MonthConfig.swift
//  monthlywidgetExtension
//
//  Created by Michael Ugwe on 1/7/25.
//

import SwiftUI

struct MonthConfig {
    let backgroundColor: Color
    let emojiText: String
    let weekdayTextColor: Color
    let dayTextColor: Color
    
    static func determineConfig(from date: Date) -> MonthConfig {
        let monthInt = Calendar.current.component(.month, from: date)
        
        switch monthInt {
                case 1:
                    return MonthConfig(backgroundColor: .jandarkGray,
                                       emojiText: "⛄️",
                                       weekdayTextColor: .black.opacity(0.6),
                                       dayTextColor: .white.opacity(0.8))
                case 2:
                    return MonthConfig(backgroundColor: .feblightGray,
                                       emojiText: "❤️",
                                       weekdayTextColor: .black.opacity(0.5),
                                       dayTextColor: .pink.opacity(0.8))
                case 3:
                    return MonthConfig(backgroundColor: .marchlightYellow,
                                       emojiText: "🌸",
                                       weekdayTextColor: .black.opacity(0.7),
                                       dayTextColor: .green.opacity(0.8))
                case 4:
                    return MonthConfig(backgroundColor: .aprildarkYellow,
                                       emojiText: "🌦️",
                                       weekdayTextColor: .black.opacity(0.5),
                                       dayTextColor: .purple.opacity(0.8))
                case 5:
                    return MonthConfig(backgroundColor: .maylightOrange,
                                       emojiText: "🌞",
                                       weekdayTextColor: .black.opacity(0.5),
                                       dayTextColor: .pink.opacity(0.7))
                case 6:
                    return MonthConfig(backgroundColor: .juneOrange,
                                       emojiText: "🎓",
                                       weekdayTextColor: .black.opacity(0.5),
                                       dayTextColor: .yellow.opacity(0.8))
                case 7:
                    return MonthConfig(backgroundColor: .julydarkOrange,
                                       emojiText: "🏖",
                                       weekdayTextColor: .black.opacity(0.5),
                                       dayTextColor: .blue.opacity(0.8))
                case 8:
                    return MonthConfig(backgroundColor: .auglightBrown,
                                       emojiText: "☀️",
                                       weekdayTextColor: .black.opacity(0.5),
                                       dayTextColor: .orange.opacity(0.8))
                case 9:
                    return MonthConfig(backgroundColor: .sepBrown,
                                       emojiText: "🍁",
                                       weekdayTextColor: .black.opacity(0.5),
                                       dayTextColor: .yellow.opacity(0.9))
                case 10:
                    return MonthConfig(backgroundColor: .OctMaroon,
                                       emojiText: "👻",
                                       weekdayTextColor: .white.opacity(0.6),
                                       dayTextColor: .red.opacity(0.8))
                case 11:
                    return MonthConfig(backgroundColor: .NovGreen,
                                       emojiText: "🦃",
                                       weekdayTextColor: .black.opacity(0.6),
                                       dayTextColor: .black.opacity(0.6))
                case 12:
                    return MonthConfig(backgroundColor: .DecGrey,
                                       emojiText: "🎄",
                                       weekdayTextColor: .white.opacity(0.9),
                                       dayTextColor: .black.opacity(0.7))
                default:
                    return MonthConfig(backgroundColor: .gray,
                                       emojiText: "📅",
                                       weekdayTextColor: .black.opacity(0.6),
                                       dayTextColor: .white.opacity(0.8))
                }

        
    }
}
