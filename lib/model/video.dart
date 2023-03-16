// To parse this JSON data, do
//
//     final video = videoFromJson(jsonString);

import 'dart:convert';

class VideoModel {
  VideoModel({
    this.id,
    this.video,
    this.videoDataSize,
    this.duration,
    this.desc,
    this.allowDownload,
    this.allowDuet,
    this.allowReact,
    this.allowMusic,
    this.allowDouplus,
    this.allowShare,
    this.diggCount,
    this.commentCount,
    this.downloadCount,
    this.playCount,
    this.shareCount,
    this.forwardCount,
    this.collectCount,
    this.sort,
    this.isTop,
    this.city,
    this.address,
    this.musicId,
    this.createTime,
    this.creatorId,
    this.status,
    this.topics,
    this.music,
    this.author,
  });

  final String? id;
  final String? video;
  final int? videoDataSize;
  final int? duration;
  final String? desc;
  final int? allowDownload;
  final int? allowDuet;
  final int? allowReact;
  final int? allowMusic;
  final int? allowDouplus;
  final int? allowShare;
  final int? diggCount;
  final int? commentCount;
  final int? downloadCount;
  final int? playCount;
  final int? shareCount;
  final int? forwardCount;
  final int? collectCount;
  final int? sort;
  final int? isTop;
  final String? city;
  final String? address;
  final String? musicId;
  final String? createTime;
  final String? creatorId;
  final int? status;
  final List<Topic>? topics;
  final Music? music;
  final Author? author;

  factory VideoModel.fromRawJson(Map<String, dynamic> str) => VideoModel.fromJson(str);

  String toRawJson() => json.encode(toJson());

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        id: json["id"],
        video: json["video"],
        videoDataSize: json["video_data_size"],
        duration: json["duration"],
        desc: json["desc"],
        allowDownload: json["allow_download"],
        allowDuet: json["allow_duet"],
        allowReact: json["allow_react"],
        allowMusic: json["allow_music"],
        allowDouplus: json["allow_douplus"],
        allowShare: json["allow_share"],
        diggCount: json["digg_count"],
        commentCount: json["comment_count"],
        downloadCount: json["download_count"],
        playCount: json["play_count"],
        shareCount: json["share_count"],
        forwardCount: json["forward_count"],
        collectCount: json["collect_count"],
        sort: json["sort"],
        isTop: json["is_top"],
        city: json["city"],
        address: json["address"],
        musicId: json["musicId"],
        createTime: json["create_time"],
        creatorId: json["creator_id"],
        status: json["status"],
        topics: json["topics"] == null ? [] : List<Topic>.from(json["topics"]!.map((x) => Topic.fromJson(x))),
        music: json["music"] == null ? null : Music.fromJson(json["music"]),
        author: json["author"] == null ? null : Author.fromJson(json["author"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "video": video,
        "video_data_size": videoDataSize,
        "duration": duration,
        "desc": desc,
        "allow_download": allowDownload,
        "allow_duet": allowDuet,
        "allow_react": allowReact,
        "allow_music": allowMusic,
        "allow_douplus": allowDouplus,
        "allow_share": allowShare,
        "digg_count": diggCount,
        "comment_count": commentCount,
        "download_count": downloadCount,
        "play_count": playCount,
        "share_count": shareCount,
        "forward_count": forwardCount,
        "collect_count": collectCount,
        "sort": sort,
        "is_top": isTop,
        "city": city,
        "address": address,
        "musicId": musicId,
        "create_time": createTime,
        "creator_id": creatorId,
        "status": status,
        "topics": topics == null ? [] : List<dynamic>.from(topics!.map((x) => x.toJson())),
        "music": music?.toJson(),
        "author": author?.toJson(),
      };
}

class Author {
  Author({
    this.id,
    this.uniqueIdModifyTime,
    this.uniqueId,
    this.favoritingCount,
    this.city,
    this.province,
    this.country,
    this.location,
    this.birthday,
    this.cover,
    this.followingCount,
    this.followerCount,
    this.awemeCount,
    this.nickname,
    this.certification,
    this.phone,
    this.sex,
    this.lastLoginTime,
    this.createTime,
    this.status,
    this.desc,
    this.isPrivate,
  });

  final String? id;
  final String? uniqueIdModifyTime;
  final String? uniqueId;
  final int? favoritingCount;
  final String? city;
  final String? province;
  final String? country;
  final String? location;
  final DateTime? birthday;
  final String? cover;
  final int? followingCount;
  final int? followerCount;
  final int? awemeCount;
  final String? nickname;
  final String? certification;
  final String? phone;
  final String? sex;
  final String? lastLoginTime;
  final String? createTime;
  final int? status;
  final String? desc;
  final int? isPrivate;

  factory Author.fromRawJson(String str) => Author.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json["id"],
        uniqueIdModifyTime: json["unique_id_modify_time"],
        uniqueId: json["unique_id"],
        favoritingCount: json["favoriting_count"],
        city: json["city"],
        province: json["province"],
        country: json["country"],
        location: json["location"],
        // birthday: json["birthday"] == null ? null : DateTime.parse(json["birthday"]),
        birthday: null,
        cover: json["cover"],
        followingCount: json["following_count"],
        followerCount: json["follower_count"],
        awemeCount: json["aweme_count"],
        nickname: json["nickname"],
        certification: json["certification"],
        phone: json["phone"],
        sex: json["sex"],
        lastLoginTime: json["last_login_time"],
        createTime: json["create_time"],
        status: json["status"],
        desc: json["desc"],
        isPrivate: json["is_private"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "unique_id_modify_time": uniqueIdModifyTime,
        "unique_id": uniqueId,
        "favoriting_count": favoritingCount,
        "city": city,
        "province": province,
        "country": country,
        "location": location,
        "birthday":
            "${birthday!.year.toString().padLeft(4, '0')}-${birthday!.month.toString().padLeft(2, '0')}-${birthday!.day.toString().padLeft(2, '0')}",
        "cover": cover,
        "following_count": followingCount,
        "follower_count": followerCount,
        "aweme_count": awemeCount,
        "nickname": nickname,
        "certification": certification,
        "phone": phone,
        "sex": sex,
        "last_login_time": lastLoginTime,
        "create_time": createTime,
        "status": status,
        "desc": desc,
        "is_private": isPrivate,
      };
}

class Music {
  Music({
    this.id,
    this.cover,
    this.mp3,
    this.title,
    this.creatorId,
    this.createTime,
    this.status,
  });

  final String? id;
  final String? cover;
  final String? mp3;
  final String? title;
  final String? creatorId;
  final String? createTime;
  final int? status;

  factory Music.fromRawJson(String str) => Music.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Music.fromJson(Map<String, dynamic> json) => Music(
        id: json["id"],
        cover: json["cover"],
        mp3: json["mp3"],
        title: json["title"],
        creatorId: json["creator_id"],
        createTime: json["create_time"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cover": cover,
        "mp3": mp3,
        "title": title,
        "creator_id": creatorId,
        "create_time": createTime,
        "status": status,
      };
}

class Topic {
  Topic({
    this.id,
    this.name,
    this.creatorId,
    this.createTime,
    this.status,
  });

  final String? id;
  final String? name;
  final String? creatorId;
  final String? createTime;
  final int? status;

  factory Topic.fromRawJson(String str) => Topic.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        id: json["id"],
        name: json["name"],
        creatorId: json["creator_id"],
        createTime: json["create_time"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "creator_id": creatorId,
        "create_time": createTime,
        "status": status,
      };
}
