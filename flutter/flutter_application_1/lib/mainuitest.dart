import 'package:flutter/material.dart';

import 'dart:math' as math;

class RouteName {
  static const String route = '/';
  static const String routeLogin = '/login';
  static const String routeHome = '/home';
}

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        RouteName.route: (context) => TestPage(),
        RouteName.routeLogin: (context) => LoginPage(),
        RouteName.routeHome: (context) => const MyHomePage()
      },
      initialRoute: RouteName.routeLogin,
    );
  }
}

class TestPage extends StatelessWidget {
  TestPage({super.key});

  final TextEditingController _inputUserName = TextEditingController();
  final TextEditingController _inputPassword = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final ValueNotifier _obscureText = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TestPage")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.local_grocery_store_outlined,
              size: 96,
              color: Colors.orangeAccent,
            ),
            const SizedBox(height: 24),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _inputUserName,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          labelText: 'Enter your username',
                          suffixIcon: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: _inputUserName.clear,
                            child: const Icon(Icons.clear),
                          )),
                      validator: _validateUserName,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _inputPassword,
                      obscureText: _obscureText.value,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        labelText: 'Enter your password',
                        suffixIcon: InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () {
                            _obscureText.value = !_obscureText.value;
                          },
                          child: Icon(_obscureText.value
                              ? Icons.remove_red_eye_outlined
                              : Icons.remove_red_eye),
                        ),
                      ),
                      validator: _validatePassword,
                    ),
                  ],
                )),
            const SizedBox(height: 16),
            InkWell(
              onTap: () => _navToHomePage(context),
              child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadiusDirectional.circular(12)),
                  child: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }

  String? _validateUserName(String? input) {
    if (input == null || input.length <= 6) {
      return "UserName must be >= 6 characters";
    }

    return null;
  }

  String? _validatePassword(String? input) {
    if (input == null || input.length <= 6) {
      return "Password must be >= 6 characters";
    }

    return null;
  }

  void _navToHomePage(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pushNamed(RouteName.routeHome);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please check your data!!!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _inputUserName = TextEditingController();
  final TextEditingController _inputPassword = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final ValueNotifier _obscureText = ValueNotifier(true);
  final ValueNotifier _hasPassword = ValueNotifier(false);

  final FocusNode _nodePassword = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LoginPage")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.local_grocery_store_outlined,
              size: 96,
              color: Colors.orangeAccent,
            ),
            const SizedBox(height: 24),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _inputUserName,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          labelText: 'Enter your username',
                          suffixIcon: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: _inputUserName.clear,
                            child: const Icon(Icons.clear),
                          )),
                      validator: _validateUserName,
                      onFieldSubmitted: _onUserNameSubmit,
                      textInputAction: TextInputAction.go,
                    ),
                    const SizedBox(height: 16),
                    AnimatedBuilder(
                        animation:
                            Listenable.merge([_hasPassword, _obscureText]),
                        builder: (_, widget) {
                          return TextFormField(
                            focusNode: _nodePassword,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: _inputPassword,
                            obscureText: _obscureText.value,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              labelText: 'Enter your password',
                              suffixIcon: !_hasPassword.value
                                  ? const SizedBox()
                                  : InkWell(
                                      borderRadius: BorderRadius.circular(16),
                                      onTap: () {
                                        _obscureText.value =
                                            !_obscureText.value;
                                      },
                                      child: Icon(_obscureText.value
                                          ? Icons.remove_red_eye_outlined
                                          : Icons.remove_red_eye),
                                    ),
                            ),
                            validator: _validatePassword,
                            onChanged: (value) {
                              _hasPassword.value =
                                  _inputPassword.text.isNotEmpty;
                            },
                            onFieldSubmitted: (value) =>
                                _onPasswordSubmit(value, context),
                            textInputAction: TextInputAction.done,
                          );
                        }),
                  ],
                )),
            const SizedBox(height: 16),
            InkWell(
              onTap: () => _navToHomePage(context),
              child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadiusDirectional.circular(12)),
                  child: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }

  String? _validateUserName(String? input) {
    if (input == null || input.length <= 6) {
      return "UserName must be >= 6 characters";
    }

    return null;
  }

  String? _validatePassword(String? input) {
    if (input == null || input.length <= 6) {
      return "Password must be >= 6 characters";
    }

    return null;
  }

  void _onUserNameSubmit(String? value) {
    _nodePassword.requestFocus();
  }

  void _onPasswordSubmit(String? value, BuildContext context) {
    _navToHomePage(context);
  }

  void _navToHomePage(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pushNamed(RouteName.routeHome);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please check your data!!!'),
          backgroundColor: Colors.red,
        ),
      );
    }

    _inputUserName.clear();
    _inputPassword.clear();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Homepage",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: const TabBarView(
          children: [
            Text("tab1"),
            Text("tab2"),
            AnimatedBuilderExampleApp(),
          ],
        ),
        bottomNavigationBar: const ColoredBox(
          color: Colors.green,
          child: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.access_alarm_outlined)),
              Tab(icon: Icon(Icons.baby_changing_station)),
              Tab(icon: Icon(Icons.cabin)),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedBuilderExampleApp extends StatelessWidget {
  const AnimatedBuilderExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AnimatedBuilderExample(),
    );
  }
}

class AnimatedBuilderExample extends StatefulWidget {
  const AnimatedBuilderExample({super.key});

  @override
  State<AnimatedBuilderExample> createState() => _AnimatedBuilderExampleState();
}

/// AnimationControllers can be created with `vsync: this` because of
/// TickerProviderStateMixin.
class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          child: const Text(
            '--------->>>',
            style: TextStyle(fontSize: 40),
          ),
          builder: (BuildContext context, Widget? child) {
            return Transform.scale(
              scale: 2,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: const Color(0xFFE8581C),
                child: const Text('Bad Idea Bears'),
              ),
            );
            // return Transform.flip(
            //   flipX: true,
            //   child: const Text('Horizontal Flip'),
            // );
            return Transform.rotate(
              angle: _controller.value * 2 * math.pi,
              child: child,
            );
          },
        ),
      ),
    );
  }
}
