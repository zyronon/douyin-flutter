import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hope/model/video.dart';
export '';

class PreviewCard extends StatelessWidget {
  const PreviewCard({
    Key? key,
    required this.index,
    required this.width,
    required this.height,
    required this.item,
  }) : super(key: key);

  final int index;
  final int width;
  final int height;
  final VideoModel item;

  @override
  Widget build(BuildContext context) {
    String url = 'https://picsum.photos/$width/$height?random=$index';
    String coverUrl = "${item.video}?vframe/jpg/offset/0/w/2048";
    // String url = 'https://source.unsplash.com/random/' + width.toString() + 'x' + height.toString();

    return InkWell(
      onTap: () => {
        Navigator.pushNamed(context, 'SlideList', arguments: {'id': '123123'})
      },
      child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4.w)),
          child: Column(children: [
            Stack(children: [
              SizedBox(
                width: double.infinity,
                child: Image.network(
                  coverUrl,
                  width: width.toDouble(),
                  height: height.toDouble(),
                  fit: BoxFit.cover,
                ),
              ),
            ]),
            Padding(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 8.w),
                      child: Text(
                        item.desc!,
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
                                  backgroundImage: NetworkImage(item.author!.cover!),
                                ),
                                Expanded(
                                    child: Padding(
                                  padding: EdgeInsets.only(left: 4.w),
                                  child: Text(
                                    item.author!.nickname!,
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
                            Icon(
                              Icons.favorite_border,
                              size: 16.w,
                              color: Colors.grey,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 2.w),
                              child: Text(
                                "12345",
                                style: TextStyle(fontSize: 12.sp, color: Colors.grey),
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
