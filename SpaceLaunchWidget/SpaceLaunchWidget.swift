//
//  SpaceLaunchWidget.swift
//  SpaceLaunchWidget
//
//  Created by Halit Baskurt on 15.10.2023.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), providerInfo: "placeholder", launchImage: "rocket-placeholder")
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration, providerInfo: "snapshot")
        completion(entry)
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        
        SpaceAPI.request(endpointType: SpaceEndpoint
            .latestLaunch) { (result :SpaceRequestResult<RocketLaunchModel>) in
                switch result{
                case .success(let result):
                    let rocketEntry: SimpleEntry = .init(date: .init(),
                                                         configuration: .init(),
                                                         providerInfo: "timeline",
                                                         launchImage: "rocket-placeholder",
                                                         launchName: result.name,
                                                         launchDateUTC: result.date_utc)
                    let nextUpdate = Calendar.current.date(
                        byAdding: DateComponents(minute: 15),
                        to: Date()
                    )
                    guard let nextUpdate else { return }
                    let timeline = Timeline(
                        entries: [rocketEntry],
                        policy: .after(nextUpdate)
                    )
                    
                    completion(timeline)
                default: break
                }
            }
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let providerInfo: String
    let launchImage: String?
    let launchName: String?
    let launchDateUTC: String?
    
    init(date: Date, configuration: ConfigurationIntent, providerInfo: String,
         launchImage: String? = nil, launchName: String? = nil, launchDateUTC: String? = nil) {
        self.date = date
        self.configuration = configuration
        self.providerInfo = providerInfo
        self.launchImage = launchImage
        self.launchName = launchName
        self.launchDateUTC = launchDateUTC
    }
}


struct SpaceLaunchWidgetEntryView : View {
    var entry: Provider.Entry
    
    
    // Obtain the widget family value
    @Environment(\.widgetFamily)
    var family
    
    var body: some View {
        
        switch family {
        case .accessoryRectangular:
            RectangularWidgetView(entry: entry)
        default:
            HomeScreenWidget(entry: entry)
        }
    }
}

struct RectangularWidgetView: View {
    var entry: SimpleEntry
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                AccessoryWidgetBackground()
                    .cornerRadius(8)
                GeometryReader { geometry in
                    VStack(spacing: 3) {
                        HStack(spacing: 3) {
                            Image(entry.launchImage ?? "")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding(3)
                            Text(entry.launchName ?? "LaunchName")
                                .font(.headline)
                            Spacer()
                        }
                        Text(entry.launchDateUTC?.utcToLocal(format: "MM-yyyy") ?? "UTC-:")
                            .hAlign(.trailing)
                            .padding(3)
                    }
                }
            }.onAppear {
                
            }
        }
    }
}

struct HomeScreenWidget: View {
    var entry: SimpleEntry
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("space-backround")
                    .resizable()
                    .scaledToFill()
                AccessoryWidgetBackground()
                    .cornerRadius(8)
                GeometryReader { geometry in
                    VStack {
                        HStack(spacing:10) {
                            Image(entry.launchImage ?? "")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .fillView(.ultraThinMaterial)
                                .padding()
                            Text(entry.launchName?.capitalized ?? "Launch-Name")
                                .font(.title)
                                .foregroundColor(.white)
                                .frame(width: .infinity, height: 30)
                                .fillView(.ultraThinMaterial)
                            
                            Spacer()
                        }
                        Text(entry.launchDateUTC?.utcToLocal(format: "MM-yyyy") ?? "UTC:")
                            .foregroundColor(.white)
                            .hAlign(.trailing)
                            .fillView(.ultraThinMaterial)
                            .padding()
                            
                    }
                }
            }
        }
    }
}

struct SpaceLaunchWidget: Widget {
    let kind: String = "SpaceLaunchWidget"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            SpaceLaunchWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("SpaceLaunch")
        .description("Get information about the latest launch")
        .supportedFamilies([
            .accessoryRectangular,
            .systemMedium,
        ])
    }
}

struct SpaceLaunchWidget_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            SpaceLaunchWidgetEntryView(entry: SimpleEntry(
                date: Date(), configuration: ConfigurationIntent(), providerInfo: "preview"))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
            
            SpaceLaunchWidgetEntryView(entry: SimpleEntry(
                date: Date(), configuration: ConfigurationIntent(), providerInfo: "preview")
            )
            .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
        }
        
    }
}
