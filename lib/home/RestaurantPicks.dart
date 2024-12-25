import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'FavoritesProvider.dart';

class RestaurantPicks extends StatefulWidget {
  const RestaurantPicks({super.key});

  @override
  State<RestaurantPicks> createState() => _RestaurantPicksState();
}

class _RestaurantPicksState extends State<RestaurantPicks> {
  final List<Map<String, String>> restaurants = [
    {
      "name": "Restaurant Name",
      "description": "Location where you can find it",
      "category": "category",
      "image": "assets/images/tinbox.jpg",
      "rating": "4.5"
    },
    {
      "name": "Restaurant Name",
      "description": "Location where you can find it",
      "category": "category",
      "image": "assets/images/tinbox.jpg",
      "rating": "4.7"
    },
    {
      "name": "Restaurant Name",
      "description": "Location where you can find it",
      "category": "category",
      "image": "assets/images/tinbox.jpg",
      "rating": "4.5"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // Disable scrolling in this ListView since parent already scrolls
      physics: NeverScrollableScrollPhysics(),
      // Make ListView take minimum space needed
      shrinkWrap: true,
      itemCount: restaurants.length,
      itemBuilder: (context, index) {
        final restaurant = restaurants[index];
        final isFavorite = context.watch<FavoritesProvider>().favoriteIndices.contains(index);
        return Container(
          margin:  EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                // Image container
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(


                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(restaurant["image"]!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Text content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant["name"]!,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500

                        )
                      ),
                      const SizedBox(height: 4),
                      Text(
                        restaurant["description"]!,
                        style: GoogleFonts.poppins(

                      )
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 20,),
                          SizedBox(width: 5,),
                          Text(restaurant["rating"]!),
                          SizedBox(width: 15,),
                          Container(
                            height: 27,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Colors.amber[50],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                restaurant["category"]!,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,

                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border_rounded,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    context.read<FavoritesProvider>().toggleFavorite(index);
                  },
                ),


              ],
            ),
          ),
        );
      },
    );
  }
}