import 'package:flutter/material.dart';
import 'HomePage.dart';

String username = "";
String password = "";
bool isLoginSuccess = true;

// class LoginPageState extends StatefulWidget {
//   const LoginPageState({Key? key}) : super(key: key);
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPageState> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Login Page"),
//         ),
//         body: Column(children: [
//           _usernameField(),
//           _passwordField(),
//           _loginButton(context),
//         ]),
//       ),
//     );
//   }
// }

// Widget _usernameField() {
//   return Container(
//     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//     child: TextFormField(
//       enabled: true,
//       onChanged: (value) {
//         username = value;
//       },
//       decoration: InputDecoration(
//         hintText: 'Username',
//         contentPadding: const EdgeInsets.all(8.0),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.all(Radius.circular(8.0)),
//           borderSide:
//               BorderSide(color: (isLoginSuccess) ? Colors.blue : Colors.red),
//         ),
//       ),
//     ),
//   );
// }

// Widget _passwordField() {
//   return Container(
//     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//     child: TextFormField(
//       enabled: true,
//       onChanged: (value) {
//         password = value;
//       },
//       obscureText: true,
//       decoration: InputDecoration(
//         hintText: 'Password',
//         contentPadding: const EdgeInsets.all(8.0),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.all(Radius.circular(8.0)),
//           borderSide:
//               BorderSide(color: (isLoginSuccess) ? Colors.blue : Colors.red),
//         ),
//       ),
//     ),
//   );
// }

// Widget _loginButton(BuildContext context) {
//   return Container(
//     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//     width: MediaQuery.of(context).size.width,
//     child: ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         primary: (isLoginSuccess) ? Colors.blue : Colors.red,
//         onPrimary: Colors.white,
//       ),
//       onPressed: () {
//         String text = "";
//         if (username == "flutterMobile" && password == "flutter123") {
//           setState() {
//             text = "Login Success";
//             isLoginSuccess = true;
//           }

//           ;
//         } else {
//           setState() {
//             text = "Login Failed";
//             isLoginSuccess = false;
//           }

//           ;
//         }
//         SnackBar snackBar = SnackBar(
//           content: Text(text),
//         );

//         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//       },
//       child: const Text('Login'),
//     ),
//   );
// }

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  String username = "";
  String password = "";
  bool isLoginSuccess = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Column(children: [
          Padding(padding: EdgeInsets.only(top: 100)),
          Image.asset(
            'images/hai-sayang.jpg',
            height: 200,
          ),
          _usernameField(),
          _passwordField(),
          _loginButton(context),
        ]),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 200, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
          hintText: 'Username',
          contentPadding: const EdgeInsets.all(8.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide:
                BorderSide(color: (isLoginSuccess) ? Colors.blue : Colors.red),
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 200, vertical: 10),
      child: TextFormField(
        enabled: true,
        obscureText: true,
        onChanged: (value) {
          password = value;
        },
        decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: const EdgeInsets.all(8.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide:
                BorderSide(color: (isLoginSuccess) ? Colors.blue : Colors.red),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 200, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: (isLoginSuccess) ? Colors.blue : Colors.red, // background
          onPrimary: Colors.white, // foreground
        ),
        onPressed: () {
          String text = "";
          if (password == "admin") {
            setState(() {
              text = "Login Success";
              isLoginSuccess = true;
            });
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return HomePage(username: username);
            }));
          } else {
            setState(() {
              text = "Login Failed";
              isLoginSuccess = false;
            });
          }
          print("isLoginSuccess : $isLoginSuccess");
          SnackBar snackBar = SnackBar(
            content: Text(text),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Login'),
      ),
    );
  }
}
