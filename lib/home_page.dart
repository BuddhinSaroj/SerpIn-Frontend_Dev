import 'package:flutter/material.dart';

import 'Services/service.dart';

// void main() {
//   runApp(const MaterialApp(
//     home: RecentPostsCarousel(
//       posts: [],
//     ),
//   ));
// }

class RecentPostsCarousel extends StatefulWidget {
  final List<Post> posts;

  const RecentPostsCarousel({super.key, required this.posts});

  @override
  _RecentPostsCarouselState createState() => _RecentPostsCarouselState();
}

class _RecentPostsCarouselState extends State<RecentPostsCarousel> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 200,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFAFEFF), Color(0xFFABFFDC)],
          ),
        ),
        child: PageView.builder(
          controller: _pageController,
          itemCount: widget.posts.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        //backgroundImage: AssetImage('assets/profile.png'),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        widget.posts[index].userName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Image.asset(
                        widget.posts[index].postImage,
                        height: 80,
                        width: 80,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          widget.posts[index].postDetails,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
