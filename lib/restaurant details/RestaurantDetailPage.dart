import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home/HomePage.dart';

class RestaurantDetailPage extends StatefulWidget {
  const RestaurantDetailPage({Key? key}) : super(key: key);

  @override
  _RestaurantDetailPageState createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  final TextEditingController _commentController = TextEditingController();
  double _userRating = 0;
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, dynamic>> _comments = [
    {
      'name': 'Sarah K.',
      'rating': 5.0,
      'comment': 'Amazing food and atmosphere! The crepes were delicious.',
      'date': '2 days ago'
    },
    {
      'name': 'Ahmed M.',
      'rating': 4.5,
      'comment': 'Great service, but the waiting time was a bit long.',
      'date': '1 week ago'
    },
    {
      'name': 'Leila B.',
      'rating': 5.0,
      'comment': 'Best restaurant in the city! Highly recommended.',
      'date': '2 weeks ago'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.grey[50],
      backgroundColor: Colors.white,

      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Image Section
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Restaurant Image
                    Container(
                      height: 300,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/tinbox.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Top Buttons
                    Positioned(
                      top: 40,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: IconButton(
                                icon: Icon(Icons.arrow_back, color: Colors.lime[800]),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => HomePage()),
                                  );
                                },

                              ),
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                    icon: Icon(Icons.favorite_border, color: Colors.lime[800]),
                                    onPressed: () {},
                                  ),
                                ),
                                const SizedBox(width: 8),
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                    icon: Icon(Icons.share, color: Colors.lime[800]),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Restaurant Info Card
                    Positioned(
                      bottom: -80,
                      left: 16,
                      right: 16,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'TinBox Restaurant',
                              style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber[200]),
                                Text(' 4.5 (128 reviews)',
                                    style: GoogleFonts.poppins()),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _buildQuickInfoItem(Icons.access_time, 'Open Now'),
                                _buildQuickInfoItem(Icons.location_on, '1.2 km'),
                                _buildQuickInfoItem(Icons.motorcycle, '15-20 min'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
               
                const SizedBox(height: 100),
                // Rest of the content
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoSection(),
                      const SizedBox(height: 24),
                      _buildMenuSection(),
                      const SizedBox(height: 24),
                      _buildReviewsSection(),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildCommentInput(),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickInfoItem(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, color: Colors.lime[800]),
        const SizedBox(height: 4),
        Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Information',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.lime[800],
            )),
        const SizedBox(height: 8),
        _buildInfoItem(Icons.phone, '+213 555 123 456'),
        _buildInfoItem(Icons.location_on, '123 Main Street, Algiers'),
        _buildInfoItem(Icons.access_time, 'Open: 9:00 AM - 11:00 PM'),
        _buildInfoItem(Icons.info_outline, 'Western cuisine specializing in crepes'),
      ],
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.lime[800]),
          const SizedBox(width: 8),
          Text(text, style: GoogleFonts.poppins()),
        ],
      ),
    );
  }

  Widget _buildMenuSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Menu',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.lime[800],
            )),
        const SizedBox(height: 16),
        _buildMenuItem('Sweet Crepes', '350 DZD',
            'Classic crepe with honey and orange'),
        _buildMenuItem('Savory Crepes', '450 DZD',
            'Chicken and mushroom filling'),
        _buildMenuItem('Special Crepes', '550 DZD',
            'Nutella with fresh fruits'),
      ],
    );
  }

  Widget _buildMenuItem(String name, String price, String description) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
              Text(price,
                  style: GoogleFonts.poppins(color: Colors.lime[800])),
            ],
          ),
          const SizedBox(height: 8),
          Text(description, style: GoogleFonts.poppins()),
        ],
      ),
    );
  }

  Widget _buildReviewsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Reviews',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.lime[800],
            )),
        const SizedBox(height: 16),
        ..._comments.map((comment) => _buildReviewItem(comment)).toList(),
      ],
    );
  }

  Widget _buildReviewItem(Map<String, dynamic> comment) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(comment['name'],
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
              Text(comment['date'], style: GoogleFonts.poppins()),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: List.generate(
              5,
                  (index) => Icon(
                index < comment['rating'] ? Icons.star : Icons.star_border,
                color: Colors.amber[200],
                size: 20,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(comment['comment'], style: GoogleFonts.poppins()),
        ],
      ),
    );
  }

  Widget _buildCommentInput() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: List.generate(
              5,
                  (index) => IconButton(
                icon: Icon(
                  index < _userRating ? Icons.star : Icons.star_border,
                  color: Colors.amber[200],
                ),
                onPressed: () {
                  setState(() {
                    _userRating = index + 1.0;
                  });
                },
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _commentController,
                  decoration: InputDecoration(
                    hintText: 'Add a review...',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                    ),
                    border: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.lime,
                        width: 2,
                      ),

                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: Icon(Icons.send_rounded, color: Colors.lime[800]),
                onPressed: () {
                  if (_commentController.text.isNotEmpty) {
                    setState(() {
                      _comments.insert(0, {
                        'name': 'You',
                        'rating': _userRating,
                        'comment': _commentController.text,
                        'date': 'Just now'
                      });
                      _commentController.clear();
                      _userRating = 0;
                    });
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
