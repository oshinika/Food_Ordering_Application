import 'package:flutter/material.dart';
import 'package:food/components/my_button.dart';
import 'package:food/components/my_textField.dart';
import 'package:food/services/auth/auth_services.dart';
import 'package:carousel_slider/carousel_slider.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // List of image paths/URLs for the slideshow
  final List<String> imagePaths = [
    'lib/images/burgers/cheese_burger.jpg',
    'lib/images/salads/grilled_chicken_ranch.jpg',
    'lib/images/desserts/danish_pastries.jpg',
    'lib/images/burgers/cheese_burger.jpg',
    'lib/images/sides/garlic.jpg',
  ];

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  // Register method
  void register() async {
    final _authService = AuthService();

    // Check if password matches -> create user
    if (passwordController.text == confirmPasswordController.text) {
      try {
        await _authService.signUpWithEmailPassword(
          emailController.text,
          passwordController.text,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Registration successful!")),
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      // If passwords do not match -> show error
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Passwords do not match!"),
        ),
      );
    }
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

                // App slogan
                const Text(
                  "Let's create an account for you",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 25),

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

                // Confirm Password text field
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                  obscureText: true,
                ),
                const SizedBox(height: 25),

                // Sign up button
                MyButton(
                  text: "Sign Up",
                  onTap: register, // Call the register method
                  buttonColor: Colors.orangeAccent, // Set the background color for the button
                  textColor: Colors.white,          // Set the text color for the button
                  borderRadius: 12.0,               // Set the border radius for rounded corners
                ),
                const SizedBox(height: 25),

                // Already have an account? Login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Login now",
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
