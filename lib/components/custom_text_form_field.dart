import 'package:flutter/material.dart';
import 'package:flutter_login/size.dart';

class CustomTextFormField extends StatelessWidget {
  final textController;
  final validate;
  String text;
  bool isPassword;

  CustomTextFormField(
      {required this.text,
      required this.validate,
      this.textController,
      this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$text"),
        SizedBox(height: small_gap),
        TextFormField(
            //validator는 무조건 뭔가 return을 해줘야함
            //1. value가 들어옴 -> 2. value로 유효성 검사 -> 3. 리턴
            //null을 리턴하면 유효성 검사 통과
            //메시지 리턴하면 유효성 검사 실패(플러터의 규칙이 이런거니까 이해하려고 하지말기)
            //value! 이면 절대 null이 아니야 라고 알려주는 거 & value?면 null일수도 있고 null이면 null을 출력해라
            validator: validate,
            obscureText: isPassword,
            //decoration은 이 textformfield 자체를 꾸미는거
            decoration: InputDecoration(
                hintText: "Enter $text",
                //마우스 올리기 전 폼
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                //마우스 올렸을 때 폼
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                //에러가 났을 때 폼
                errorBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)))),
      ],
    );
  }
}
