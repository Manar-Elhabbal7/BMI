import 'package:bmi/result.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen2 extends StatefulWidget {
  final String gender;

  const Screen2({required this.gender, super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  int weight = 45;
  int height = 160;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: screenHeight * 0.05,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height :20),
              Row(
                
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    color: Colors.lightGreen,
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  Expanded(
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
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
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.12),
                ],
              ),

              SizedBox(height: screenHeight * 0.04),

              Text(
                'Please modify the values',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  color: Colors.black87,
                  fontSize: screenHeight * 0.025,
                  fontWeight: FontWeight.w700,
                ),
              ),

              SizedBox(height: screenHeight * 0.02),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildStepperCard(
                    label: "Weight",
                    unit: 'kg',
                    value: weight,
                    width: screenWidth * 0.42,
                    height: screenHeight * 0.28,
                    onIncrement: () {
                      setState(() {
                        if (weight < 300) weight++;
                      });
                    },
                    onDecrement: () {
                      setState(() {
                        if (weight > 1) weight--;
                      });
                    },
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  _buildStepperCard(
                    label: "Age",
                    unit: 'years',
                    value: age,
                    width: screenWidth * 0.42,
                    height: screenHeight * 0.28,
                    onIncrement: () {
                      setState(() {
                        if (age < 100) age++;
                      });
                    },
                    onDecrement: () {
                      setState(() {
                        if (age > 1) age--;
                      });
                    },
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.03),

              Text(
                'Height',
                style: GoogleFonts.roboto(
                  color: Colors.grey[600],
                  fontSize: screenHeight * 0.018,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: screenHeight * 0.015),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    height.toString(),
                    style: GoogleFonts.roboto(
                      fontSize: screenHeight * 0.07,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFCE922A),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: screenHeight * 0.01),
                    child: Text(
                      ' cm',
                      style: GoogleFonts.roboto(
                        fontSize: screenHeight * 0.022,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ],
              ),

              Slider(
                value: height.toDouble(),
                min: 50,
                max: 200,
                activeColor: Colors.lightGreen,
                inactiveColor: Colors.grey[300],
                onChanged: (value) {
                  setState(() {
                    height = value.toInt();
                  });
                },
              ),

              SizedBox(height: screenHeight * 0.025),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, screenHeight * 0.07),
                  backgroundColor: Colors.lightGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierColor: Colors.black.withOpacity(0.3),
                    builder: (BuildContext context) {
                      return CustomDialog(
                        height: height,
                        age: age,
                        weight: weight,
                        gender: widget.gender,
                      );
                    },
                  );
                },
                child: Text(
                  'Calculate',
                  style: GoogleFonts.roboto(
                    fontSize: screenHeight * 0.025,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildStepperCard({
  required String label,
  required String unit,
  required int value,
  required double width,
  required double height,
  required VoidCallback onIncrement,
  required VoidCallback onDecrement,
}) {
  return Container(
    width: width,
    height: height,
    padding: EdgeInsets.symmetric(
      vertical: height * 0.1 * 0.2, 
      horizontal: width * 0.05,
    ),
    decoration: BoxDecoration(
      color: Colors.white38,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.grey.shade300, width: 1),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: GoogleFonts.roboto(
            color: Colors.grey[700],
            fontSize: height * 0.07,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: height * 0.05),
        Text(
          value.toString(),
          style: GoogleFonts.roboto(
            fontSize: height * 0.25,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFCE922A),
          ),
        ),
        Text(
          unit,
          style: GoogleFonts.roboto(
            color: Colors.grey[500],
            fontSize: height * 0.05,
          ),
        ),
        SizedBox(height: height * 0.07),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onDecrement,
              child: Container(
                width: width * 0.15,
                height: height * 0.15,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.remove,
                    color: Colors.grey[800], size: height * 0.12),
              ),
            ),
            SizedBox(width: width * 0.08),
            GestureDetector(
              onTap: onIncrement,
              child: Container(
                width: width * 0.15,
                height: height * 0.15,
                decoration: BoxDecoration(
                  color: const Color(0xFFCE922A),
                  borderRadius: BorderRadius.circular(12),
                ),
                child:
                    Icon(Icons.add, color: Colors.white, size: height * 0.12),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
