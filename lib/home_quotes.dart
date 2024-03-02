import 'package:flutter/material.dart';

class HomeQuotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent, // Make app bar transparent
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: IconButton(
                icon: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    //     shape: BoxShape.circle,
                    borderRadius: BorderRadius.circular(
                        10), // Shape of the container (circle for a rounded background)
                    color: Colors.white, // Background color for the icon
                  ),
                  child: Icon(
                    Icons.star,
                    color: Colors.black, // Color of the crown icon
                  ),
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
        extendBodyBehindAppBar: true, // Extend background behind app bar
        extendBody: true, //

        body: Stack(
          children: [
            // Background image widget (replace with your image fetching logic)
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/simple.jpeg", // Replace with your image path
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Your desired text goes here",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "- Author Name",
                    style: TextStyle(fontSize: 16),
                  ),
                  IconButton(
                    icon: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        //     shape: BoxShape.circle,
                        borderRadius: BorderRadius.circular(
                            10), // Shape of the container (circle for a rounded background)
                        color: Colors.white, // Background color for the icon
                      ),
                      child: Icon(
                        Icons.share,
                        color: Colors.black, // Color of the crown icon
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  // Add functionality for the home button
                },
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // Add functionality for the search button
                },
              ),
              IconButton(
                icon: Icon(Icons.message),
                onPressed: () {
                  // Add functionality for the messaging button
                },
              ),
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {
                  // Add functionality for the notifications button
                },
              ),
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  // Add functionality for the menu button
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
