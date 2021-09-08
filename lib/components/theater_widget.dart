import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musical_app/model/db.dart';

class TheaterList extends StatelessWidget {
  final Db? db;
  const TheaterList({Key? key, this.db}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: 150,
            height: 200,
            child: Image.network(
              db!.poster!,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 150,
            padding: EdgeInsets.only(left: 10, right: 10, top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    db!.prfnm!,
                    style: GoogleFonts.sunflower(fontSize: 20),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
