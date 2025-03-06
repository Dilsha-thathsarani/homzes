import 'package:flutter/material.dart';
import "./catalog_screen.dart";

class HomzesApp extends StatelessWidget {
  const HomzesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.7),
                BlendMode.darken,
              ),
              child: Image.asset(
                'assets/images/house.png',
                fit: BoxFit.cover,
              ),
            ),

            // Header
            Positioned(
              top: 40,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Homzes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.menu, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),

            // Split title into two lines
            const Positioned(
              bottom: 300,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text(
                    'Find the best',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'place for you',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Bottom Sheet
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  children: [
                    // Horizontal scroll for option cards
                    SizedBox(
                      height: 150,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildOptionCard(
                            icon: Icons.chair_outlined,
                            label: 'Rent',
                            color: const Color(0xFFFFF4E0),
                          ),
                          const SizedBox(width: 20),
                          _buildOptionCard(
                            icon: Icons.business_outlined,
                            label: 'Buy',
                            color: const Color(0xFFFFFFB0),
                          ),
                          const SizedBox(width: 20),
                          _buildOptionCard(
                            icon: Icons.business_outlined,
                            label: 'Sell',
                            color: const Color(0xFFE0FFF4),
                          ),
                          const SizedBox(width: 20),
                          _buildOptionCard(
                            icon: Icons.home_outlined,
                            label: 'Mortgage',
                            color: const Color(0xFFE0F4FF),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to CatalogScreen when button is pressed
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CatalogScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[600],
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 0, // Remove shadow
                        ),
                        child: const Text(
                          'Create an account',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          // Icon at the top-left
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 25),
            ),
          ),
          // Text at the bottom-left
          Positioned(
            bottom: 10,
            left: 15,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
