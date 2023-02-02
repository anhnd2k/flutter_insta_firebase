import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_insta_firebase/Models/user.dart' as models;
import 'package:flutter_insta_firebase/Providers/user_provider.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  String userName = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserName();
  }

  void getUserName() async {
    // DocumentSnapshot snap = await FirebaseFirestore.instance
    //     .collection('user')
    //     .doc(FirebaseAuth.instance.currentUser!.uid)
    //     .get();

    models.User user = Provider.of<UserProvider>(context).getUser;


    setState(() {
      // userName = (snap.data() as Map<String, dynamic>)!['userName'];
      userName = user.userName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GetBody(nameUser: userName),
    );
  }
}

class GetBody extends StatelessWidget {
  final String nameUser;
  const GetBody({Key? key, required this.nameUser}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://scontent.fhan5-2.fna.fbcdn.net/v/t39.30808-6/322008412_1337631317066980_3890455477156250928_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=FItW1FY4mFAAX8OMJeq&_nc_ht=scontent.fhan5-2.fna&oh=00_AfCWYxVMndnyfUYopgxCaU9YANlHF7FYRzAMa-RIDaDDww&oe=63DD33CD'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                          child: Text(nameUser,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17)))
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Center(
                          child: Column(
                            children: const [
                              Text("20",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                              SizedBox(height: 10),
                              Text("Bài viết",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Column(
                            children: const [
                              Text("20",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                              SizedBox(height: 10),
                              Text("Người theo dõi",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Column(
                            children: const [
                              Text("20",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                              SizedBox(height: 10),
                              Text("Đang theo dõi",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const Divider(
            color: Colors.white,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 10),
              Container(
                width: size.width / 2 - 20,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white)),
                child: const Padding(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  child: Center(
                    child: Text("Chỉnh sửa trang cá nhân",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 13)),
                  ),
                ),
              ),
              Container(
                width: size.width / 2 - 20,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white)),
                child: const Padding(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  child: Center(
                    child: Text("Số lần lưu",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 13)),
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
