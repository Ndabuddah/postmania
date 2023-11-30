import 'package:flutter/material.dart';
import 'package:postmania/api/post_api_services.dart';
import 'package:postmania/models/postmodels.dart';
import 'package:postmania/ui/post_tile.dart';
import 'package:postmania/widgets/custom_appbar.dart';
import 'package:postmania/widgets/custom_nav_bar.dart';
import 'package:postmania/widgets/search_bar.dart';

class PostsList extends StatefulWidget {
  const PostsList({Key? key}) : super(key: key);

  @override
  _PostsListState createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  int _currentIndex = 0;
  int _currentPage = 1;

  final List<Post> dummyPosts = [
    Post(
      imagePath: 'assets/images/img1.png',
      title: 'Cats! Cats! Cats!',
      content: 'Earths oceans, spanning across vast expanses and plunging to incredible depths',
      timestamp: '1 hour ago',
      author: 'John Doe',
      authorImage: 'assets/images/auth1.png',
    ),
    Post(
      imagePath: 'assets/images/img2.png',
      title: 'Deep Blue',
      content: 'Cats, with their mysterious eyes and graceful movements..',
      timestamp: '2 hours ago',
      author: 'Jane Smith',
      authorImage: 'assets/images/auth2.png',
    ),
  ];

  Future<List<Post>> fetchData() async {
    try {
      // Fetch data from API with pagination
      List<Post> apiPosts = await PostApiService().getPosts(page: _currentPage);

      // Combine API data with dummy data
      List<Post> combinedData = [...dummyPosts, ...apiPosts];

      return combinedData;
    } catch (e) {
      print('Error fetching data: $e');
      return dummyPosts; // dummy data on error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 56,
            child: FutureBuilder<List<Post>>(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text('No data available');
                } else {
                  List<Post> displayPosts = snapshot.data!;

                  return ListView.builder(
                    itemCount: displayPosts.length,
                    itemBuilder: (context, index) {
                      if (index == displayPosts.length - 1) {
                        // Reached the end of the list, load more data
                        _currentPage++;
                        fetchData();
                      }
                      return PostTile(
                        imagePath: displayPosts[index].imagePath,
                        title: displayPosts[index].title,
                        content: displayPosts[index].content,
                        timestamp: displayPosts[index].timestamp,
                        author: displayPosts[index].author,
                        authorImage: displayPosts[index].authorImage,
                      );
                    },
                  );
                }
              },
            ),
          ),
          Positioned(
            top: const CustomAppBar().preferredSize.height,
            left: 0,
            right: 0,
            child: const Search_Bar(),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomBottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
