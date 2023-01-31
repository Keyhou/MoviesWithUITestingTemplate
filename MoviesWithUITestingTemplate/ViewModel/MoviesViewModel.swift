//
//  MoviesViewModel.swift
//  MoviesWithUITestingTemplate
//
//  Created by Julie Collazos on 26/01/2023.
//

import Foundation
import Combine


final class MoviesData: ObservableObject {
    @Published var movies: [Movie] = [
        Movie(title: "Les infiltrés", director: "Martin scorcèse", image: "Infiltres", pitch: "À Boston, une lutte sans merci oppose la police à la mafia irlandaise dirigée par Frank Costello, parrain des quartiers sud. Ce dernier va racketter une épicerie et repère un enfant, Colin Sullivan. Il lui fait comprendre comment le monde marche.", year: 2006, genre: .action, isFavorite: true),
        Movie(title: "Inception", director: "Christopher Nolan", image: "Inception", pitch: "Dans un futur proche, les États-Unis ont développé ce qui est appelé le « rêve partagé », une méthode permettant d'influencer l'inconscient d'une victime pendant qu'elle rêve, donc à partir de son subconscient. Des « extracteurs » s'immiscent alors dans ce rêve, qu'ils ont préalablement modelé et qu'ils peuvent contrôler, afin d'y voler des informations sensibles stockées dans le subconscient de la cible. C'est dans cette nouvelle technique que se sont lancés Dominic Cobb et sa femme, Mal. Ensemble, ils ont exploré les possibilités de cette technique et l'ont améliorée, leur permettant d'emboîter les rêves les uns dans les autres, accentuant la confusion et donc diminuant la méfiance de la victime. Mais l'implication du couple dans ce projet a été telle que Mal a un jour perdu le sens de la réalité ; pensant être en train de rêver, elle s'est suicidée, croyant ainsi revenir à sa vision de la réalité.", year: 2010, genre: .thriller, isFavorite: false),
        Movie(title: "The Revenant", director: "Alejandro González Iñárritu", image: "Revenant", pitch: "Des trappeurs menés par le capitaine et négociant en fourrures Andrew Henry, subit de lourdes pertes lors d'une attaque menée par les Amérindiens dans une Amérique profondément sauvage. En effet, tandis que le trappeur Hugh Glass chasse un orignal dans les bois avec plusieurs personnes dont son fils métis Hawk, leur campement établi près d'une rivière est brutalement attaqué par des Arikaras (des Amérindiens du Dakota du Nord) qui massacrent sans pitié et pillent le camp. Trente-trois hommes périssent tandis que Glass, Hawk, Henry, John Fitzgerald, Jim Bridger et quelques autres hommes parviennent à prendre la fuite en bateau.", year: 2015, genre: .drama, isFavorite: false)
    ]
}

