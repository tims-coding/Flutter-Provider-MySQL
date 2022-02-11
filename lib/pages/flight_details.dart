import 'package:flutter/material.dart';
import 'package:flutter_node_api/models/post_model.dart';
import 'package:google_fonts/google_fonts.dart';

class FlightDetails extends StatelessWidget {
  final Post post;
  const FlightDetails({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flight Details")),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/flight_background3.png"),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.only(top: 300.0),
          child: Container(
            height: 500,
            child: GridView.count(
              childAspectRatio: 6 / 2,
              primary: false,
              crossAxisSpacing: 10,
              mainAxisSpacing: 0,
              crossAxisCount: 2,
              children: <Widget>[
                ListTile(
                  title: Text(
                    "Flight",
                    style: GoogleFonts.poppins(),
                  ),
                  subtitle: Text(
                    "UA177",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Flight Status",
                    style: GoogleFonts.poppins(),
                  ),
                  subtitle: Text(
                    "Delayed",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Seat",
                    style: GoogleFonts.poppins(),
                  ),
                  subtitle: Text(
                    "B13",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                ListTile(
                  title: Text(
                    "",
                    style: GoogleFonts.poppins(),
                  ),
                  subtitle: Text(
                    "",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Departure",
                    style: GoogleFonts.poppins(),
                  ),
                  subtitle: Text(
                    "4:30pm ET",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Arrival",
                    style: GoogleFonts.poppins(),
                  ),
                  subtitle: Text(
                    "8:00pm ET",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Denver, Colorado",
                    style: GoogleFonts.poppins(),
                  ),
                  subtitle: Text(
                    "Gat C6",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Atalanta, Georgia",
                    style: GoogleFonts.poppins(),
                  ),
                  subtitle: Text(
                    "Gate B15",
                    style: GoogleFonts.poppins(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
