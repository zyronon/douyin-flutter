import 'package:flutter/material.dart';
export '';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class MyIcon extends StatelessWidget {
  const MyIcon({
    super.key,
    required this.title,
    required this.img,
    required this.cb,
  });

  final String title;
  final String img;
  final void Function() cb;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: InkWell(
          onTap: cb,
          child: Column(
            children: [
              Image.asset(
                img,
                width: 70.0,
              ),
              Text(
                title,
                style: const TextStyle(color: Colors.black, fontSize: 18),
              )
            ],
          ),
        ));
  }
}

class Gang extends StatelessWidget {
  const Gang({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      height: 20,
      width: 4,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(2),
      ),
      child: null,
    );
  }
}

class MyCard extends StatelessWidget {
  const MyCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
          minWidth: double.infinity, //宽度尽可能大
          minHeight: 50.0 //最小高度为50像素
          ),
      child: Container(
          margin: const EdgeInsets.only(top: 10.0),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(220, 220, 220, 1.0),
            borderRadius: BorderRadius.circular(8),
          ),
          child: child),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(18.0),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(15, 22, 33, 1),
            ),
            child: Column(
              children: [
                MyCard(
                  child: Column(
                    children: [
                      Text(
                        "你好 客官",
                        style: TextStyle(color: Colors.white, fontSize: 28),
                      ),
                      Text(
                        "您今天要找什么？",
                        style: TextStyle(color: Colors.white, fontSize: 28),
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
                                  hintText: '搜索您需要的服务',
                                  hintStyle: TextStyle(color: Color.fromRGBO(64, 69, 82, 1)),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Image.asset(
                              "images/like-red-small.png",
                              width: 30.0,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                MyCard(
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      MyIcon(
                        title: 'data1',
                        img: "images/gray-close-full.png",
                        cb: () => {print('1')},
                      ),
                      MyIcon(
                        title: 'data1',
                        img: "images/gray-close-full.png",
                        cb: () => {print('2')},
                      ),
                    ],
                  ),
                ),
                MyCard(
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: const [
                            Gang(),
                            Text("上门服务"),
                          ]),
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(220, 220, 220, 1.0),
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(color: Colors.green)),
                            child: Row(
                              children: [
                                const Text("上门服务"),
                                Image.asset(
                                  'images/light-back.png',
                                  width: 15,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (int i = 0; i < (3); i++)
                              Padding(
                                padding: EdgeInsets.only(right: 10, top: 10),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: Image.asset(
                                            "images/9.jpg",
                                            width: 150.0,
                                            height: 150.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(top: 10.0, left: 10),
                                          padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                          decoration: BoxDecoration(
                                            color: const Color.fromRGBO(222, 82, 82, 1.0),
                                            borderRadius: BorderRadius.circular(18),
                                          ),
                                          child: const Text(
                                            "10%折扣",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Text("Hello world"),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                MyCard(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Gang(),
                        Text(
                          "邀请",
                        )
                      ],
                    ),
                    Stack(
                      children: [
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Image.asset(
                            'images/9.jpg',
                            width: 100,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'images/light-back.png',
                                  width: 10,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  width: 200, //添加这一行
                                  child: const Text(
                                    "邀请新用户可永久获得该好友后续消费费用的2%免费消费额度",
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              "已收益1300元",
                              style: TextStyle(fontSize: 30),
                            ),
                            Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: InkWell(
                                  onTap: () => {print('邀请')},
                                  child: Row(
                                    children: [
                                      const Text(
                                        "立即邀请",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Image.asset(
                                        'images/light-back.png',
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ],
                    )
                  ],
                ))
              ],
            )));
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("page2");
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("page3");
  }
}

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Page4");
  }
}

class Page5 extends StatelessWidget {
  const Page5({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Page5");
  }
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Page1(),
    Page2(),
    Page3(),
    Page4(),
    Page5(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints: const BoxConstraints(
            minWidth: double.infinity, //宽度尽可能大
            minHeight: double.infinity),
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(15, 22, 33, 1),
          ),
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
