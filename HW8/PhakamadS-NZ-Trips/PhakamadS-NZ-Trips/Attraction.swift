//
//  Attraction.swift
//  PhakamadS-NZ-Trips
//
//  Created by Bright Phakamad on 3/8/20.
//  Copyright © 2020 DePaul University. All rights reserved.
//

import Foundation

class Attraction {
    
    enum `Island` : String {
        case north = "North Island"
        case south = "South Island"
    }
    
    enum `Image` : String {
        case Fiordland = "Fiordland National Park and Milford Sound"
    }
    
    var name: String
    var island: Island
    var content: String
    
    init(name: String, island: Island, content: String) {
        self.name = name
        self.island = island
        self.content = content
    }
}

let northAttractions = [
    
    Attraction(name: "Auckland",
         island: .north,
          content: "\tBlessed with two sparkling harbors, Auckland, the \"City of Sails,\" is New Zealand's largest city and the most populous Polynesian city in the world (population = 1.6 million). Blond- and black-sand beaches, rain forest hiking trails, picturesque coves, islands, and volcanoes surround the city, making it a perfect base for day trips and wilderness adventures. \n\tTo appreciate Auckland's stunning location, visitors can zoom up the 328-meter Sky Tower for spectacular views across the city and hinterland. Other fun things to do in Auckland include enjoying its top-notch dining, sampling its vibrant arts scene, and a revamped waterfront district packed with boutiques and restaurants."
     ),
    
    Attraction(name: "Bay of Islands",
               island: .north,
               content: "\tA three-hour drive north of Auckland, the beautiful Bay of Islands is one of the most popular vacation destinations in the country. More than 144 islands dot the glittering bay, making it a haven for sailing and yachting. \n\tPenguins, dolphins, whales, and marlin live in these fertile waters, and the region is a popular sport-fishing spot. Visitors can sea kayak along the coast, hike the many island trails, bask in secluded coves, tour Cape Brett and the famous rock formation called Hole in the Rock, and explore subtropical forests where Kauri trees grow. The quaint towns in the area such as Russell, Opua, Paihia, and Kerikeri are great bases for exploring this scenic bay."
    ),
    
    Attraction(name: "Coromandel Peninsula",
         island: .north,
          content: "\tJust across the Hauraki Gulf from Auckland, the rugged Coromandel Peninsula seems a world away from the city's hustle and bustle. Craggy mountains cloaked in native forest form a spine along the peninsula, offering excellent opportunities for hiking and birding. \n\tOther fun things to do for tourists include relaxing on the golden beaches, sea kayaking around the offshore islands, sky diving, and visiting the many galleries and art studios. At Hot Water Beach, a dip in the bubbling hot pools is a great way to end a busy day of sightseeing."
     ),
    
    Attraction(name: "Lake Taupo and Tongariro National Park",
         island: .north,
          content: "\tIn the center of the North Island and just a few kilometers from glittering Lake Taupo, New Zealand's largest lake, lies Tongariro National Park. A dual World Heritage Site due to its spectacular volcanic features and its importance to the Maori culture, the volcanic peaks of Tongariro, Ngauruhoe, and part of Ruapehu were in fact gifted by Maori chief Te Heuheu Tukino IV in 1887 to the people of New Zealand in order to preserve this sacred land. \n\tOne of the oldest national parks in the world, Tongariro is a land of dramatic beauty, with towering volcanoes, turquoise lakes, arid plateaus, alpine meadows, and hot springs. A highlight of the park is the Tongariro Alpine Crossing, one of the most popular day walks in the country. Fun things to do here include camping, enjoying the park's many walks and hiking trails, and spending time in its interesting visitor center."
     ),
    
    Attraction(name: "Napier, Hawke's Bay",
         island: .north,
          content: "\tIn the sunny region of Hawke's Bay, Napier is famous for its gourmet food and Art Deco architecture. After a powerful earthquake destroyed the town in 1931, it was rebuilt in the Spanish Mission style and Art Deco design for which Miami Beach is also famous. Today, fun things for visitors to do include taking a self-guided tour to view these buildings, some of which are embellished with Maori motifs, or spending time at Napier Beach. \n\tAlong the Marine Parade seafront promenade lies the town's famous statue from Maori mythology, called Pania of the Reef. Napier is also a haven for foodies. Gourmet restaurants here specialize in using fresh produce from the region, and the town plays host to popular farmers' markets. Nearby attractions include hiking trails and the gannet colony at Cape Kidnappers."
     ),
    
    Attraction(name: "Rotorua",
         island: .north,
          content: "\tOn the tumultuous Pacific Ring of Fire, Rotorua is one of the most active geothermal regions in the world. This is a land where the earth speaks. Boiling mud pools, hissing geysers, volcanic craters, and steaming thermal springs betray the forces that birthed much of New Zealand's dramatic topography.\n\tVisitors can take a walking tour of these geothermal wonders and soak in steaming mineral springs while visiting a variety of interesting attractions in order to learn about the region's rich Maori history and culture. \n\tAdventure seekers will also find plenty of things to do. Sky-diving, luging, and mountain biking are some of the activities on offer. Trout fishing is also popular, and Rotorua is the gateway to the ski fields of Mt. Ruapehu. \n\tNearby Wai-O-Tapu is also a popular tourist attraction with colorful hot springs and the famous Champagne Pool and Lady Knox Geyser."
     ),
    
]

let southAttractions = [
    
    Attraction(name: "Abel Tasman National Park & the Abel Tasman Coast Track",
         island: .south,
          content: "\tThe Abel Tasman Coast Track in Abel Tasman National Park is one of New Zealand's Great Walks. Winding along sparkling Tasman Bay, from Marahau to Separation Point, this scenic 51-kilometer hike lies in one of the sunniest regions of the South Island. Along the way, visitors can snorkel or kayak in secluded coves; enjoy tours that offer the chance to spot fur seals, dolphins, penguins, and a diverse range of birds; hike through cool forests; and enjoy panoramic views from the rugged coastal cliffs. \n\tPhotographers will also enjoy the many weathered rock formations, especially Split Apple Rock, a giant granite boulder sliced in two. The hike takes around three days, and accommodation ranges from campgrounds, to rustic huts, and plush private lodges. Sea kayaks are also a popular way to explore this beautiful coast."
     ),
    
    Attraction(name: "Aoraki/Mount Cook National Park",
         island: .south,
          content: "\tIn the heart of the Southern Alps, New Zealand's highest peaks rise above the alpine landscapes of Aoraki National Park, also called Mount Cook National Park. More than 40 percent of the park is covered in glaciers, and the country's tallest mountain Aoraki/Mount Cook and longest glacier, the Tasman Glacier, lie within its borders, making this a top destination for mountaineering. Sir Edmund Hillary trained here for his legendary Mount Everest ascent. \n\tNature lovers will appreciate the diversity of flora and fauna, with more than 300 species of alpine plants and 40 species of birds. Mount Cook Village is a great base for exploring the park and organizing activities such as scenic flights, ski touring, heli-skiing, hunting, hiking, and stargazing trips."
     ),
    
    Attraction(name: "Fiordland National Park and Milford Sound",
         island: .south,
         content: "\tA World Heritage Site, Fiordland National Park protects some of the most spectacular scenery in the country. Glaciers sculpted this dramatic landscape, carving the famous fjords of Milford, Dusky, and Doubtful Sounds. Visitors here can explore gushing cascades, offshore islands, virgin rain forests, vast lakes, and craggy mountain peaks. \n\tNot surprisingly, the park is a haven for hikers with some of the country's best hiking, including the famous Milford Track. Sea kayaking is a popular way to explore the fjords, and visitors can also enjoy a scenic flight over the park for a bird's-eye view of its staggering beauty."
    ),
    
    Attraction(name: "Fox and Franz Josef Glaciers",
         island: .south,
          content: "\tAmong the most accessible glaciers in the world, Franz Josef and Fox glaciers are the main tourist attractions in spectacular Westland Tai Poutini National Park. Both of these rivers of ice flow from some of the highest peaks in the Southern Alps to near sea level, where the gentle coastal climate makes it easy for visitors to explore them on foot. \n\tGuided hikes lead to the contorted frozen landscape of ice caves and pinnacles at the foot of the glaciers, plus a series of fascinating hot pools. For an aerial view, seaplanes and helicopters fly visitors to the top of these vast tongues of ice."
     ),

    Attraction(name: "Kaikoura",
         island: .south,
          content: "\tBirders, wildlife enthusiasts, and seafood aficionados will love the charming coastal village of Kaikoura. Tucked between the Seaward Kaikoura Range and the Pacific Ocean, Kaikoura offers excellent coastal hikes and popular whale watching tours. In addition to sperm whales and humpbacks, passengers may spot fur seals, dolphins, and a wide variety of birds including the graceful albatross."
     ),
    
    Attraction(name: "Queenstown",
         island: .south,
          content: "\tSnuggled between the shores of shimmering Lake Wakatipu and the snowy peaks of the Remarkables, Queenstown is New Zealand's adventure capital and one of the country's top destinations for international visitors. Bungee jumping, jet boating, white water rafting, paragliding, rock climbing, mountain biking, and downhill skiing are just some of the adrenaline-fueled things to do here, and visitors can explore the stunning alpine scenery on the excellent network of hiking trails. \n\tIn addition to the adventure sports, Queenstown offers all the creature comforts, with first-class hotels, spas, restaurants, galleries, and shops. It's also a great base for sightseeing trips to the Central Otago region, where visitors can explore gold-mining towns and the Middle Earth scenery from the popular Lord of the Rings movies."
     )
]
