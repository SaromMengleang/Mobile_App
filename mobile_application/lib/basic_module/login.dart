import 'package:flutter/material.dart';
import 'main_screen.dart'; // Assuming this is used later


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    const img =
        "https://tse2.mm.bing.net/th/id/OIP.DexBeSiGPUP4igHscKierwHaCi?rs=1&pid=ImgDetMain&o=7&rm=3";

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Login"),
      //   automaticallyImplyLeading: false, //  Removes the back button
      // ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.network(img),
                const SizedBox(height: 30),
                _buildEmailField(),
                const SizedBox(height: 15),
                _buildPasswordField(),
                const SizedBox(height: 25),
                _buildLoginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email),
        labelText: "Email",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      // validator: (value) {
      //   if (value == null || value.trim().isEmpty) {
      //     return "Email is required";
      //   } else if (!value.contains('@') || !value.contains('.')) {
      //     return "Enter a valid email";
      //   }
      //   return null;

    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: _hidePassword,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock),
        labelText: "Password",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        suffixIcon: IconButton(
          icon: Icon(_hidePassword ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _hidePassword = !_hidePassword;
            });
          },
        ),
      ),
      // validator: (value) {
      //   if (value == null || value.trim().isEmpty) {
      //     return "Password is required";
      //   } else if (value.length < 4) {
      //     return "Password too short";
      //   }
      //   return null;
      // },
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Login Successful")),
            );

            // Use pushReplacement to remove the back button
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            );
          }
        },
        child: const Text("Login",style: TextStyle(color: Colors.pink)),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
