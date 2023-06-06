import SwiftUI
import Observation

struct ContentView: View {
    let provider = FeedProvider()
    var body: some View {
        FeederView(feed: provider)
    }
}

struct FeederView: View {
    var feed: FeedProviding
    var body: some View {
         VStack {
            Text(feed.title)
            Button(action: {
                feed.load()
            }) {
                Text("test")
            }
        }
    }
}

protocol FeedProviding {
    var title: String { get }
    var articles: [Article] { get }
    func load()
}

struct Article {
    let id: String
    let description: String
}

@Observable
class FeedProvider: FeedProviding {
    var title: String = ""
    var articles: [Article] = []
    
    func load() {
        print("loadded")
        title = "loadded"
    }
}
