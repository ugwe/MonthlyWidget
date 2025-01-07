//
//  monthlywidget.swift
//  monthlywidget
//
//  Created by Michael Ugwe on 1/6/25.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> DayEntry {
        DayEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (DayEntry) -> ()) {
        let entry = DayEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [DayEntry] = []

        // Generate a timeline consisting of seven entries an day apart, starting from the current date.
        let currentDate = Date()
        for dayOffset in 0..<7 {
            let entryDate = Calendar.current.date(byAdding: .day, value: dayOffset, to: currentDate)!
            let startOfDate = Calendar.current.startOfDay(for:entryDate)
            let entry = DayEntry(date: startOfDate)
            entries.append(entry)
        }
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = DayEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }

//    func relevances() async -> WidgetRelevances<Void> {
//        // Generate a list containing the contexts this widget is relevant in.
//    }
}

struct DayEntry: TimelineEntry {
    let date: Date
}

struct monthlywidgetEntryView : View {
    var entry: DayEntry
    var config: MonthConfig
    
    init(entry: DayEntry) {
        self.entry = entry
        self.config = MonthConfig.determineConfig(from: entry.date)
    }

    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .fill(config.backgroundColor.gradient)
            VStack {
                HStack (spacing:4){
                    Text(config.emojiText)
                        .font(.title)
                    Text(entry.date.weekdayDisplayFormat)
                        .font(.title3)
                        .fontWeight(.bold)
                        .minimumScaleFactor(0.6)
                        .foregroundColor(config.weekdayTextColor.opacity(0.5))
                    Spacer()
                }
                
                Text(entry.date.dayDisplayFormat)
                    .font(.system(size: 80, weight: .heavy))
                    .foregroundColor(config.dayTextColor)
            }
            .padding()
        }
    }
}

struct monthlywidget: Widget {
    let kind: String = "monthlywidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                monthlywidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                monthlywidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("Monthly Style Widget")
        .description("Theme of the widget changes based on month.")
        .contentMarginsDisabled()
        .supportedFamilies([.systemSmall])
    }
}

#Preview(as: .systemSmall) {
    monthlywidget()
} timeline: {
    //DayEntry(date: .now)
    DayEntry(date: dateToDisplay(month: 1, day: 21))
}



func dateToDisplay(month: Int, day: Int) -> Date {
    let components = DateComponents(calendar: Calendar.current,year:2025,month: month, day: day)
        
    return Calendar.current.date(from: components)!
    }



extension Date {
    var weekdayDisplayFormat: String {
        self.formatted(.dateTime.weekday(.wide))
    }
    
    var dayDisplayFormat: String {
        self.formatted(.dateTime.day())
    }
}

