//
//  DetailView.swift
//  MoviesWithUITestingTemplate
//
//  Created by Julie Collazos on 26/01/2023.
//

import SwiftUI

struct DetailView: View {
    var movie: Movie
    var body: some View {
        VStack {
            Text(movie.title.capitalized)
                .font(.title)
                .fontWeight(.heavy)
                .padding()
            Text("by \(movie.director.capitalized)")
                .font(.custom("Chalkduster", size: 18))
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.bottom, 3)
            Text(String(movie.year))
                .italic()
                .font(.callout)
                .padding(.bottom)
            Image(movie.image)
                .resizable()
                .scaledToFit()
            ScrollView(.vertical, showsIndicators: false) {
                Text(movie.genre.rawValue.capitalized)
                    .italic()
                    .font(.callout)
                    .padding(.top)
                VStack {
                    Text(movie.pitch)
                        .lineSpacing(8)
                        .padding()
                        .multilineTextAlignment(.center)
                }
            }
        }
        .navigationTitle("Movies")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(movie: MoviesData().movies[0])
            .environmentObject(MoviesData())
    }
}
