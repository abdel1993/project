class Users {
  String? fname;
  String? lname;

  Users({this.fname, this.lname});

  Users.fromJson(Map<String, dynamic> json) {
    fname = json['fname'];
    lname = json['lname'];
  }
}
