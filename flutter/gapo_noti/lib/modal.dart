class Datas {
  List<Data>? listData;

  Datas({this.listData});

  Datas.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      listData = <Data>[];
      json['data'].forEach((v) {
        listData!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (listData != null) {
      data['data'] = listData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

//List<Data> datas=[];

class Data {
  String? id;
  String? type;
  String? title;
  Message? message;
  String? image;
  String? icon;
  String? status;
  Subscription? subscription;
  int? readAt;
  int? createdAt;
  int? updatedAt;
  int? receivedAt;
  String? imageThumb;
  String? animation;
  String? tracking;
  String? subjectName;
  bool? isSubscribed;

  Data(
      {this.id,
      this.type,
      this.title,
      this.message,
      this.image,
      this.icon,
      this.status,
      this.subscription,
      this.readAt,
      this.createdAt,
      this.updatedAt,
      this.receivedAt,
      this.imageThumb,
      this.animation,
      this.tracking,
      this.subjectName,
      this.isSubscribed});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    title = json['title'];
    message =
        json['message'] != null ? Message.fromJson(json['message']) : null;
    image = json['image'];
    icon = json['icon'];
    status = json['status'];
    subscription = json['subscription'] != null
        ? Subscription.fromJson(json['subscription'])
        : null;
    readAt = json['readAt'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    receivedAt = json['receivedAt'];
    imageThumb = json['imageThumb'];
    animation = json['animation'];
    tracking = json['tracking'];
    subjectName = json['subjectName'];
    isSubscribed = json['isSubscribed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['title'] = title;
    if (message != null) {
      data['message'] = message!.toJson();
    }
    data['image'] = image;
    data['icon'] = icon;
    data['status'] = status;
    if (subscription != null) {
      data['subscription'] = subscription!.toJson();
    }
    data['readAt'] = readAt;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['receivedAt'] = receivedAt;
    data['imageThumb'] = imageThumb;
    data['animation'] = animation;
    data['tracking'] = tracking;
    data['subjectName'] = subjectName;
    data['isSubscribed'] = isSubscribed;
    return data;
  }
}

class Message {
  String? text;
  String? textKhongDau;
  List<Highlights>? highlights;

  Message({this.text, this.highlights});

  Message.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    textKhongDau = bodau(json['text']);
    if (json['highlights'] != null) {
      highlights = <Highlights>[];
      json['highlights'].forEach((v) {
        highlights!.add(Highlights.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    if (highlights != null) {
      data['highlights'] = highlights!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Highlights {
  int? offset;
  int? length;

  Highlights({this.offset, this.length});

  Highlights.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    length = json['length'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['offset'] = offset;
    data['length'] = length;
    return data;
  }
}

class Subscription {
  String? targetId;
  String? targetType;
  String? targetName;
  int? level;

  Subscription({this.targetId, this.targetType, this.targetName, this.level});

  Subscription.fromJson(Map<String, dynamic> json) {
    targetId = json['targetId'];
    targetType = json['targetType'];
    targetName = json['targetName'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['targetId'] = targetId;
    data['targetType'] = targetType;
    data['targetName'] = targetName;
    data['level'] = level;
    return data;
  }
}

String bodau(String s) {
  s = s.replaceAll('á', 'a').replaceAll('á'.toLowerCase(), 'a'.toLowerCase());
  s = s.replaceAll('à', 'a').replaceAll('à'.toLowerCase(), 'a'.toLowerCase());
  s = s.replaceAll('ả', 'a').replaceAll('ả'.toLowerCase(), 'a'.toLowerCase());
  s = s.replaceAll('ã', 'a').replaceAll('ã'.toLowerCase(), 'a'.toLowerCase());
  s = s.replaceAll('ạ', 'a').replaceAll('ạ'.toLowerCase(), 'a'.toLowerCase());
  s = s.replaceAll('â', 'a').replaceAll('â'.toLowerCase(), 'a'.toLowerCase());
  s = s.replaceAll('ấ', 'a').replaceAll('ấ'.toLowerCase(), 'a'.toLowerCase());
  s = s.replaceAll('ầ', 'a').replaceAll('ầ'.toLowerCase(), 'a'.toLowerCase());
  s = s.replaceAll('ẩ', 'a').replaceAll('ẩ'.toLowerCase(), 'a'.toLowerCase());
  s = s.replaceAll('ẫ', 'a').replaceAll('ẫ'.toLowerCase(), 'a'.toLowerCase());
  s = s.replaceAll('ậ', 'a').replaceAll('ậ'.toLowerCase(), 'a'.toLowerCase());
  s = s.replaceAll('ă', 'a').replaceAll('ă'.toLowerCase(), 'a'.toLowerCase());
  s = s.replaceAll('ắ', 'a').replaceAll('ắ'.toLowerCase(), 'a'.toLowerCase());
  s = s.replaceAll('ằ', 'a').replaceAll('ằ'.toLowerCase(), 'a'.toLowerCase());
  s = s.replaceAll('ẳ', 'a').replaceAll('ẳ'.toLowerCase(), 'a'.toLowerCase());
  s = s.replaceAll('ẵ', 'a').replaceAll('ẵ'.toLowerCase(), 'a'.toLowerCase());
  s = s.replaceAll('ặ', 'a').replaceAll('ặ'.toLowerCase(), 'a'.toLowerCase());

  s = s.replaceAll('é', 'e').replaceAll('é'.toLowerCase(), 'e'.toLowerCase());
  s = s.replaceAll('è', 'e').replaceAll('è'.toLowerCase(), 'e'.toLowerCase());
  s = s.replaceAll('ẻ', 'e').replaceAll('ẻ'.toLowerCase(), 'e'.toLowerCase());
  s = s.replaceAll('ẽ', 'e').replaceAll('ẽ'.toLowerCase(), 'e'.toLowerCase());
  s = s.replaceAll('ẹ', 'e').replaceAll('ẹ'.toLowerCase(), 'e'.toLowerCase());
  s = s.replaceAll('ê', 'e').replaceAll('ê'.toLowerCase(), 'e'.toLowerCase());
  s = s.replaceAll('ế', 'e').replaceAll('ế'.toLowerCase(), 'e'.toLowerCase());
  s = s.replaceAll('ề', 'e').replaceAll('ề'.toLowerCase(), 'e'.toLowerCase());
  s = s.replaceAll('ể', 'e').replaceAll('ể'.toLowerCase(), 'e'.toLowerCase());
  s = s.replaceAll('ễ', 'e').replaceAll('ễ'.toLowerCase(), 'e'.toLowerCase());
  s = s.replaceAll('ệ', 'e').replaceAll('ệ'.toLowerCase(), 'e'.toLowerCase());

  s = s.replaceAll('í', 'i').replaceAll('í'.toLowerCase(), 'i'.toLowerCase());
  s = s.replaceAll('ì', 'i').replaceAll('ì'.toLowerCase(), 'i'.toLowerCase());
  s = s.replaceAll('ỉ', 'i').replaceAll('ỉ'.toLowerCase(), 'i'.toLowerCase());
  s = s.replaceAll('ĩ', 'i').replaceAll('ĩ'.toLowerCase(), 'i'.toLowerCase());
  s = s.replaceAll('ị', 'i').replaceAll('ị'.toLowerCase(), 'i'.toLowerCase());

  s = s.replaceAll('ó', 'o').replaceAll('ó'.toLowerCase(), 'o'.toLowerCase());
  s = s.replaceAll('ò', 'o').replaceAll('ò'.toLowerCase(), 'o'.toLowerCase());
  s = s.replaceAll('ỏ', 'o').replaceAll('ỏ'.toLowerCase(), 'o'.toLowerCase());
  s = s.replaceAll('õ', 'o').replaceAll('õ'.toLowerCase(), 'o'.toLowerCase());
  s = s.replaceAll('ọ', 'o').replaceAll('ọ'.toLowerCase(), 'o'.toLowerCase());
  s = s.replaceAll('ô', 'o').replaceAll('ô'.toLowerCase(), 'o'.toLowerCase());
  s = s.replaceAll('ố', 'o').replaceAll('ố'.toLowerCase(), 'o'.toLowerCase());
  s = s.replaceAll('ồ', 'o').replaceAll('ồ'.toLowerCase(), 'o'.toLowerCase());
  s = s.replaceAll('ổ', 'o').replaceAll('ổ'.toLowerCase(), 'o'.toLowerCase());
  s = s.replaceAll('ỗ', 'o').replaceAll('ỗ'.toLowerCase(), 'o'.toLowerCase());
  s = s.replaceAll('ộ', 'o').replaceAll('ộ'.toLowerCase(), 'o'.toLowerCase());
  s = s.replaceAll('ơ', 'o').replaceAll('ơ'.toLowerCase(), 'o'.toLowerCase());
  s = s.replaceAll('ớ', 'o').replaceAll('ớ'.toLowerCase(), 'o'.toLowerCase());
  s = s.replaceAll('ờ', 'o').replaceAll('ờ'.toLowerCase(), 'o'.toLowerCase());
  s = s.replaceAll('ở', 'o').replaceAll('ở'.toLowerCase(), 'o'.toLowerCase());
  s = s.replaceAll('ỡ', 'o').replaceAll('ỡ'.toLowerCase(), 'o'.toLowerCase());
  s = s.replaceAll('ợ', 'o').replaceAll('ợ'.toLowerCase(), 'o'.toLowerCase());

  s = s.replaceAll('ú', 'u').replaceAll('ú'.toLowerCase(), 'u'.toLowerCase());
  s = s.replaceAll('ù', 'u').replaceAll('ù'.toLowerCase(), 'u'.toLowerCase());
  s = s.replaceAll('ủ', 'u').replaceAll('ủ'.toLowerCase(), 'u'.toLowerCase());
  s = s.replaceAll('ũ', 'u').replaceAll('ũ'.toLowerCase(), 'u'.toLowerCase());
  s = s.replaceAll('ụ', 'u').replaceAll('ụ'.toLowerCase(), 'u'.toLowerCase());
  s = s.replaceAll('ư', 'u').replaceAll('ư'.toLowerCase(), 'u'.toLowerCase());
  s = s.replaceAll('ứ', 'u').replaceAll('ứ'.toLowerCase(), 'u'.toLowerCase());
  s = s.replaceAll('ừ', 'u').replaceAll('ừ'.toLowerCase(), 'u'.toLowerCase());
  s = s.replaceAll('ử', 'u').replaceAll('ử'.toLowerCase(), 'u'.toLowerCase());
  s = s.replaceAll('ữ', 'u').replaceAll('ữ'.toLowerCase(), 'u'.toLowerCase());
  s = s.replaceAll('ự', 'u').replaceAll('ự'.toLowerCase(), 'u'.toLowerCase());

  s = s.replaceAll('ý', 'y').replaceAll('ý'.toLowerCase(), 'y'.toLowerCase());
  s = s.replaceAll('ỳ', 'y').replaceAll('ỳ'.toLowerCase(), 'y'.toLowerCase());
  s = s.replaceAll('ỷ', 'y').replaceAll('ỷ'.toLowerCase(), 'y'.toLowerCase());
  s = s.replaceAll('ỹ', 'y').replaceAll('ỹ'.toLowerCase(), 'y'.toLowerCase());
  s = s.replaceAll('ỵ', 'y').replaceAll('ỵ'.toLowerCase(), 'y'.toLowerCase());

  s = s.replaceAll('đ', 'd').replaceAll('đ'.toLowerCase(), 'd'.toLowerCase());

  return s;
}
