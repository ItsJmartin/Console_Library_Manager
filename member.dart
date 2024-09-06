class Member {
  String name;
  String memberId;
  List<String> borrowed;

  Member(this.name, this.memberId, this.borrowed);

  Map<String, dynamic> toJson() =>
      {'name': name, 'memberId': memberId, 'borrowed': borrowed};

  factory Member.fromJson(Map<String, dynamic> json) => Member(
      json['name'],
      json['memberId'],
      List<String>.from(json['borrowed']));
}
