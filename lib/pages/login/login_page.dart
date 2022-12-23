import 'package:asc_portfolio/constant/assets.dart';
import 'package:asc_portfolio/provider/secure_storage_provider.dart';
import 'package:asc_portfolio/server/repository/user_repository.dart';
import 'package:asc_portfolio/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool _obscureText = false;
  late FlutterSecureStorage storage = ref.watch(secureStorageProvider);
  final idController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    idController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appPurple,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset(AppAssets.logoMini),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  controller: idController,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusColor: Colors.black,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Email',
                    contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  controller: passwordController,
                  cursorColor: Colors.black,
                  obscureText: _obscureText ? false : true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    filled: true,
                    focusColor: Colors.black,
                    fillColor: Colors.white,
                    hintText: 'Password',
                    contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => setState(() {
                        _obscureText = !_obscureText;
                      }),
                      icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });

                    await ref
                        .read(userRepoProvider)
                        .postReqLogin(id: idController.text, password: passwordController.text);

                    final storage = ref.watch(secureStorageProvider);
                    final tokenExist = await storage.containsKey(key: 'accessToken');
                    final roleType = await storage.read(key: 'roleType');
                    if (tokenExist && roleType == 'USER') {
                      setState(() {
                        isLoading = false;
                      });
                      context.go('/');
                    } else if (tokenExist && roleType == 'ADMIN') {
                      setState(() {
                        isLoading = false;
                      });
                      context.go('/admin');
                    } else {
                      print('error');
                    }
                  },
                  child: const Text('로그인'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () => context.go('/sign_up'),
                  child: const Text('회원가입'),
                ),
              ),
              TextButton(
                onPressed: () {
                  //TODO FORGOT PASSWORD SCREEN GOES HERE
                },
                child: const Text(
                  '비밀번호를 잊으셨습니까?',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Copyright ©2022, All Rights Reserved.',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              const SizedBox(height: 10),
              const Text(
                'Powered by padonan, chan-hong',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
