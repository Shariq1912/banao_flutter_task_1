import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgramCard extends StatelessWidget {
  final String imagePath;
  final String? category;
  final String title;
  //final String subtitle;
  final String lessons;

  const ProgramCard({
    required this.imagePath,
    required this.category,
    required this.title,
    //required this.subtitle,
    required this.lessons,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        child: SizedBox(
          width: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 250,
                height: 140,
                child: Image.asset(imagePath,fit: BoxFit.cover,),

              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  category!,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xff598BED),
                  ),
                  
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 17,
                    
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(margin: EdgeInsets.all(10),
                child: Text(
                  lessons,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),

    );
  }
}
