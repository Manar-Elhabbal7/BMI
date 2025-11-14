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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.orangeAccent,
                          ),
                        ),
                        Text(
                          'Calculator',
                          style: GoogleFonts.roboto(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 48),
              ],
            ),

            const SizedBox(height: 30),

            Text(
              'Please modify the values',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 13),

            Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 220,
                      height: 212,
                      child: _buildStepperCard(
                        label: "Weight",
                        unit: 'kg',
                        value: weight,
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
                    ),

                    const SizedBox(width: 13),

                    SizedBox(
                      width: 220,
                      height: 212,
                      child: _buildStepperCard(
                        label: 'Age',
                        unit: 'years',
                        value: age,
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
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                Column(
                  children: [
                    Text(
                      'Height',
                      style: GoogleFonts.roboto(
                        color: Colors.grey[600],
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          height.toString(),
                          style: GoogleFonts.roboto(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFCE922A),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            ' cm',
                            style: GoogleFonts.roboto(
                              fontSize: 18,
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

                    const SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 55),
                        backgroundColor: Colors.lightGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                         showDialog(context: context,
                          barrierColor: Colors.black.withOpacity(0.3),
                          builder: (BuildContext context) {
                            return CustomDialog(
                              height: height,
                               age: age,
                               weight: weight,
                              gender:widget.gender ); 
                          },            
                        );
                      },
                      child: Text(
                        'Calculate',
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildStepperCard({
  required String label,
  required String unit,
  required int value,
  required VoidCallback onIncrement,
  required VoidCallback onDecrement,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
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
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: GoogleFonts.roboto(
            color: Colors.grey[700],
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 10),

        Text(
          value.toString(),
          style: GoogleFonts.roboto(
            fontSize: 45,
            fontWeight: FontWeight.bold,
            color: Color(0xFFCE922A),
          ),
        ),

        Text(
          unit,
          style: GoogleFonts.roboto(color: Colors.grey[500], fontSize: 13),
        ),

        const SizedBox(height: 15),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onDecrement,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.remove, color: Colors.grey[800], size: 22),
              ),
            ),

            const SizedBox(width: 16),

            GestureDetector(
              onTap: onIncrement,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xFFCE922A),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 22),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
