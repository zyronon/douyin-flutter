import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../utils/ConstVal.dart';
export '';

class Login extends StatefulWidget {
  const Login({
    super.key,
  });

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  int time = -1;
  bool _checkboxSelected = false;
  final TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late Timer _timer;

  @override
  void dispose() {
    //用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  void sendCode() {
    if (time != -1) return;
    setState(() {
      time = 60;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        time--;
      });
      if (time < 0) {
        _timer.cancel();
      }
    });
  }

  submit() {
    //导航到新路由
    // Navigator.push(
    //   context,
    //   CupertinoPageRoute(
    //     builder: (context) => NewRoute(),
    //   )
    // );
    Navigator.pushNamed(context, 'Home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.only(top: 50),
          padding: const EdgeInsets.all(18.0),
          decoration: const BoxDecoration(
            color: Color.fromRGBO(15, 22, 33, 1),
          ),
          child: Column(
            children: [
              Row(
                children: [Image.asset("images/light-back.png", width: 25.0)],
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: double.infinity,
                ),
                child: Container(
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Positioned(
                        top:0,
                        left: 50,
                        child: Image.asset("images/login-logo.png", width: 150.0),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 110),
                        child: const Text(
                          '红袖阁',
                          style: TextStyle(
                              fontSize: 40.0, fontWeight: FontWeight.bold, letterSpacing: 8, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '手机号',
                            style: TextStyle(color: Colors.white),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(24, 32, 46, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                TextFormField(
                                  style: const TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                    hintText: '请输入手机号',
                                    hintStyle: TextStyle(color: Color.fromRGBO(64, 69, 82, 1)),
                                    border: InputBorder.none,
                                  ),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return '请输入手机号';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '验证码',
                            style: TextStyle(color: Colors.white),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(24, 32, 46, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                      hintText: '请输入验证码',
                                      hintStyle: TextStyle(color: Color.fromRGBO(64, 69, 82, 1)),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: sendCode,
                                  child: Text(
                                    time == -1 ? '获取验证码' : time.toString(),
                                    style: TextStyle(color: Color(mainColor)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Checkbox(
                        value: _checkboxSelected,
                        activeColor: Color(mainColor), //选中时的颜色
                        onChanged: (value) {
                          setState(() {
                            _checkboxSelected = value!;
                          });
                        }),
                    Expanded(
                      child: Text.rich(
                        TextSpan(children: [
                          const TextSpan(text: "我已阅读并同意", style: TextStyle(color: Colors.grey)),
                          TextSpan(
                              text: "《红袖阁用户服务协议》",
                              style: TextStyle(color: Color(mainColor)),
                              recognizer: _tapGestureRecognizer
                                ..onTap = () {
                                  Navigator.pushNamed(context, 'ServiceAgreement');
                                }),
                          const TextSpan(text: "以及", style: TextStyle(color: Colors.grey)),
                          TextSpan(
                              text: "《隐私政策》",
                              style: TextStyle(color: Color(mainColor)),
                              recognizer: _tapGestureRecognizer
                                ..onTap = () {
                                  Navigator.pushNamed(context, 'PrivacyPolicy');
                                }),
                        ]),
                        softWrap: true,
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: submit,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 60),
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Color(mainColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      "立即登录",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      child: Text(
                        "无法获取验证码？",
                        style: TextStyle(color: Color(mainColor)),
                      ),
                      onTap: () => {},
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
