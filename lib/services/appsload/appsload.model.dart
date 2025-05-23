abstract class AppsLoadFields {
  static const id = 'id';
  static const application = 'application';
  static const platform = 'platform';
  static const email = 'email';
  static const uid = 'uid';
  static const device = 'device';
  static const locale = 'locale';
  static const datetime = 'datetime';
}

class AppsLoadModel {
  int? id;
  String application;
  String platform;
  String email;
  String uid;
  String device;
  String locale;
  int datetime;

  AppsLoadModel({
    this.id,
    required this.application,
    required this.platform,
    required this.email,
    required this.uid,
    required this.device,
    required this.locale,
    required this.datetime,
  });

  factory AppsLoadModel.fromJson(dynamic json) {
    return AppsLoadModel(
      id: json[AppsLoadFields.id],
      application: json[AppsLoadFields.application],
      platform: json[AppsLoadFields.platform],
      email: json[AppsLoadFields.email],
      uid: json[AppsLoadFields.uid],
      device: json[AppsLoadFields.device],
      locale: json[AppsLoadFields.locale],
      datetime: int.parse(json[AppsLoadFields.datetime]),
    );
  }
}
