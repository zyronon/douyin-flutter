import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hope/model/video.dart';
export '';

class PreviewCard extends StatelessWidget {
  const PreviewCard({
    Key? key,
    required this.index,
    required this.item,
  }) : super(key: key);

  final int index;
  final VideoModel item;

  String formatNumber(int num) {
    if (num > 100000000) {
      return '${(num / 100000000).toStringAsFixed(1)}亿';
    } else if (num > 10000) {
      return '${(num / 10000).toStringAsFixed(1)}万';
    } else {
      return num.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    String coverUrl = "${item.video}?vframe/jpg/offset/0/w/500";
    // String url = 'https://source.unsplash.com/random/' + width.toString() + 'x' + height.toString();

    return Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4.w)),
        child: Column(children: [
          Stack(children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: double.infinity, minWidth: double.infinity, minHeight: 0.5.sw, maxHeight: 1.sw),
              child: Image.network(coverUrl, fit: BoxFit.cover),
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
                              formatNumber(item.diggCount!),
                              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ))
        ]));
  }
}
