import 'package:flutter/material.dart';

class HomePost extends StatelessWidget {
  const HomePost({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.rotate(
                      angle: 3.14 * 3 / 2,
                      child: const Icon(Icons.push_pin,
                          color: Color.fromARGB(255, 72, 137, 212)),
                    ),
                    const SizedBox(width: 8.0),
                    const Text(
                      'Pinned Posts',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                        color: Color.fromARGB(255, 72, 137, 212),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: Color.fromARGB(255, 244, 242, 242),
                  thickness: 2.0,
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          itemCount: 10,
          itemBuilder: (context, index) {
            return PostItem(
              profileImagePath: 'assets/images/profile.jpg',
              name: 'Management',
              date: 'Oct ${index + 1}, 2024',
              caption: 'Changes in our safety policy',
              postImagePath: 'assets/images/post.jpg',
              groupName: 'Updates',
            );
          },
        ),
      ],
    );
  }
}

class PostItem extends StatelessWidget {
  final String profileImagePath;
  final String name;
  final String date;
  final String caption;
  final String postImagePath;
  final String groupName;

  const PostItem({
    required this.profileImagePath,
    required this.name,
    required this.date,
    required this.caption,
    required this.postImagePath,
    required this.groupName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(profileImagePath),
                      radius: 25.0,
                    ),
                    const SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            const SizedBox(width: 4.0),
                            const Icon(
                              Icons.arrow_right_sharp,
                              size: 30.0,
                              color: Color.fromARGB(255, 148, 148, 148),
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              groupName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          date,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 141, 139, 139),
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Transform.rotate(
                  angle: 3.14 * 3 / 2,
                  child: const Icon(
                    Icons.more_vert,
                    size: 40.0,
                    color: Color.fromARGB(255, 148, 148, 148),
                  ),
                ),
              ],
            ),
          ),
          // Caption
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(caption),
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              postImagePath,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
