import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:newproject/account/LoginPage.dart';
import 'package:newproject/categories/All.dart';
import 'package:newproject/categories/Cafeteria.dart';
import 'package:newproject/categories/Fastfood.dart';
import 'package:newproject/categories/FineDining.dart';
import 'package:newproject/categories/Grills.dart';
import 'package:newproject/categories/Pizza.dart';
import 'package:newproject/home/RestaurantPicks.dart';


class  HomePage extends StatelessWidget {
  int _selectedIndex = 0;
  final List<IconData> icons = [
    Icons.format_align_center,
    Icons.brunch_dining_rounded,
    Icons.fastfood_rounded,
    Icons.emoji_food_beverage,
    Icons.rice_bowl,
    Icons.local_pizza_rounded,
  ];

  final List<String> texticon = [
    "all",
    "fine",
    "fast food",
    "cafeteria",
    "grills",
    "pizza",
  ];

  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.amber[50],
      backgroundColor: Colors.white,




      body: ListView(
        children: [
          SizedBox(height: 70,),
          //top box

          Container(
            margin: EdgeInsets.all( 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.location_pin, color: Colors.amber,),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("City Name", style: GoogleFonts.poppins(),),
                        Text("Exact location of the user", style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.grey,
                        )),
                      ],
                    ),
                  ],
                ),
               //
                // SizedBox(width: 100,),
              //  Icon(Icons.account_circle, size: 40,),
                IconButton(
                  icon: Icon(Icons.account_circle, size: 40),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),


              ],
            ),

          ),
          SizedBox(height: 15,),

          CarouselSlider(
            items: [

              //1st Image of Slider
              Container(

                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage("assets/images/1.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //2nd Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  color: Colors.lightGreen[300],
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage("assets/images/delivery.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //3rd Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  color: Colors.lightGreen[300],
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage("assets/images/3.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //4th Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  color: Colors.lightGreen[300],
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage("assets/images/4.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),



            ],

            //Slider Container properties
            options: CarouselOptions(
              height: 250,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),






          SizedBox(height: 50,),

          Container(
            margin: EdgeInsets.all(40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
              Text(
                'Categories',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                    ),
                  )


              ),
              SizedBox(width:3,),
              Text("view all",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300
                    ),
                  )

              ),

            ],),
          ),


          //categories
          Container(
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 5),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(6, (index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigate to the respective page based on index
                        switch (index) {
                          case 0:
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => All()),
                            );
                            break;
                          case 1:
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FineDining()),
                            );
                            break;
                          case 2:
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FastFood()),
                            );
                            break;
                          case 3:
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Cafeteria()),
                            );
                            break;
                          case 4:
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => GrillsPage()),
                            );
                            break;
                          case 5:
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Pizza()),
                            );
                            break;
                          default:
                            break;
                        }
                      },
                      child: Container(
                        height: 75,
                        width: 75,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              offset: const Offset(2.0, 2.0),
                              blurRadius: 5.0,
                              spreadRadius: 0.0,
                            ),
                            const BoxShadow(
                              color: Colors.white,
                              offset: Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                icons[index],
                                size: 37,
                                color: Colors.amber[200],
                              ),
                              SizedBox(height: 2),
                              Text(
                                texticon[index],
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),



          SizedBox(height: 30,),
          //featured restaurants

            Container(
            margin: EdgeInsets.only(left: 15),
            child: Text(
                'Featured Restaurants',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                  ),
                )


            ),
          ),
            SizedBox(height: 15,),




            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),

              child: Row(
                children: [
                  // Container 1
                  Container(
                    width: 340,
                    height: 290,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(

                     // color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // img Container
                        Center(
                          child: Container(
                            width: 300,
                            height: 180,
                          //  margin: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(13),
                              image: DecorationImage(
                                image: AssetImage("assets/images/tinbox.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),

                        // txt Container
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6.0),
                          child: Column(
                            children: [
                              Center(
                                child: Text("Restaurant Name",style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500
                                  ),
                                )
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('pizza ', style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.grey,
                                  fontSize: 12,
                                  //fontWeight: FontWeight.w300
                                          ),
                                       )
                                 ),
                                  SizedBox(width: 10,),
                                  Text('pizza ', style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.grey,
                                       fontSize: 12,
                                      //fontWeight: FontWeight.w300
                                    ),
                                  )
                                  ),
                                ],
                              ),


                              SizedBox(height: 10,),


                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 47,

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.lime[700],
                                    ),
                                    child: Center(
                                      child: Text('4.5',  style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500
                                        ),
                                      )),
                                    ),
                                  ),
                                  SizedBox(width: 12,),
                                  Text('50 min away from you',  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      //fontWeight: FontWeight.w300
                                    ),
                                  )),


                                ],


                              )
                            ],
                          )
                        ),
                      ],
                    ),
                  ),






                  // Container 2
                  Container(
                    width: 340,
                    height: 290,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // img Container
                        Center(
                          child: Container(
                            width: 300,
                            height: 180,
                            //  margin: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(13),
                              image: DecorationImage(
                                image: AssetImage("assets/images/tinbox.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),

                        // txt Container
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.0),
                            child: Column(
                              children: [
                                Center(
                                  child: Text("Restaurant Name",style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500
                                    ),
                                  )
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('pizza ', style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        //fontWeight: FontWeight.w300
                                      ),
                                    )
                                    ),
                                    SizedBox(width: 10,),
                                    Text('pizza ', style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        //fontWeight: FontWeight.w300
                                      ),
                                    )
                                    ),
                                  ],
                                ),


                                SizedBox(height: 10,),


                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 47,

                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.lime[700],
                                      ),
                                      child: Center(
                                        child: Text('4.5',  style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500
                                          ),
                                        )),
                                      ),
                                    ),
                                    SizedBox(width: 12,),
                                    Text('50 min away from you',  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        //fontWeight: FontWeight.w300
                                      ),
                                    )),


                                  ],


                                )
                              ],
                            )
                        ),
                      ],
                    ),
                  ),

                  // Container 3
                  Container(
                    width: 340,
                    height: 290,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // img Container
                        Center(
                          child: Container(
                            width: 300,
                            height: 180,
                            //  margin: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(13),
                              image: DecorationImage(
                                image: AssetImage("assets/images/tinbox.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),

                        // txt Container
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.0),
                            child: Column(
                              children: [
                                Center(
                                  child: Text("Restaurant Name",style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500
                                    ),
                                  )
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('pizza ', style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        //fontWeight: FontWeight.w300
                                      ),
                                    )
                                    ),
                                    SizedBox(width: 10,),
                                    Text('pizza ', style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        //fontWeight: FontWeight.w300
                                      ),
                                    )
                                    ),
                                  ],
                                ),


                                SizedBox(height: 10,),


                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 47,

                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.lime[700],
                                      ),
                                      child: Center(
                                        child: Text('4.5',  style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500
                                          ),
                                        )),
                                      ),
                                    ),
                                    SizedBox(width: 12,),
                                    Text('50 min away from you',  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        //fontWeight: FontWeight.w300
                                      ),
                                    )),


                                  ],


                                )
                              ],
                            )
                        ),
                      ],
                    ),
                  ),

                  // Container 4
                  Container(
                    width: 340,
                    height: 290,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // img Container
                        Center(
                          child: Container(
                            width: 300,
                            height: 180,
                            //  margin: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(13),
                              image: DecorationImage(
                                image: AssetImage("assets/images/tinbox.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),

                        // txt Container
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.0),
                            child: Column(
                              children: [
                                Center(
                                  child: Text("Restaurant Name",style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500
                                    ),
                                  )
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('pizza ', style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        //fontWeight: FontWeight.w300
                                      ),
                                    )
                                    ),
                                    SizedBox(width: 10,),
                                    Text('pizza ', style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        //fontWeight: FontWeight.w300
                                      ),
                                    )
                                    ),
                                  ],
                                ),


                                SizedBox(height: 10,),


                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 47,

                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.lime[700],
                                      ),
                                      child: Center(
                                        child: Text('4.5',  style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500
                                          ),
                                        )),
                                      ),
                                    ),
                                    SizedBox(width: 12,),
                                    Text('50 min away from you',  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        //fontWeight: FontWeight.w300
                                      ),
                                    )),


                                  ],


                                )
                              ],
                            )
                        ),
                      ],
                    ),
                  ),
                ],

            )
            ),









        SizedBox(height: 20,),

          //restaurants here from highest rating max 7

          Container(
            margin: EdgeInsets.only(left: 18),
            child: Text('Quick Picks', style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 14,

            ),),

          ),
          SizedBox(height: 15,),
          RestaurantPicks(),
          SizedBox(height: 25,),
















        ],







      ),


    );
  }


}
