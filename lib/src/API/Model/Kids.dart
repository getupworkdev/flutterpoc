class Kids {
  String message;
  List<KidsData> data;

  Kids({this.message, this.data});

  Kids.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = new List<KidsData>();
      json['data'].forEach((v) {
        data.add(new KidsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class KidsData {
  String permittedDriver;
  int parentId;
  int studentId;
  int locationId;
  int schoolId;
  String enterTravelMode;
  String exitTravelMode;
  int attachmentId;
  String userName;
  String studentName;
  String cardId;
  String dismissalFrom;
  String schoolLat;
  String schoolLong;
  String schoolName;
  String parentLastName;
  String mobile;
  String parentIdentity;
  int isActive;
  int isDelete;
  int userStudentId;
  String modified;
  String created;
  String userIdentityImage;
  String userImage;

  KidsData(
      {this.permittedDriver,
        this.parentId,
        this.studentId,
        this.locationId,
        this.schoolId,
        this.enterTravelMode,
        this.exitTravelMode,
        this.attachmentId,
        this.userName,
        this.studentName,
        this.cardId,
        this.dismissalFrom,
        this.schoolLat,
        this.schoolLong,
        this.schoolName,
        this.parentLastName,
        this.mobile,
        this.parentIdentity,
        this.isActive,
        this.isDelete,
        this.userStudentId,
        this.modified,
        this.created,
        this.userIdentityImage,
        this.userImage});

  KidsData.fromJson(Map<String, dynamic> json) {
    permittedDriver = json['permittedDriver'];
    parentId = json['parent_id'];
    studentId = json['student_id'];
    locationId = json['location_id'];
    schoolId = json['school_id'];
    enterTravelMode = json['enter_travel_mode'];
    exitTravelMode = json['exit_travel_mode'];
    attachmentId = json['attachment_id'];
    userName = json['user_name'];
    studentName = json['student_name'];
    cardId = json['card_id'];
    dismissalFrom = json['dismissal_from'];
    schoolLat = json['school_lat'];
    schoolLong = json['school_long'];
    schoolName = json['school_name'];
    parentLastName = json['parent_last_name'];
    mobile = json['mobile'];
    parentIdentity = json['parent_identity'];
    isActive = json['is_active'];
    isDelete = json['is_delete'];
    userStudentId = json['user_student_id'];
    modified = json['modified'];
    created = json['created'];
    userIdentityImage = json['user_identity_image'];
    userImage = json['user_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['permittedDriver'] = this.permittedDriver;
    data['parent_id'] = this.parentId;
    data['student_id'] = this.studentId;
    data['location_id'] = this.locationId;
    data['school_id'] = this.schoolId;
    data['enter_travel_mode'] = this.enterTravelMode;
    data['exit_travel_mode'] = this.exitTravelMode;
    data['attachment_id'] = this.attachmentId;
    data['user_name'] = this.userName;
    data['student_name'] = this.studentName;
    data['card_id'] = this.cardId;
    data['dismissal_from'] = this.dismissalFrom;
    data['school_lat'] = this.schoolLat;
    data['school_long'] = this.schoolLong;
    data['school_name'] = this.schoolName;
    data['parent_last_name'] = this.parentLastName;
    data['mobile'] = this.mobile;
    data['parent_identity'] = this.parentIdentity;
    data['is_active'] = this.isActive;
    data['is_delete'] = this.isDelete;
    data['user_student_id'] = this.userStudentId;
    data['modified'] = this.modified;
    data['created'] = this.created;
    data['user_identity_image'] = this.userIdentityImage;
    data['user_image'] = this.userImage;
    return data;
  }
}
