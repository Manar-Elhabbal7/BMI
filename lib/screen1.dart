import 'package:bmi/screen2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  Color selected = Colors.green;
  String gender = 'Male';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenHeight * 0.03),
          child: Column(
            children: [
              // Expanded makes the content scrollable if too tall
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'BMI ',
                            style: GoogleFonts.roboto(
                              fontSize: screenHeight * 0.035,
                              fontWeight: FontWeight.bold,
                              color: Colors.orangeAccent,
                            ),
                          ),
                          Text(
                            'Calculator',
                            style: GoogleFonts.roboto(
                              fontSize: screenHeight * 0.035,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightGreen,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      Text(
                        'Please choose your gender',
                        style: GoogleFonts.roboto(
                          color: Colors.black87,
                          fontSize: screenHeight * 0.02,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      GenderCard(
                        imagePath: 'assets/male.png',
                        height: screenHeight * 0.25,
                        onTap: () {
                          setState(() {
                            selected = const Color(0xFF22689E);
                            gender = "Male";
                          });
                        },
                      ),
                      SizedBox(height: screenHeight * 0.025),
                      GenderCard(
                        imagePath: 'assets/female.png',
                        height: screenHeight * 0.25,
                        onTap: () {
                          setState(() {
                            selected = const Color(0xFFFF6757);
                            gender = "Female";
                          });
                        },
                      ),
                      SizedBox(height: screenHeight * 0.04),
                    ],
                  ),
                ),
              ),

              // Button pinned at the bottom
              SizedBox(
                width: double.infinity,
                height: screenHeight * 0.065,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selected,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Screen2(gender: gender),
                      ),
                    );
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenHeight * 0.022,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03), // bottom padding
            ],
          ),
        ),
      ),
    );
  }
}

class GenderCard extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;
  final double height;

  const GenderCard({
    super.key,
    required this.imagePath,
    required this.onTap,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Image.asset(imagePath, fit: BoxFit.cover),
      ),
    );
  }
}
