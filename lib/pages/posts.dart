import 'package:flutter/material.dart';
import 'package:flutter_node_api/pages/flight_details.dart';
import 'package:flutter_node_api/pages/post_detail.dart';
import 'package:flutter_node_api/services/auth_service.dart';
import 'package:flutter_node_api/services/http_service.dart';
import 'package:flutter_node_api/models/post_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PostsPage extends StatefulWidget {
  final String id;
  const PostsPage({required this.id, Key? key}) : super(key: key);

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final HttpService httpService = HttpService();
  final AuthService auth = AuthService();

  Color clickColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    List<Post> posts = Provider.of<List<Post>>(context);
    Post user = posts.firstWhere((user) => user.id == widget.id);
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background_2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 8.0),
              child: Row(
                children: const [
                  Text(
                    "DASHBOARD",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Segoe_ui',
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Color(0xff34daa2),
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 60,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name.toUpperCase(),
                          style: const TextStyle(
                              fontFamily: 'Segoe_ui',
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Text(
                            user.id,
                            style: const TextStyle(
                                fontFamily: 'Segoe_ui',
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                        ),
                        Text(
                          user.package,
                          style: const TextStyle(
                              fontFamily: 'Segoe_ui',
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 25.0, bottom: 5.0),
                  child: Text(
                    "Current Tour",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Segoe_ui',
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PostDetail(post: user)));
              },
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width - 50,
                  height: 100,
                  color: Colors.white,
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Color(0xff34daa2),
                          radius: 35,
                          child: Icon(Icons.sports_basketball,
                              color: Colors.white, size: 35),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              user.package,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontFamily: 'Segoe_ui',
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            const Text(
                              "more info",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: 'Segoe_ui',
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 25.0, bottom: 5.0),
                  child: Text(
                    "Flight Information",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Segoe_ui',
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FlightDetails(
                          post: user,
                        )));
              },
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width - 50,
                  height: 100,
                  color: Colors.white,
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Color(0xff34daa2),
                          radius: 35,
                          child: Icon(Icons.airplanemode_active,
                              color: Colors.white, size: 35),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              "Get FLight Info",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: 'Segoe_ui',
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            Text(
                              "more info",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: 'Segoe_ui',
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 25.0, bottom: 5.0),
                  child: Text(
                    "Available Packages",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Segoe_ui',
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FlightDetails(
                          post: user,
                        )));
              },
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width - 50,
                  height: 100,
                  color: Colors.white,
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Color(0xff34daa2),
                          radius: 35,
                          child: Icon(Icons.shopping_bag,
                              color: Colors.white, size: 35),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              "Buy Package",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: 'Segoe_ui',
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            Text(
                              "more info",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: 'Segoe_ui',
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: () {
                  auth.signOut();
                },
                child: const Text("LOGOUT"))
          ],
        ),
      ),
    );
  }
}
