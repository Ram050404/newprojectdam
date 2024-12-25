import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../home/FavoritesProvider.dart';

class Pizza extends StatelessWidget {
  final List<Map<String, String>> restaurants = [
    {
      "name": "Pizza Paradise",
      "description": "123 Cheesy St, Food City",
      "category": "Pizza",
      "image": "assets/images/tinbox.jpg",
      "rating": "4.6"
    },
    {
      "name": "Slice of Heaven",
      "description": "456 Pepperoni Blvd, Food City",
      "category": "Pizza",
      "image": "assets/images/tinbox.jpg",
      "rating": "4.8"
    },
    {
      "name": "Cheese & Crust",
      "description": "789 Crusty Lane, Food City",
      "category": "Pizza",
      "image": "assets/images/tinbox.jpg",
      "rating": "4.7"
    },
    {
      "name": "Margherita Magic",
      "description": "321 Basil Ave, Food City",
      "category": "Pizza",
      "image": "assets/images/tinbox.jpg",
      "rating": "4.5"
    },
    {
      "name": "Pizza Express",
      "description": "654 Fast Pizza Rd, Food City",
      "category": "Pizza",
      "image": "assets/images/tinbox.jpg",
      "rating": "4.4"
    },
    {
      "name": "The Dough Spot",
      "description": "852 Toppings St, Food City",
      "category": "Pizza",
      "image": "assets/images/tinbox.jpg",
      "rating": "4.6"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(


          child: Column(

            children: [
              // SizedBox(height: 17,),
              Container(

                decoration:    BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      spreadRadius: 0,
                      offset: Offset(0, 5),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),


                child: Stack(
                  children: [
                    // Image container
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 150,
                        width: 500,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40)),
                          image: DecorationImage(
                            image: AssetImage("assets/images/pizzaheader.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    // Text container
                    Positioned(
                      left: 20,
                      bottom: 40,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Text(
                                "Pizza",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30,
                                )
                            ),
                            Text('in your city',  style: GoogleFonts.poppins(
                              //fontWeight: FontWeight.w00,
                              //fontSize: 30,
                            )
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 34,
              ),



              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  ElevatedButton(

                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber[50],
                        foregroundColor: Colors.black,
                        elevation: 2,

                      ),
                      child: Row(
                        children: [
                          Text('filter'),
                          Icon(Icons.arrow_drop_down)
                        ],
                      )),


                  // Sort
                  ElevatedButton(

                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber[50],
                        foregroundColor: Colors.black,
                        elevation: 2,

                      ),
                      child: Row(
                        children: [
                          Text('sort'),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ))
                ],
              ),




              SizedBox(height: 30,),



              ListView.builder(

                // Disable scrolling in this ListView since parent already scrolls
                physics: NeverScrollableScrollPhysics(),
                // Make ListView take minimum space needed
                shrinkWrap: true,
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = restaurants[index];
                  final isFavorite = context.watch<FavoritesProvider>().favoriteIndices.contains(index);

                  return Column(
                    children: [







                      Container(
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
                                          width: 70,
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
                                  color: Colors.red[300],
                                ),
                                onPressed: () {
                                  context.read<FavoritesProvider>().toggleFavorite(index);
                                },
                              ),


                            ],
                          ),
                        ),

                      ),

                    ],


                  );
                },
              ),
            ],
          ),
        )
    );
  }
}
