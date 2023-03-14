import 'package:hope/pages/components/ExpandableText/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hope/model/video.dart';
import 'package:hope/pages/components/BaseHeader.dart';
import 'package:video_player/video_player.dart';

export '';

class SlideItem extends StatefulWidget {
  const SlideItem({Key? key, this.video}) : super(key: key);

  final Video? video;

  @override
  _SlideItemState createState() => _SlideItemState();
}

class _SlideItemState extends State<SlideItem> {
  late VideoPlayerController _controller;
  bool openDesc = false;
  GlobalKey<ExpandableTextState> _textKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network('http://douyin.ttentau.top/0.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  String url = 'https://picsum.photos/200';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.black),
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _controller.value.isPlaying ? _controller.pause() : _controller.play();
              });
            },
            child: Center(
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Container(),
            ),
          ),
          _controller.value.isPlaying
              ? Container()
              : Center(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _controller.play();
                      });
                    },
                    child: Icon(
                      _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                    ),
                  ),
                ),
          const BaseHeader(),
          if (openDesc)
            InkWell(
              onTap: () {
                _textKey.currentState?.linkTapped();
              },
              child: Container(
                decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, .5)),
              ),
            ),
          Positioned(
              bottom: 10.w,
              left: 0,
              child: Container(
                width: 1.sw,
                padding: EdgeInsets.only(left: 8.w, right: 8.w),
                // decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => {Navigator.pushNamed(context, 'UserPanel')},
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            maxRadius: 18.w,
                            backgroundImage: NetworkImage(url),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: Text(
                              "骗哥们可以骗哥们可以",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 16.sp,color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.w),
                      child: ExpandableText(
                        key: _textKey,
                        expanded: openDesc,
                        "骗哥们可以，别把你自己也骗到了就行。哥们被你骗了真无所谓的，打个哈哈就过了。但希望你打完这段话后擦一下眼角，别让眼泪掉在手机屏幕上了就行。你说的这些话，哥们信一下也是没什么的。还能让你有个心里安慰，但这种话说出来骗骗兄弟就差不多得了，哥们信你一下也不会少块肉，但是你别搞得自己也当真了就行。哥们被你骗一下是真无所谓的，兄弟笑笑也就过去了。真不是哥们想要破你防，你擦擦眼泪好好想想，除了兄弟谁还会信你这些话？ 你知道她不会跟你有任何的交集，她可能会和除了你以外的任何一个人交朋友，而且还可能会展现除了你所知道的关于她的一切以外的东西，她会笑，会哭，也会悲伤，拥有平常但快乐的生活。但你，除了见过她的样子，什么都看不到。 她以后或许还会从她的朋友中挑选一位如意郎君，她会在他面前肆意的绽放自己的每一面，她会在他面前踮起脚来亲吻他的嘴唇，会埋进他宽阔的胸膛任性地撒娇，会鼓起脸颊假装生气。但你，除了见过她一面，什么都感受不到。感受不到拥抱她的时候的温度和扑入胸腔的迷人的发香，感受不到每一次缠绵之后她在耳边的温柔呢喃，也感受不到和她白头偕老，儿孙满堂的乐趣。 你只见过她一面，但已经知道后来发生的事，她的世界什么都有，除了你",
                        expandText: '展开全文',
                        collapseText: '收起',
                        maxLines: 2,
                        animation: true,
                        collapseOnTextTap: true,
                        expandOnTextTap: true,
                        linkColor: Colors.grey,
                        onExpandedChanged: (value) => setState(() {
                          openDesc = value;
                        }),
                        style: TextStyle(fontSize: 12.sp,color: Colors.white),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
