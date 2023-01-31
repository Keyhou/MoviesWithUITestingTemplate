//
//  Profile.swift
//  MoviesWithUITestingTemplate
//
//  Created by Julie Collazos on 26/01/2023.
//

import SwiftUI

struct Profile: View {
    @State var user: User
    
// var d'environnement de la class observable MoviesData
    @EnvironmentObject var moviesData: MoviesData
    
    var body: some View {
        NavigationView {
            // Infos du user
            VStack {
                Image(user.avatar)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 180, alignment: .center)
                    .shadow(color: .gray, radius: 5, x: 3, y: 3)
                    .padding()
                Text("@\(user.name)")
                    .font(.title)
                    .fontWeight(.heavy)
                Spacer()
                Text(user.birthDate)
                    .padding()
                    .font(.callout)
                Text(user.description)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                    .padding(.vertical)
                
                Spacer()
                // Genres préférés du user (C'est un tableau donc on itère dessus)
                List {
                    Section("Genres préférés") {
                        HStack {
                            ForEach(user.preferedGenre, id: \.self) { genre in
                                if genre != user.preferedGenre.last {
                                    Text("\(genre.rawValue),")
                                } else {
                                    Text("\(genre.rawValue)")
                                }
                            }
                        }
                    }
                    .listStyle(.insetGrouped)
                    .headerProminence(.increased)
                    .padding(5)
                }
            }
            .navigationTitle("Profil")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile(user: user)
            .environmentObject(MoviesData())
    }
}

