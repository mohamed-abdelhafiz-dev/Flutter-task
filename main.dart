import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeView());
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsGeometry.only(bottom: 34, top: 83),
                child: PortfolioImage(),
              ),
              CustomText(
                text: 'Hi, I am John,\n Creative Technologist',
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 24),
              CustomText(
                text:
                    'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 24),
              CustomMaterialButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.green,
                      content: Text('Downloading Resume...'),
                    ),
                  );
                },
                text: 'Download Resume',
                textStyle: GoogleFonts.heebo(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
  });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.heebo(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: Color(0xff21243D),
      ),
    );
  }
}

class PortfolioImage extends StatelessWidget {
  const PortfolioImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('lib/assets/images/floppa.jpg'),
          fit: BoxFit.fill,
        ),
        boxShadow: [
          BoxShadow(color: Color(0xffe0f4fa), offset: Offset(-3, 10)),
        ],
      ),
    );
  }
}

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textStyle,
    this.maxWidth = false,
    this.padding,
    this.color,
    this.side,
    this.borderRadius,
  });

  final VoidCallback onPressed;
  final String text;
  final TextStyle? textStyle;
  final bool maxWidth;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final BorderSide? side;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color ?? Color(0xffFF6464),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      minWidth: maxWidth ? double.infinity : null,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadiusGeometry.circular(4),
        side: side ?? BorderSide.none,
      ),
      padding:
          padding ?? EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 12),
      onPressed: onPressed,
      child: Text(text, style: textStyle),
    );
  }
}
