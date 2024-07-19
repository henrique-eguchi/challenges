import SwiftUI
import Combine

// Tab Bar View

struct TabBarView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Label("Feed", systemImage: "house")
                }

            Text("Chat")
                .tabItem {
                    Label("Chat", systemImage: "message")
                }

            Text("Promotions")
                .tabItem {
                    Label("Promotions", systemImage: "list.bullet.clipboard")
                }

            Text("Profile")
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
        }
    }
}

// Services

struct ServicesView: View {
    @StateObject private var viewModel = ServicesViewModel()

    var body: some View {
        FeedItemStyleView(title: "Services", showSeeAll: true) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 25) {
                    ForEach(viewModel.services, id: \.id) { service in
                        NavigationLink(destination: ServiceDetailsView(recipe: service)) {
                            ServiceItemView(service: service)
                        }
                    }
                }
                .padding(.top, 8)
                .padding(.horizontal)
                Spacer()
            }
        }
    }
}

struct ServiceModel: Identifiable {
    var id: Int
    var name: String
    var thumbnail: String
    var details: ServiceDetailsModel
}

struct ServiceDetailsModel {
    var image: String
    var description: String
}

final class ServicesViewModel: ObservableObject {
    @Published var services: [ServiceModel] = [
        ServiceModel(id: 1, name: "Cleaning", thumbnail: "Service1", details: ServiceDetailsModel(image: "Service1", description: "Cleaning description")),
        ServiceModel(id: 2, name: "Handyman", thumbnail: "Service2", details: ServiceDetailsModel(image: "Service2", description: "Handyman description")),
        ServiceModel(id: 3, name: "Package Delivery", thumbnail: "Service3", details: ServiceDetailsModel(image: "Service3", description: "Package Deliver description")),
        ServiceModel(id: 4, name: "Cleaning", thumbnail: "Service1", details: ServiceDetailsModel(image: "Service1", description: "Cleaning description")),
        ServiceModel(id: 5, name: "Handyman", thumbnail: "Service2", details: ServiceDetailsModel(image: "Service2", description: "Handyman description")),
    ]
}

// Bundles

struct BundlesView: View {
    var body: some View {
        FeedItemStyleView(title: "DVORA Bundles", showSeeAll: false) {
            WideVerticalBannerView(
                title: "Apartment & Amenities",
                subheading: "Tap here to create your bundle in 3 steps", 
                gradientColors: [.yellow, .gray]
            )
        }
        .onTapGesture {
            print("Bundle tapped!")
        }
    }
}

// Promotions

struct PromotionsView: View {
    var body: some View {
        FeedItemStyleView(title: "Promotions", showSeeAll: false) {
            WideHorizontalBannerView(
                title: "20% of on any Cleaning",
                gradientColors: [.black, .green],
                imageName: "star"
            )
            .onTapGesture {
                print("Promotion tapped!")
            }
        }
    }
}

// CoLab

struct CoLabView: View {
    var body: some View {
        FeedItemStyleView(title: "CoLab by DVORA", showSeeAll: false) {
            LeftSideImageDescriptionView(title: "Suites & Co-Working Seats. Beautiful, bright, convenient workspaces inspired by hardworking people.", imageName: "ColabGraphic")
        }
    }
}

// Feed View

struct FeedView: View {
    var body: some View {
        NavigationView {
            VStack {
                Divider()
                ScrollView(.vertical, showsIndicators: false) {
                    WelcomeView()
                    EventsView()
                    BundlesView()
                    PromotionsView()
                    CoLabView()
                    ServicesView()
                }
                .navigationTitle("DVORA")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Image("DVORALogo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            print("Notification tapped!")
                        }, label: {
                            Image(systemName: "bell")
                        })

                    }
                }
            }
        }
    }
}

// Service Card Item View
struct ServiceItemView: View {
    var service: ServiceModel

    var body: some View {
        VStack(alignment: .center) {
            Image(service.thumbnail)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .cornerRadius(10)

            Text(service.name)
                .font(.footnote)
                .truncationMode(.tail)
                .foregroundStyle(.black)
                .lineLimit(1)
                .truncationMode(.tail)
        }
    }
}

// Service Details View
struct ServiceDetailsView: View {
    var recipe: ServiceModel

    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                Image(recipe.details.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()

                HStack {
                    Text(recipe.details.description)
                        .padding()
                }

                Spacer()
            }
        }
        .navigationTitle(recipe.name)
    }
}


// Feed

struct FeedItemStyleView<Content: View>: View {
    var title: String
    var showSeeAll: Bool
    var content: () -> Content

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ItemHeaderView(
                    title: title,
                    buttonText: showSeeAll ? "See All" : "",
                    destination: Text("See All List - TBD")
                )
                .padding(.horizontal)

                content()
            }
            VerticalBar()
        }
        .padding(.top)
    }
}

// Events

final class EventsViewModel: ObservableObject {
    @Published var items: [EventItemModel] = [
        EventItemModel(
            thumbnail: "Event1",
            description: "Wine Tasting",
            locationText: "Hamilton House",
            locationIcon: "mappin",
            dateText: "05/01/21",
            dateIcon: "calendar",
            timeText: "5:30pm",
            timeIcon: "clock"
        ),
        EventItemModel(
            thumbnail: "Event2",
            description: "Rooftop Yoga with Kendra",
            locationText: "Art House",
            locationIcon: "mappin",
            dateText: "05/15/21",
            dateIcon: "calendar",
            timeText: "10:00am",
            timeIcon: "clock"
        ),
        EventItemModel(
            thumbnail: "Event3",
            description: "Earth Day Celebration",
            locationText: "175 Second",
            locationIcon: "mappin",
            dateText: "05/25/21",
            dateIcon: "calendar",
            timeText: "7:45pm",
            timeIcon: "clock"
        )
    ]
}

struct EventItemModel {
    var thumbnail: String
    var description: String
    var locationText: String
    var locationIcon: String
    var dateText: String
    var dateIcon: String
    var timeText: String
    var timeIcon: String
}

struct EventsView: View {
    @ObservedObject var viewModel: EventsViewModel = EventsViewModel()

    var body: some View {
        FeedItemStyleView(title: "Events", showSeeAll: true) {
            ForEach(viewModel.items, id: \.thumbnail) { item in
                NavigationLink(destination: EventDetailsView(viewModel: EventDetailsViewModel(event: item))) {
                    EventItemView(
                        thumbnail: item.thumbnail,
                        description: item.description,
                        locationText: item.locationText,
                        locationIcon: item.locationIcon,
                        dateText: item.dateText,
                        dateIcon: item.dateIcon,
                        timeText: item.timeText,
                        timeIcon: item.timeIcon
                    )
                }
                .padding(.vertical, 8)
            }
            .padding(.horizontal, 10)
        }
    }
}

// Service Details View

final class EventDetailsViewModel: ObservableObject {
    let bigDescription = """
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin blandit dui mauris, ut malesuada massa posuere nec. Etiam elementum venenatis tellus ac efficitur. Cras ultrices lorem turpis, sit amet interdum est eleifend vitae. Maecenas placerat ornare sapien. Interdum et malesuada fames ac ante ipsum primis in faucibus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Integer dictum bibendum elit a varius.
    """

    @Published var event: EventItemModel

    init(event: EventItemModel) {
        self.event = event
    }
}

struct EventDetailsView: View {
    @ObservedObject var viewModel: EventDetailsViewModel

    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                Image(viewModel.event.thumbnail)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 250)
                    .clipped()

                VStack(alignment: .leading, spacing: 5) {
                    Text(viewModel.event.description)
                        .font(.title)
                        .padding(.bottom, 10)

                    Text(viewModel.bigDescription)
                }
                .padding(.horizontal)
                .padding(.bottom, 20)

                Divider()

                EventInformationView()
                    .padding(.horizontal)
            }
        }
        .navigationTitle(viewModel.event.description)
    }
}

struct EventInformationView: View {
    var body: some View {
        VStack(spacing: 5) {
            HStack {
                VStack(alignment: .leading) {
                    Text("155 second st")
                    Text("10/08/2021")
                }

                Spacer()

                VStack(alignment: .leading) {
                    Text("9:00am-11:59pm")
                    Text("Free")
                }
            }

            Button {
                print("RSVP tapped!")
            } label: {
                Text("RSVP")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .tint(Color.yellow)
            .foregroundStyle(.black)
            .buttonBorderShape(.roundedRectangle)
            .controlSize(.large)
            .padding(.vertical, 20)

        }
    }
}

struct EventItemView: View {
    var thumbnail: String
    var description: String
    var locationText: String
    var locationIcon: String
    var dateText: String
    var dateIcon: String
    var timeText: String
    var timeIcon: String

    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(thumbnail)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70)
                    .cornerRadius(8)

                VStack(alignment: .leading, spacing: 4) {
                    Text(description)
                        .font(.headline)
                        .foregroundStyle(.black)

                    IconDescriptionView(iconSystemName: locationIcon, description: locationText)

                    HStack(spacing: 16) {
                        IconDescriptionView(iconSystemName: dateIcon, description: dateText)
                        IconDescriptionView(iconSystemName: timeIcon, description: timeText)
                    }
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(.gray)
            }
            .padding(.leading, 8)
            Divider()
        }
    }
}

/// Welcome

struct WelcomeView: View {
    let name: String = "Henrique"

    var body: some View {
        HStack {
            Text("Welcome, \(name)!")
                .font(.title)
            Spacer()
        }
        .padding(.horizontal)
    }
}

// UI Components

struct ItemHeaderView<Destination: View>: View {
    let title: String
    var buttonText: String?
    let destination: Destination

    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
            Spacer()
            NavigationLink(destination: destination) {
                Text(buttonText ?? "")
                    .foregroundColor(.blue)
            }
        }
    }
}

struct VerticalBar: View {
    let color: Color = .yellow

    var body: some View {
        HStack {
            Rectangle()
                .foregroundColor(color)
                .frame(width: 5)
            Spacer()
        }
    }
}

struct IconDescriptionView: View {
    var iconSystemName: String
    var description: String

    var body: some View {
        HStack(spacing: 3) {
            Image(systemName: iconSystemName)
                .foregroundStyle(.gray)

            Text(description)
                .foregroundStyle(.gray)
        }
    }
}

struct WideVerticalBannerView: View {
    var title: String
    var subheading: String
    var gradientColors: [Color]

    var body: some View {
        ZStack {
            WideGradientRectangle(gradientColors: gradientColors)

            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.title)
                    Text(subheading)
                        .font(.subheadline)
                }
                .padding(.horizontal)
                Spacer()
            }
        }
        .padding(.horizontal)
        .padding(.top)
    }
}

struct WideHorizontalBannerView: View {
    var title: String
    var gradientColors: [Color]
    var imageName: String?

    var body: some View {
        ZStack {
            WideGradientRectangle(gradientColors: gradientColors)

            HStack {
                Text(title)
                    .foregroundColor(.white)
                    .font(.title)
                Spacer()
                if let imageName = imageName {
                    Image(systemName: imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                        .foregroundStyle(.white)
                        .padding()
                }
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
        .padding(.top)
    }
}

struct WideGradientRectangle: View {
    var gradientColors: [Color]

    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: gradientColors),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .frame(height: 100)
    }
}

struct LeftSideImageDescriptionView: View {
    var title: String
    var imageName: String?

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack(spacing: 15) {
                    if let imageName = imageName {
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                    }
                    Text(title)
                        .font(.title3)

                }
            }
        }
        .padding(.horizontal)
        .padding(.top)
    }
}

// Create project
// ViewModel for each Feed component
// Add success / failure state
// Add Combine mock accordingly (for Events & Services)
// Fine ui tweaks

