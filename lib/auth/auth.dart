import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_sample/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum FieldType { email, password }
enum FormType {
  register, login;
  String get kr => ['회원가입', '로그인'][index];
}


class FirebaseController {
  static final authInstance = FirebaseAuth.instance;
  static final emailCont = TextEditingController();
  static final passwordCont = TextEditingController();

  static void allClear() {
    emailCont.clear();
    passwordCont.clear();
  }

  static Future<bool> register() async {
    try {
      await authInstance.createUserWithEmailAndPassword(
        email: emailCont.text,
        password: passwordCont.text,
      );
      return true;
    } catch (e) { if (kDebugMode) print(e); }
    return false;
  }

  static Future<bool> login() async {
    try {
      await authInstance.signInWithEmailAndPassword(
        email: emailCont.text,
        password: passwordCont.text,
      );
      return true;
    } catch (e) { if (kDebugMode) print(e); }
    return false;
  }
}

class CustomField extends StatelessWidget {
  const CustomField({
    Key? key,
    required this.controller,
    this.labelText = '',
    this.color = Colors.black,
    required this.fieldType,
  }) : super(key: key);

  final TextEditingController controller;
  final FieldType fieldType;
  final String labelText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: color,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color, width: 2),
        ),
        filled: true,
        labelText: labelText,
        floatingLabelStyle: TextStyle(color: color),
      ),
      obscureText: fieldType == FieldType.password,
    );
  }
}

class AuthForm extends StatelessWidget {
  const AuthForm({
    Key? key,
    required this.formType,
    required this.submitted,
  }) : super(key: key);

  final FormType formType;
  final VoidCallback submitted;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.red.withOpacity(.1),
        padding: const EdgeInsets.all(20.0),
        constraints: BoxConstraints(
          maxWidth: size!.width * .8,
          maxHeight: size!.height * .5,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(formType.kr,
              style: const TextStyle(fontSize: 30.0),
            ),
            CustomField(
              controller: FirebaseController.emailCont,
              fieldType: FieldType.email,
              color: Colors.red,
              labelText: '이메일',
            ),
            CustomField(
              controller: FirebaseController.passwordCont,
              fieldType: FieldType.password,
              color: Colors.red,
              labelText: '비밀번호',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: FirebaseController.allClear,
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(15.0),
                  ),
                  child: const Text('취소',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                const SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: submitted,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15.0),
                    backgroundColor: Colors.red,
                  ),
                  child: Text(formType.kr),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  FormType formType = FormType.register;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('회원 관리'),
        actions: [
          TextButton(
            onPressed: () => setState(() {
              formType = FormType.values[1 - formType.index];
            }),
            child: Text(formType.name,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: AuthForm(
        formType: formType,
        submitted: () async {
          bool success = false;

          switch (formType) {
            case FormType.register:
              success = await FirebaseController.register();
              break;
            case FormType.login:
              success = await FirebaseController.login();
              break;
          }

          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${formType.kr}에 ${success ? '성공' : '실패'} 했습니다.'),
            ),
          );
        },
      ),
    );
  }
}
