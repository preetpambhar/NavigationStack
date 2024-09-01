//
//  ContentView.swift
//  NavigationStack
//
//  Created by Preet Pambhar on 2024-08-30.
//

import SwiftUI

struct ContentView: View {
    struct Series: Identifiable, Hashable {
        let id = UUID()
        var name: String
        var rating: Double
        
    }
    
    struct Movies: Identifiable, Hashable{
        let id = UUID()
        var name: String
    }
    @State private var path  = NavigationPath()
    
    var body: some View {
        var tvSeries: [Series] = [Series( name: "Mirzapur 1", rating: 4.8),Series( name: "Mirzapur 2", rating: 4.6),Series( name: "Mirzapur 3", rating: 4.9),Series( name: "Mirzapur 4", rating: 4.9)]
      
        var movies: [Movies] = [
        Movies(name: "Pushpa"),
        Movies(name: "Titanic"),
        Movies(name: "Siddat"),
        Movies(name: "KGF")
        ]
        
        NavigationStack(path: $path){
            List{
                Section("Series"){
                    ForEach(tvSeries){ series in
                       // Text(series.name)
                        NavigationLink(series.name, value: series)
                    }
                }
                Section("Movie"){
                    ForEach(movies){movie in
                        //Text(movies.name)
                        NavigationLink(movie.name, value: movie)
                    }
                }
            }.navigationTitle("Series")
                .navigationDestination(for: Series.self){series in
                    VStack{
                        Text(series.name)
                        Text("Rating:  \(series.rating, specifier:"%.1f")")
                        Button("Add Move"){
                            path.append(Movies(name: "Dhol"))
                        }
                        Button("GO Back"){
                            path.removeLast()
                        }
                        Button("GO Root Home"){
                            path = NavigationPath()
                        }
                }
            } .navigationDestination(for: Movies.self){movies in
                VStack{
                    Text(movies.name)
                    ForEach(tvSeries){ series in
                       // Text(series.name)
                        NavigationLink(series.name, value: series)
                    }
                        
            }
        }
        }
    }
    @ViewBuilder
    func TestView(message: String) -> some View{
            VStack{
                Text(message)
            }
    }
}

#Preview {
    ContentView()
}
