import 'dart:async';

import 'package:hope/pages/components/BaseScrollView.dart';
import 'package:hope/pages/components/ExpandableText/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hope/model/video.dart';
import 'package:hope/pages/components/BaseHeader.dart';
import 'package:hope/utils/ConstVal.dart';
import 'package:hope/utils/EventBus.dart';
import 'package:video_player/video_player.dart';
import 'dart:math' as math;

export '';

class SlideItem extends StatefulWidget {
  const SlideItem({Key? key, required this.videoModel, required this.index, required this.isPlay}) : super(key: key);

  final VideoModel videoModel;
  final int index;
  final bool isPlay;

  @override
  _SlideItemState createState() => _SlideItemState();
}

class _SlideItemState extends State<SlideItem> with TickerProviderStateMixin {
  late VideoPlayerController videoController;
  bool openDesc = false;
  bool showDesc = true;
  GlobalKey<ExpandableTextState> _textKey = GlobalKey();
  bool isLove = true;
  bool isCollect = false;
  late AnimationController animController;
  late VideoPlayerValue videoPlayerValue;
  String url = 'https://picsum.photos/200';
  double _sliderValue = 0;
  bool isDragProgress = false;
  bool isBuffering = false;

  void slideListPageChanged(index) {
    setState(() {
      if (index == widget.index) {
        // print("播放 $index");
        videoController.play();
      } else {
        setState(() {
          openDesc = false;
          showDesc = true;
        });
        videoController.seekTo(Duration(seconds: 0));
        videoController.pause();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    EventBus.on("slideListPageChanged", slideListPageChanged);
    animController = BottomSheet.createAnimationController(this);
    animController.duration = Duration(milliseconds: 300);
    videoController = VideoPlayerController.network(widget.videoModel.video!)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          videoPlayerValue = videoController.value;
          if (widget.isPlay) {
            videoController.play();
          }
        });
      });
    videoController.setLooping(true);
    videoController.addListener(() {
      setState(() {
        _sliderValue = (videoController.value.position.inSeconds / videoController.value.duration.inSeconds) * 100;
        isBuffering = videoController.value.isBuffering;
      });
    });
  }

  @override
  void dispose() {
    // print("dispose" + widget.index.toString());
    super.dispose();
    animController.dispose();
    videoController.dispose();
    EventBus.off("slideListPageChanged", slideListPageChanged);
  }

  void goUserPanel() {
    if (showDesc) {
      Timer(const Duration(seconds: 1), () {
        videoController.pause();
      });
      Navigator.pushNamed(context, 'UserPanel').then((value) => {videoController.play()});
    }
  }

  Widget loadingIcon() {
    return Center(
        child: SizedBox(
      width: 25.w,
      height: 25.w,
      child: CircularProgressIndicator(
        color: Colors.red,
        strokeWidth: 2.5.w,
      ),
    ));
  }

  Widget statusIcon() {
    return videoController.value.isInitialized
        ? Visibility(
            visible: !videoController.value.isPlaying,
            child: Center(
              child: InkWell(
                onTap: () {
                  setState(() {
                    videoController.play();
                  });
                },
                child: Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white70,
                  size: 100.w,
                ),
              ),
            ))
        : loadingIcon();
  }

  Widget _comments() {
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      height: MediaQuery.of(context).size.height / 1.5,
      child: Column(children: [
        SizedBox(
          height: 50.w,
          child: Stack(
            textDirection: TextDirection.rtl,
            children: [
              Center(
                child: Text(
                  '底部弹窗',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ],
          ),
        ),
        const Divider(height: 1.0),
        Expanded(
          child: BaseScrollView(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 12.w),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.only(left: 12.w, right: 12.w),
                  margin: EdgeInsets.only(bottom: 12.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(right: 12.w),
                          child: CircleAvatar(
                            maxRadius: 22.w,
                            backgroundImage: NetworkImage(url),
                          )),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(bottom: 8.w),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Column(
                                    children: [
                                      Text("顺德JacksonGao", style: descStyle),
                                      Text.rich(TextSpan(children: [
                                        TextSpan(text: "顺德JacksonGao顺德JacksonGao顺德JacksonGao顺德JacksonGao顺德JacksonGao"),
                                        TextSpan(text: " 03-02 广东", style: timeStyle),
                                      ]))
                                      // Expanded(child: Text("顺德JacksonGao顺德JacksonGao顺德JacksonGao顺德JacksonGao顺德JacksonGao")),
                                    ],
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                  )),
                                  Column(children: [
                                    Icon(
                                      Icons.favorite_border_rounded,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      "12万",
                                      style: descStyle,
                                    )
                                  ])
                                ],
                              )),
                          Container(
                            margin: EdgeInsets.only(bottom: 12.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(right: 6.w),
                                    child: CircleAvatar(
                                      maxRadius: 12.w,
                                      backgroundImage: NetworkImage(url),
                                    )),
                                Expanded(
                                    child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Text("顺德JacksonGao", style: descStyle),
                                        Text.rich(TextSpan(children: [
                                          TextSpan(text: "顺德JacksonGao顺德JacksonGao顺德JacksonGao顺德JacksonGao顺德JacksonGao"),
                                          TextSpan(text: " 03-02 广东", style: timeStyle),
                                        ]))
                                        // Expanded(child: Text("顺德JacksonGao顺德JacksonGao顺德JacksonGao顺德JacksonGao顺德JacksonGao")),
                                      ],
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                    )),
                                    Column(children: [
                                      Icon(
                                        Icons.favorite_border_rounded,
                                        color: Colors.grey,
                                      ),
                                      Text(
                                        "12万",
                                        style: descStyle,
                                      )
                                    ])
                                  ],
                                ))
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 12.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(right: 6.w),
                                    child: CircleAvatar(
                                      maxRadius: 12.w,
                                      backgroundImage: NetworkImage(url),
                                    )),
                                Expanded(
                                    child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Text("顺德JacksonGao", style: descStyle),
                                        Text.rich(TextSpan(children: [
                                          TextSpan(text: "顺德JacksonGao顺德JacksonGao顺德JacksonGao顺德JacksonGao顺德JacksonGao"),
                                          TextSpan(text: " 03-02 广东", style: timeStyle),
                                        ]))
                                        // Expanded(child: Text("顺德JacksonGao顺德JacksonGao顺德JacksonGao顺德JacksonGao顺德JacksonGao")),
                                      ],
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                    )),
                                    Column(children: [
                                      Icon(
                                        Icons.favorite_border_rounded,
                                        color: Colors.grey,
                                      ),
                                      Text(
                                        "12万",
                                        style: descStyle,
                                      )
                                    ])
                                  ],
                                ))
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 12.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(right: 6.w),
                                    child: CircleAvatar(
                                      maxRadius: 12.w,
                                      backgroundImage: NetworkImage(url),
                                    )),
                                Expanded(
                                    child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Text("顺德JacksonGao", style: descStyle),
                                        Text.rich(TextSpan(children: [
                                          TextSpan(text: "顺德JacksonGao顺德JacksonGao顺德JacksonGao顺德JacksonGao顺德JacksonGao"),
                                          TextSpan(text: " 03-02 广东", style: timeStyle),
                                        ]))
                                        // Expanded(child: Text("顺德JacksonGao顺德JacksonGao顺德JacksonGao顺德JacksonGao顺德JacksonGao")),
                                      ],
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                    )),
                                    Column(children: [
                                      Icon(
                                        Icons.favorite_border_rounded,
                                        color: Colors.grey,
                                      ),
                                      Text(
                                        "12万",
                                        style: descStyle,
                                      )
                                    ])
                                  ],
                                ))
                              ],
                            ),
                          ),
                          InkWell(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 8.w),
                              child: Text(
                                "展开6条回复",
                                style:
                                    TextStyle(color: const Color.fromRGBO(35, 85, 155, 1.0), fontWeight: FontWeight.bold, fontSize: 14.sp),
                              ),
                            ),
                          ),
                          Divider(height: 1.0),
                        ],
                      ))
                    ],
                  ),
                );
              },
              itemCount: 30,
            ),
          ),
        ),
        const Divider(height: 1.0),
        Padding(
            padding: EdgeInsets.all(14.w),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: SizedBox(
                      height: 40.w,
                      child: TextField(
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          hintText: '说点什么吧',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(10.w, 0.w, 10.w, 0.w),
                    decoration: BoxDecoration(color: mainBgColor2, borderRadius: BorderRadius.all(Radius.circular(18.w))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: InkWell(
                    child: Container(
                        decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.all(Radius.circular(18.w))),
                        padding: EdgeInsets.fromLTRB(14.w, 10.w, 14.w, 10.w),
                        child: Text(
                          "发送",
                          style: TextStyle(color: Colors.white, fontSize: 14.sp),
                        )),
                  ),
                )
              ],
            ))
      ]),
    );
  }

  void openComment() async {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      enableDrag: false,
      transitionAnimationController: animController,
      builder: (BuildContext context) {
        return _comments();
      },
    );
  }

  void quickComment() {
    showModalBottomSheet(
      context: context,
      // backgroundColor: Colors.transparent,
      enableDrag: false,
      transitionAnimationController: animController,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Padding(
              padding: EdgeInsets.all(14.w),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10.w, 0.w, 10.w, 0.w),
                      decoration: BoxDecoration(color: mainBgColor2, borderRadius: BorderRadius.all(Radius.circular(18.w))),
                      child: SizedBox(
                        height: 40.w,
                        child: const TextField(
                          autofocus: true,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: '说点什么吧',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: InkWell(
                      child: Container(
                          decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.all(Radius.circular(18.w))),
                          padding: EdgeInsets.fromLTRB(14.w, 10.w, 14.w, 10.w),
                          child: Text(
                            "发送",
                            style: TextStyle(color: Colors.white, fontSize: 14.sp),
                          )),
                    ),
                  )
                ],
              )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(color: Colors.white),
      child: Container(
          color: Colors.black,
          child: Column(
            children: [
              Expanded(
                  child: Stack(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        videoController.value.isPlaying ? videoController.pause() : videoController.play();
                      });
                    },
                    child: Center(
                      child: videoController.value.isInitialized
                          ? AspectRatio(
                              aspectRatio: videoController.value.aspectRatio,
                              child: VideoPlayer(videoController),
                            )
                          : Container(),
                    ),
                  ),
                  statusIcon(),
                  const BaseHeader(),
                  Offstage(
                      offstage: !openDesc,
                      child: AnimatedOpacity(
                          opacity: openDesc ? 1 : 0,
                          duration: Duration(milliseconds: 300),
                          child: InkWell(
                            onTap: () {
                              _textKey.currentState?.linkTapped();
                            },
                            child: Container(
                              decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, .5)),
                            ),
                          ))),
                  Visibility(visible: isBuffering, child: loadingIcon()),
                  Positioned(
                      bottom: 15.w,
                      left: 0,
                      child: Container(
                        width: 1.sw,
                        padding: EdgeInsets.only(left: 10.w, right: 10.w),
                        // decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                    child: AnimatedOpacity(
                                        opacity: showDesc ? 1 : 0,
                                        duration: const Duration(milliseconds: 300),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              onTap: goUserPanel,
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
                                                      widget.videoModel.author!.nickname!,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 8.w),
                                              child: ExpandableText(
                                                animationDuration: Duration(milliseconds: 600),
                                                key: _textKey,
                                                expanded: openDesc,
                                                widget.videoModel.desc!,
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
                                                style: TextStyle(fontSize: 14.sp, color: Colors.white),
                                              ),
                                            )
                                          ],
                                        ))),
                                Visibility(
                                    visible: !openDesc,
                                    child: InkWell(
                                      onTap: () => setState(() => showDesc = !showDesc),
                                      child: Container(
                                        margin: EdgeInsets.only(left: 8.w),
                                        padding: EdgeInsets.all(6.w),
                                        decoration: const BoxDecoration(
                                            color: Color.fromRGBO(43, 43, 43, 0.8), borderRadius: BorderRadius.all(Radius.circular(100))),
                                        child: Transform.rotate(
                                          angle: math.pi / 4,
                                          child: Icon(
                                            showDesc ? Icons.unfold_more_sharp : Icons.unfold_less_sharp,
                                            color: Colors.white,
                                            size: 18.w,
                                          ),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                            Visibility(
                              visible: openDesc,
                              child: Padding(
                                  padding: EdgeInsets.only(top: 8.w),
                                  child: Text(
                                    "2021-03-01",
                                    style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                                  )),
                            ),
                          ],
                        ),
                      )),
                  Positioned(
                      bottom: -10.w,
                      left: 0,
                      width: 1.sw,
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          //轨道的形状
                          trackShape: null,
                          //trackHeight：滑轨的高度
                          trackHeight: isDragProgress ? 2 : 1,
                          //已滑过轨道的颜色
                          activeTrackColor: isDragProgress ? Colors.white : Colors.white30,
                          //未滑过轨道的颜色
                          inactiveTrackColor: Colors.white30,
                          //滑块中心的颜色（小圆头的颜色）
                          thumbColor: isDragProgress ? Colors.white : Colors.transparent,
                          //滑块边缘的颜色
                          overlayColor: Colors.white,
                          thumbShape: RoundSliderThumbShape(
                            //可继承SliderComponentShape自定义形状
                            disabledThumbRadius: 8.w, //禁用时滑块大小
                            enabledThumbRadius: 4.w, //滑块大小
                          ),
                          overlayShape: RoundSliderOverlayShape(
                            //可继承SliderComponentShape自定义形状
                            overlayRadius: 14.w, //滑块外圈大小
                          ),
                        ),
                        child: Slider(
                          value: _sliderValue,
                          max: 100,
                          min: 0,
                          onChanged: (double val) {
                            setState(() {
                              int currentTime = (videoPlayerValue.duration.inSeconds * (val / 100)).toInt();
                              videoController.seekTo(Duration(seconds: currentTime));
                              _sliderValue = val;
                            });
                          },
                          onChangeStart: (double val) {
                            setState(() {
                              isDragProgress = true;
                            });
                          },
                          onChangeEnd: (double val) {
                            setState(() {
                              isDragProgress = false;
                            });
                          },
                        ),
                      ))
                ],
              )),
              Padding(
                  padding: EdgeInsets.all(14.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: quickComment,
                          child: Container(
                            child: Text(
                              '发表评论',
                              style: TextStyle(color: Colors.grey),
                            ),
                            padding: EdgeInsets.fromLTRB(20.w, 8.w, 20.w, 8.w),
                            decoration:
                                BoxDecoration(color: Color.fromRGBO(43, 43, 43, 1), borderRadius: BorderRadius.all(Radius.circular(18.w))),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () => setState(() => isLove = !isLove),
                            child: Padding(
                                padding: EdgeInsets.only(left: 8.w),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    isLove
                                        ? Icon(
                                            Icons.favorite_sharp,
                                            color: Colors.red,
                                            size: 28.sp,
                                          )
                                        : Icon(
                                            Icons.favorite_border_sharp,
                                            color: Colors.white,
                                            size: 28.sp,
                                          ),
                                    Padding(padding: EdgeInsets.only(left: 4.w), child: Text("13万"))
                                  ],
                                )),
                          ),
                          InkWell(
                            onTap: () => setState(() => isCollect = !isCollect),
                            child: Padding(
                                padding: EdgeInsets.only(left: 8.w),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    isCollect
                                        ? Icon(
                                            Icons.star_rounded,
                                            color: Colors.yellow,
                                            size: 28.sp,
                                          )
                                        : Icon(
                                            Icons.star_border_rounded,
                                            color: Colors.white,
                                            size: 28.sp,
                                          ),
                                    Padding(padding: EdgeInsets.only(left: 4.w), child: Text("13万"))
                                  ],
                                )),
                          ),
                          InkWell(
                            onTap: openComment,
                            child: Padding(
                                padding: EdgeInsets.only(left: 8.w),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.textsms_outlined,
                                      color: Colors.white,
                                      size: 28.sp,
                                    ),
                                    Padding(padding: EdgeInsets.only(left: 4.w), child: Text("13万"))
                                  ],
                                )),
                          ),
                        ],
                      )
                    ],
                  ))
            ],
          )),
    );
  }
}
