import 'package:flutter/material.dart';
import 'package:postmania/pages/post_info.dart';
import 'package:postmania/widgets/actions_bar.dart';

class PostTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final String content;
  final String timestamp;
  final String author;
  final String authorImage;

  const PostTile({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.content,
    required this.timestamp,
    required this.author,
    required this.authorImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 430,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.grey.shade200,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image Container
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.asset(
                  imagePath,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Title Container
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(authorImage),
                        radius: 12,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(author),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Text(timestamp),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            // Text Content Container
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                content,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            // Actions Bar
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: ActionsBar(),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostInfo(
                          imagePath: imagePath,
                          title: title,
                          content: content,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 54,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border:
                          Border.all(color: const Color(0xFFC017FF), width: 2),
                    ),
                    child: const Center(
                      child: Text(
                        "Read More",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
