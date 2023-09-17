import 'package:flutter/material.dart';
import 'package:panel_admin_pulsa/common/constants.dart';
import 'package:panel_admin_pulsa/presentation/provider/auth_notifier.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const ROUTE_NAME = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    // Future.microtask(() => context.read<ProductListNotifier>().fetchProduct());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _build(),
    );
  }
}

class _build extends StatelessWidget {
  _build({
    super.key,
  });

  final TextEditingController _cUserName = TextEditingController(text: 'admin');
  final TextEditingController _cPassword =
      TextEditingController(text: 'admin123');

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: const Color(0xFF6F35A5),
        scaffoldBackgroundColor: bgColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: const Color(0xFF6F35A5),
            shape: const StadiumBorder(),
            maximumSize: const Size(double.infinity, 56),
            minimumSize: const Size(double.infinity, 56),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFFF1E6FF),
          iconColor: Color(0xFF6F35A5),
          prefixIconColor: Color(0xFF6F35A5),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    // Navigator.pop(context);
                  },
                ),
              ),
              SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: const BoxDecoration(
                      color: secondaryColor,
                      borderRadius: kDefaultRadius,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding * 2,
                        vertical: defaultPadding * 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Column(
                          children: [
                            Text(
                              "LOGIN",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 16.0 * 2),
                            Row(
                              children: [
                                Spacer(),
                                Expanded(
                                  flex: 8,
                                  child: Icon(Icons.person, size: 200),
                                ),
                                Spacer(),
                              ],
                            ),
                            SizedBox(height: 16.0 * 2),
                          ],
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            Expanded(
                              flex: 8,
                              child: Form(
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: _cUserName,
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                      cursorColor: const Color(0xFF6F35A5),
                                      onSaved: (email) {},
                                      decoration: const InputDecoration(
                                        hintText: "Your email",
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Icon(Icons.person),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16.0),
                                      child: TextFormField(
                                        controller: _cPassword,
                                        textInputAction: TextInputAction.done,
                                        obscureText: true,
                                        cursorColor: const Color(0xFF6F35A5),
                                        decoration: const InputDecoration(
                                          hintText: "Your password",
                                          prefixIcon: Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Icon(Icons.lock),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16.0),
                                    Hero(
                                      tag: "login_btn",
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Provider.of<AuthNotifier>(context,
                                                  listen: false)
                                              .login(_cUserName.text,
                                                  _cPassword.text);
                                        },
                                        child: Text(
                                          "Login".toUpperCase(),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16.0),
                                  ],
                                ),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ],
                    ),
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
