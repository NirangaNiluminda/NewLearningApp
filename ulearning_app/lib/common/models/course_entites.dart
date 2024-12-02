class CourseRequestEntity {
  int? id;

  CourseRequestEntity({
    this.id,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
      };
}

class SearchRequestEntity {
  String? search;
  SearchRequestEntity({
    this.search,
  });

  Map<String, dynamic> toJson() => {
        'search': search,
      };
}

class CourseListRequestEntity {
  int? code;
  String? msg;
  List<CourseItem>? data;

  CourseListRequestEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory CourseListRequestEntity.fromJson(Map<String, dynamic> json) =>
  CourseListRequestEntity(
        code: json['code'],
        msg: json['msg'],
        data: json['data'] == null? []: List<CourseItem>.from(json['data'].map((x)=> CourseItem.fromJson(x))),
      );
}

//api post response msf
class CourseDetailResponseEntity {
  int? code;
  String? msg;
  CourseItem? data;
  CourseDetailResponseEntity({
    this.code,
    this.msg,
    this.data,
  });
  factory CourseDetailResponseEntity.fromJson(Map<String, dynamic> json) =>
      CourseDetailResponseEntity(
        code: json['code'],
        msg: json['msg'],
        data: CourseItem.fromJson(json['data']),
      );
}

class AuthorRequestEntity {
  String? token;

  AuthorRequestEntity({
    this.token,
  });
  Map<String, dynamic> toJson() => {
        'token': token,
      };
}

class AuthorResponseEntity {
  int? code;
  String? msg;
  AuthItem? data;
  AuthorResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory AuthorResponseEntity.fromJson(Map<String, dynamic> json) =>
      AuthorResponseEntity(
        code: json['code'],
        msg: json['msg'],
        data: AuthItem.fromJson(json['data']),
      );
}

//login results
class AuthItem {
  String? token;
  String? name;
  String? description;
  String? avatar;
  String? job;
  String? follow;
  int? score;
  int? download;
  int? online;

  AuthItem({
    this.token,
    this.name,
    this.description,
    this.avatar,
    this.job,
    this.follow,
    this.score,
    this.download,
    this.online,
  });

  factory AuthItem.fromJson(Map<String, dynamic> json) => AuthItem(
        token: json['token'],
        name: json['name'],
        description: json['description'],
        avatar: json['avatar'],
        job: json['job'],
        follow: json['follow'],
        score: json['score'],
        download: json['download'],
        online: json['online'],
      );

  Map<String, dynamic> toJson() => {
        'token': token,
        'name': name,
        'description': description,
        'avatar': avatar,
        'job': job,
        'follow': follow,
        'score': score,
        'download': download,
        'online': online,
      };
}

//login results
class CourseItem {
  String? user_token;
  String? name;
  String? description;
  String? thumbnail;
  String? video;
  String? price;
  String? amount_total;
  String? lesson_num;
  int? video_len;
  int? down_num;
  int? follow;
  int? score;
  int? id;

  CourseItem({
    this.user_token,
    this.name,
    this.description,
    this.thumbnail,
    this.video,
    this.price,
    this.amount_total,
    this.lesson_num,
    this.video_len,
    this.down_num,
    this.follow,
    this.score,
    this.id,
  });

  factory CourseItem.fromJson(Map<String, dynamic> json) => CourseItem(
        user_token: json['user_token'],
        name: json['name'],
        description: json['description'],
        thumbnail: json['thumbnail'],
        video: json['video'],
        price: json['price'].toString(),
        amount_total: json['amount_total'],
        lesson_num: json['lesson_num'],
        video_len: json['video_len'],
        down_num: json['down_num'],
        follow: json['follow'],
        score: json['score'],
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        'user_token': user_token,
        'name': name,
        'description': description,
        'thumbnail': thumbnail,
        'video': video,
        'price': price,
        'amount_total': amount_total,
        'lesson_num': lesson_num,
        'video_len': video_len,
        'down_num': down_num,
        'follow': follow,
        'score': score,
        'id': id,
      };
}
