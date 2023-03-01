import 'dart:async';

import 'package:flutter/material.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late Timer _timer;

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
    Navigator.pushNamed(context, 'home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(18.0),
          decoration: const BoxDecoration(
            color: Color.fromRGBO(15, 22, 33, 1),
          ),
          child: Column(
            children: [
              const Text(
                '红袖阁',
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: [
                          // const Image(
                          //     image: AssetImage("images/like-red-small.png"),
                          //     width: 100.0),
                        ],
                      ),
                    ),
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
                                    style: const TextStyle(color: Colors.blue),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: submit,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(minWidth: double.infinity),
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 20),
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            "立即登录",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Text("data")
            ],
          )),
    );
  }
}
