import 'package:flutter/material.dart';
import 'package:flutter_login/components/custom_text_form_field.dart';
import 'package:flutter_login/size.dart';
import 'package:flutter_login/user_repository.dart';
import 'package:flutter_login/validators_util.dart';

class CustomForm extends StatelessWidget {
  //얘는 read-only영역에 들어간 애이자 var
  final int num = 10;

  //validation유효성 검사하려고 만든 것
  final _formKey = GlobalKey<FormState>();

  final _email = TextEditingController();
  final _password = TextEditingController();

  CustomForm();

  @override
  Widget build(BuildContext context) {
    return Form(
      //이렇게 적어주면 유효성 검사를 위한 준비가 된 것
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            text: "Email",
            validate: validateEmail(),
            textController: _email,
          ),
          CustomTextFormField(
              text: "Password",
              validate: validatePassword(),
              textController: _password,
              isPassword: true),
          SizedBox(height: large_gap),
          TextButton(
              onPressed: () {
                //formkey가 연결되지않으면 currentState가 null이다
                if (_formKey.currentState!.validate()) {
                  UserRepository repo = UserRepository();
                  //trim - 앞 뒤 공백 날려줌
                  repo.login(_email.text.trim(), _password.text.trim());
                  //모든 form을 호출 -> validator가 null을 return하면 true가 됨
                  Navigator.pushNamed(context, "/home");
                }
              },
              child: Text("Login")),
        ],
      ),
    );
  }
}
