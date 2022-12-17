// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanage/Provider/authProvider.dart';

class Login extends StatelessWidget {
  Login({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // debugPrint('Login build()');
    // debugPrint(emailController.text);
    // debugPrint(passwordController.text);
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //copyable text
            SelectableText("eve.holt@reqres.in", onTap: () {
              Clipboard.setData(
                  const ClipboardData(text: "eve.holt@reqres.in"));
            }),
            SelectableText(
              "cityslicka",
              onTap: () {
                Clipboard.setData(
                    const ClipboardData(text: "eve.holt@reqres.in"));
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passwordController,
                obscureText: authProvider.obsSecure,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: InkWell(
                    child: authProvider.obsSecure
                        ? const Icon(Icons.remove_red_eye)
                        : const Icon(Icons.closed_caption_disabled),
                    onTap: () {
                      if (authProvider.obsSecure == true) {
                        authProvider.setVisible(false);
                      } else {
                        authProvider.setVisible(true);
                      }
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            authProvider.isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () {
                      authProvider.login(
                          emailController.text, passwordController.text);
                    },
                  ),

            authProvider.isAuth
                ? const Text("Login Successful")
                : const Text("Not Login")
          ],
        ),
      ),
    );
  }
}
