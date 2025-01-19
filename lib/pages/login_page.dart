import 'package:flutter/material.dart';
import 'package:food/components/my_button.dart';
import 'package:food/components/my_textField.dart';
import 'package:food/services/auth/auth_services.dart';
import 'package:carousel_slider/carousel_slider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // List of image paths/URLs for the slideshow
  final List<String> imagePaths = [
    'lib/images/burgers/cheese_burger.jpg',
    'lib/images/salads/grilled_chicken_ranch.jpg',
    'lib/images/desserts/sorbet.jpg',
    'lib/images/desserts/danish_pastries.jpg',
    'lib/images/burgers/cheese_burger.jpg',
    'lib/images/sides/garlic.jpg',
  ];

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Login method
  void login() async {
    final _authService = AuthService();

    try {
      await _authService.signInWithEmailPassword(
        emailController.text,
        passwordController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login successful!")),
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Login Error"),
          content: Text(e.toString()),
        ),
      );
    }
  }

  void forgotPw() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text("Forgot Password"),
        content: const Text("Feature not implemented yet."),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 126, 59, 1), // Vibrant background color
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Slideshow of images
                CarouselSlider(
                  items: imagePaths.map((imagePath) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 250.0, // Adjust the height of the slideshow
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 2),
                    enlargeCenterPage: true,
                    viewportFraction: 0.8,
                    aspectRatio: 16 / 9,
                  ),
                ),
                const SizedBox(height: 20),

                // App slogan with icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.restaurant, // Spoon and fork icon
                      size: 30,
                      color: Color.fromARGB(255, 233, 185, 96),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "MEAL MAGIC",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 233, 185, 96),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.restaurant_menu, // Fork icon
                      size: 30,
                      color: Color.fromARGB(255, 233, 185, 96),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Email text field
                MyTextField(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,
                ),
                const SizedBox(height: 10),

                // Password text field
                MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),
                const SizedBox(height: 10),

                // Sign-in button
                MyButton(
                  text: "LOGIN",
                  onTap: login,
                  buttonColor: Colors.orangeAccent,
                  textColor: const Color.fromARGB(255, 15, 14, 14),
                  borderRadius: 12.0,
                ),
                const SizedBox(height: 10),

                // Forgot password
                GestureDetector(
                  onTap: forgotPw,
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Not a member? Register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Not a member?",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Register now",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
