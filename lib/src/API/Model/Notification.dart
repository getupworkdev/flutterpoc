class Notification {
  List<NotificationData> notificationModel;
  int code;
  bool success;
  String result;

  Notification({this.notificationModel, this.code, this.success, this.result});

  Notification.fromJson(Map<String, dynamic> json) {
    if (json['notificationModel'] != null) {
      notificationModel = new List<NotificationData>();
      json['notificationModel'].forEach((v) {
        notificationModel.add(new NotificationData.fromJson(v));
      });
    }
    code = json['code'];
    success = json['success'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.notificationModel != null) {
      data['notificationModel'] =
          this.notificationModel.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    data['success'] = this.success;
    data['result'] = this.result;
    return data;
  }
}

class NotificationData {
  String notification;
  String notificationBody;
  int userId;
  Null refId;
  String modified;
  String created;

  NotificationData(
      {this.notification,
        this.notificationBody,
        this.userId,
        this.refId,
        this.modified,
        this.created});

  NotificationData.fromJson(Map<String, dynamic> json) {
    notification = json['notification'];
    notificationBody = json['notification_body'];
    userId = json['user_id'];
    refId = json['ref_id'];
    modified = json['modified'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notification'] = this.notification;
    data['notification_body'] = this.notificationBody;
    data['user_id'] = this.userId;
    data['ref_id'] = this.refId;
    data['modified'] = this.modified;
    data['created'] = this.created;
    return data;
  }
}
