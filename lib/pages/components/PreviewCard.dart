import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
export '';

class PreviewCard extends StatelessWidget {
  const PreviewCard({
    Key? key,
    required this.index,
    required this.width,
    required this.height,
  }) : super(key: key);

  final int index;
  final int width;
  final int height;

  @override
  Widget build(BuildContext context) {
    String url = 'https://picsum.photos/$width/$height?random=$index';
    // String url = 'https://source.unsplash.com/random/' + width.toString() + 'x' + height.toString();

    return InkWell(
      onTap: () => {Navigator.pushNamed(context, 'SlideList')},
      child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4.w)),
          child: Column(children: [
            Stack(children: [
              SizedBox(
                width: double.infinity,
                child: Image.network(
                  url,
                  width: width.toDouble(),
                  height: height.toDouble(),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  right: 10.w,
                  top: 10.w,
                  child: Image.asset(
                    "images/like-red-small.png",
                    width: 22.w,
                  ))
            ]),
            Padding(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 8.w),
                      child: const Text(
                        "骗哥们可以，别把你自己也骗到了就行。哥们被你骗了真无所谓的，打个哈哈就过了。但希望你打完这段话后擦一下眼角，别让眼泪掉在手机屏幕上了就行。你说的这些话，哥们信一下也是没什么的。还能让你有个心里安慰，但这种话说出来骗骗兄弟就差不多得了，哥们信你一下也不会少块肉，但是你别搞得自己也当真了就行。哥们被你骗一下是真无所谓的，兄弟笑笑也就过去了。真不是哥们想要破你防，你擦擦眼泪好好想想，除了兄弟谁还会信你这些话？ 你知道她不会跟你有任何的交集，她可能会和除了你以外的任何一个人交朋友，而且还可能会展现除了你所知道的关于她的一切以外的东西，她会笑，会哭，也会悲伤，拥有平常但快乐的生活。但你，除了见过她的样子，什么都看不到。 她以后或许还会从她的朋友中挑选一位如意郎君，她会在他面前肆意的绽放自己的每一面，她会在他面前踮起脚来亲吻他的嘴唇，会埋进他宽阔的胸膛任性地撒娇，会鼓起脸颊假装生气。但你，除了见过她一面，什么都感受不到。感受不到拥抱她的时候的温度和扑入胸腔的迷人的发香，感受不到每一次缠绵之后她在耳边的温柔呢喃，也感受不到和她白头偕老，儿孙满堂的乐趣。 你只见过她一面，但已经知道后来发生的事，她的世界什么都有，除了你",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () => {Navigator.pushNamed(context, 'UserPanel')},
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                CircleAvatar(
                                  maxRadius: 10.w,
                                  backgroundImage: NetworkImage(url),
                                ),
                                Expanded(
                                    child: Padding(
                                  padding: EdgeInsets.only(left: 4.w),
                                  child: Text(
                                    "骗哥们可以骗哥们可以",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 10.sp),
                                  ),
                                )),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "images/like-red-small.png",
                              width: 20.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 4.w),
                              child: Text(
                                "12345",
                                style: TextStyle(fontSize: 12.sp),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ))
          ])),
    );
  }
}
