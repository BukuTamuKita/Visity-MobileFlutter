// To parse this JSON data, do
//
//     final host = hostFromJson(jsonString);

import 'dart:convert';

Host hostFromJson(String str) => Host.fromJson(json.decode(str));

String hostToJson(Host data) => json.encode(data.toJson());

class Host {
  int id;
  String name;
  String nip;
  String position;
  Users users;

  Host({
    required this.id,
    required this.name,
    required this.nip,
    required this.position,
    required this.users,
  });

  factory Host.fromJson(Map<String, dynamic> json) => Host(
        id: json["id"],
        name: json["name"],
        nip: json["nip"],
        position: json["position"],
        users: Users.fromJson(json["users"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "nip": nip,
        "position": position,
        "users": users.toJson(),
      };
}

class Users {
  int id;
  String name;
  String email;
  String role;
  String photo;

  Users({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.photo,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        role: json["role"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "role": role,
        "photo": photo,
      };
}
