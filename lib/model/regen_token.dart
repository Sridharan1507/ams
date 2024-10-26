
class RegenTokenRequestBody {
  String? sessionToken;

  RegenTokenRequestBody({this.sessionToken});

  RegenTokenRequestBody.fromJson(Map<String, dynamic> json) {
    sessionToken = json['sessionToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sessionToken'] = this.sessionToken;
    return data;
  }
}