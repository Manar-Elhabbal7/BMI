import 'dart:ui'; 
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDialog extends StatelessWidget {
  final int height;
  final int weight;
  final int age;
  final String gender;

  const CustomDialog({
    Key? key,
    required this.height,
    required this.weight,
    required this.age,
    required this.gender,
  }) : super(key: key);

  
  double calculateBMI() {
    double heightInMeters = height / 100;
    return weight / (heightInMeters * heightInMeters);
  }

  
  String getBMICategory() {
    double bmi = calculateBMI();
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 25) return 'Normal';
    if (bmi < 30) return 'Overweight';
    return 'Obese';
  }

  Color getCategoryColor() {
    double bmi = calculateBMI();
    if (bmi < 18.5) return Colors.blue;
    if (bmi < 25) return Colors.green;
    if (bmi < 30) return Colors.orange;
    return Colors.red;
  }

  
  String getNormalWeightRange() {
    double heightInMeters = height / 100;
    double minWeight = 18.5 * (heightInMeters * heightInMeters);
    double maxWeight = 24.9 * (heightInMeters * heightInMeters);
    return '${minWeight.toStringAsFixed(1)} - ${maxWeight.toStringAsFixed(1)} kg';
  }

  @override
  Widget build(BuildContext context) {
    double bmi = calculateBMI();
    String category = getBMICategory();
    Color categoryColor = getCategoryColor();
    String normalRange = getNormalWeightRange();

    return BackdropFilter( 
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), 
      child: Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          constraints: BoxConstraints(
            maxWidth: 400,
            maxHeight: MediaQuery.of(context).size.height * 0.85,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                
                Text(
                  'Your BMI:',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),

                SizedBox(height: 10),

                
                Text(
                  bmi.toStringAsFixed(1),
                  style: GoogleFonts.roboto(
                    fontSize: 56,
                    fontWeight: FontWeight.bold,
                    color: categoryColor,
                  ),
                ),

                
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: categoryColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    category,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: categoryColor,
                    ),
                  ),
                ),

                SizedBox(height: 16),

                
                _buildBMIScale(bmi),

                SizedBox(height: 16),

                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildSmallInfo('$weight kg', 'Weight'),
                    _buildSmallInfo('$height cm', 'Height'),
                    _buildSmallInfo('$age', 'Age'),
                    _buildSmallInfo(gender, 'Gender'),
                  ],
                ),

                SizedBox(height: 16),

                
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Healthy weight for the height:',
                        style: GoogleFonts.roboto(
                          fontSize: 13,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        normalRange,
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Colors.lightGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Close',
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBMIScale(double bmi) {
    return Column(
      children: [
        Container(
          height: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.cyan,
                Colors.green,
                Colors.lightGreen,
                Colors.yellow,
                Colors.orange,
                Colors.red,
              ],
            ),
          ),
        ),
        SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('15', style: TextStyle(fontSize: 10, color: Colors.grey)),
            Text('18.5', style: TextStyle(fontSize: 10, color: Colors.grey)),
            Text('25', style: TextStyle(fontSize: 10, color: Colors.grey)),
            Text('30', style: TextStyle(fontSize: 10, color: Colors.grey)),
            Text('35', style: TextStyle(fontSize: 10, color: Colors.grey)),
            Text('40', style: TextStyle(fontSize: 10, color: Colors.grey)),
          ],
        ),
      ],
    );
  }


  Widget _buildSmallInfo(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.roboto(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}