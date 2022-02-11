import 'package:flutter/material.dart';
import 'package:flutter_node_api/pages/flight_details.dart';
import 'package:flutter_node_api/models/post_model.dart';
import 'package:google_fonts/google_fonts.dart';

class PostDetail extends StatefulWidget {
  final Post post;
  const PostDetail({Key? key, required this.post}) : super(key: key);

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  String bowlImage = '';

  @override
  Widget build(BuildContext context) {
    if (widget.post.package == "Rose Bowl") {
      setState(() {
        bowlImage = 'assets/rose_bowl.png';
      });
    } else if (widget.post.package == "Fiesta Bowl") {
      setState(() {
        bowlImage = 'assets/fiesta_bowl.png';
      });
    } else if (widget.post.package == "Orange Bowl") {
      setState(() {
        bowlImage = 'assets/orange_bowl.png';
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              elevation: 5,
              child: Column(
                children: [
                  Image.asset(bowlImage, scale: 6),
                  ListTile(
                    title: Text(
                      "ID",
                      style: GoogleFonts.poppins(),
                    ),
                    subtitle: Text(
                      widget.post.id,
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Name",
                      style: GoogleFonts.poppins(),
                    ),
                    subtitle: Text(
                      widget.post.name,
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Package",
                      style: GoogleFonts.poppins(),
                    ),
                    subtitle: Text(
                      widget.post.package,
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Guests",
                      style: GoogleFonts.poppins(),
                    ),
                    subtitle: Text(
                      widget.post.guests.toString(),
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => FlightDetails(post: widget.post))),
              child: Material(
                elevation: 5,
                child: Container(
                  color: Colors.blue,
                  height: 50,
                  width: MediaQuery.of(context).size.width - 5,
                  child: Center(
                    child: Text(
                      "Check Flight Details",
                      style: GoogleFonts.poppins(
                          fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
