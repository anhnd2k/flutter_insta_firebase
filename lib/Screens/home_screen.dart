import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: List.generate(
                1,
                (index) => const PostItem(
                      name: 'posts[index]["name"]',
                      profileImg:
                          'https://scontent.fhan5-2.fna.fbcdn.net/v/t39.30808-6/322008412_1337631317066980_3890455477156250928_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=FItW1FY4mFAAX8OMJeq&_nc_ht=scontent.fhan5-2.fna&oh=00_AfCWYxVMndnyfUYopgxCaU9YANlHF7FYRzAMa-RIDaDDww&oe=63DD33CD',
                      postImg:
                          'https://scontent.fhan5-2.fna.fbcdn.net/v/t39.30808-6/322008412_1337631317066980_3890455477156250928_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=FItW1FY4mFAAX8OMJeq&_nc_ht=scontent.fhan5-2.fna&oh=00_AfCWYxVMndnyfUYopgxCaU9YANlHF7FYRzAMa-RIDaDDww&oe=63DD33CD',
                      caption: 'posts[index]["caption"]',
                      isLoved: true,
                      commentCount: 'posts[index]["commentCount"]',
                      likedBy: 'posts[index]["likedBy"]',
                      timeAgo: 'posts[index]["timeAgo"]',
                    )),
          ),
        ),
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  final String name;
  final String profileImg;
  final String postImg;
  final String caption;
  final bool isLoved;
  final String commentCount;
  final String likedBy;
  final String timeAgo;

  const PostItem(
      {Key? key,
      required this.name,
      required this.profileImg,
      required this.postImg,
      required this.caption,
      required this.commentCount,
      required this.isLoved,
      required this.likedBy,
      required this.timeAgo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                          image: DecorationImage(
                              image: NetworkImage(profileImg),
                              fit: BoxFit.cover)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                "...",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          // width: double.infinity,
          height: 400,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(postImg), fit: BoxFit.cover)),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5, left: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 55,
                    child: InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        isLoved
                            ? "assets/images/loved_icon.svg"
                            : "assets/images/love_icon.svg",
                        width: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 55,
                    child: InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        "assets/images/comment_icon.svg",
                        width: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 55,
                    child: InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        "assets/images/message_icon.svg",
                        width: 30,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 55,
                child: InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(
                    "assets/images/save_icon.svg",
                    width: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: RichText(
              text: TextSpan(children: [
            const TextSpan(
              text: "Like by ",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            TextSpan(
              text: "$likedBy",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const TextSpan(
              text: " and outher",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ])),
        ),
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
              text: "$name",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: "$caption",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ])),
        ),
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
              text: "View $commentCount comments",
              style: const TextStyle(fontSize: 15, color: Colors.white),
            ),
          ])),
        ),
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://scontent.fhan5-2.fna.fbcdn.net/v/t39.30808-6/322008412_1337631317066980_3890455477156250928_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=FItW1FY4mFAAX8OMJeq&_nc_ht=scontent.fhan5-2.fna&oh=00_AfCWYxVMndnyfUYopgxCaU9YANlHF7FYRzAMa-RIDaDDww&oe=63DD33CD'),
                              fit: BoxFit.cover)),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Thêm bình luận...",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      "😍",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "🤩",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.add_circle,
                      color: Colors.white,
                      size: 18,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            children: [
              Text(
                "$timeAgo",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
