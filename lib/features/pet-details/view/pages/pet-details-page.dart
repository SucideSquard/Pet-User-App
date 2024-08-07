import 'package:flutter/material.dart';
import 'package:user_app/core/constants/colors.dart';
import 'package:user_app/core/widgets/custom-carousal.dart';

class PetDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Handle menu button press
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            const CarouselImage(
              imgList: [
                'https://images.pexels.com/photos/1170986/pexels-photo-1170986.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                'https://wallpapers.com/images/hd/cat-pictures-zc3gu0636kmldm04.jpg',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2QiJBqXzzNkFaqrtX3-H2GIQO5nisXZ6ATQg97evkg2wXvylyHs79uYU_9u_jFIBVxbE&usqp=CAU',
              ],
              carouselHeight: 350,
              carouselViewportFraction: 0.95,
              height: 350,
            ),

            // Pet Information Section
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pixie Bob',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Age - 5 Months',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),

                  // Gender Selection
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            // Handle male selection
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: ThemeColors.primary,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            side: const BorderSide(color: Colors.grey),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            'MALE',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            // Handle female selection
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            side: const BorderSide(color: Colors.grey),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            'LADY',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Details Section
                  const Text(
                    'Details',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'There are many variations of passages of Lorem Ipsum available, but the majority have suffered',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 16),

                  // Price Section
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          // Image.asset(
                          //     'assets/ribbon.png'), // Replace with your ribbon image path
                          Text(
                            '\$185',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Add to Basket Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Handle add to basket action
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ThemeColors.primary,
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Row(
                          children: [
                            Text(
                              'ADD TO YOUR BASKET',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Icon(
                              Icons.shop_2,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
