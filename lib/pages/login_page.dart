import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:timesheet/main.dart';
import 'package:timesheet/repositories/services/i_authen_service_repository.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final _form = GlobalKey<FormState>();

  var passwordVisible = false;
  var _enteredUserName = '';
  var _enteredPassword = '';
  var _isAuthenticating = false;

  void _submit() async {
    final isValid = _form.currentState!.validate();

    if (!isValid) {
      // show error message ...
      return;
    }

    _form.currentState!.save();

    try {
      setState(() {
        _isAuthenticating = true;
      });
      IAuthenServiceRepository authenService =
          GetIt.instance<IAuthenServiceRepository>();
      Map<String, dynamic> response =
          await authenService.authen(_enteredUserName, _enteredPassword);

      if (response['ResponseCode'] != '000') {
        onError(response['Description']);
      } else if (mounted) {
        Navigator.of(context).pushReplacementNamed('/home');
      }
    } on Exception catch (error) {
      onError(error.toString());
    }
  }

  void onError(String errorMsg) {
    if (mounted) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMsg),
        ),
      );
    }
    setState(() {
      _isAuthenticating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Login",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        )),
        backgroundColor: theme.appBarTheme.backgroundColor,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 249, 253, 255),
                          Color.fromARGB(0, 220, 251, 253),
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.topLeft,
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: const Image(
                      image: AssetImage('assets/images/tbn_login.png'),
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _form,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Username',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: colorScheme.secondary,
                                  width: 2,
                                ),
                              ),
                            ),
                            autocorrect: false,
                            validator: (value) {
                              if (value == null || value.trim().length < 3) {
                                return 'User name must be at least 4 characters long.';
                              }
                              return null;
                            },
                            textCapitalization: TextCapitalization.none,
                            onSaved: (value) {
                              _enteredUserName = value!;
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Password',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: colorScheme.secondary,
                                  width: 2,
                                ),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(
                                    () {
                                      passwordVisible = !passwordVisible;
                                    },
                                  );
                                },
                              ),
                            ),
                            obscureText: !passwordVisible,
                            validator: (value) {
                              if (value == null || value.trim().length < 3) {
                                return 'Password must be at least 4 characters long.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _enteredPassword = value!;
                            },
                          ),
                          const SizedBox(height: 12),
                          if (_isAuthenticating)
                            const CircularProgressIndicator(),
                          if (!_isAuthenticating)
                            SizedBox(
                              width: double.infinity,
                              child: Container(
                                padding: const EdgeInsets.only(top: 10),
                                child: ElevatedButton(
                                  onPressed: _submit,
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                    ),
                                    backgroundColor: colorScheme.primary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('/home');
                  },
                  child: Text(
                    "V.1.0.1.0001",
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
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
}
