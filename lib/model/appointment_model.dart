import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

Appointment welcomeFromJson(String str) => Appointment.fromJson(json.decode(str));

String welcomeToJson(Appointment data) => json.encode(data.toJson());

class Appointment {
  final List<Datum> data;
  final Links links;
  final Meta meta;

    const Appointment({
        required this.data,
        required this.links,
        required this.meta,
    });

    factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "links": links.toJson(),
        "meta": meta.toJson(),
    };
}

class Datum {

    final int id;
    final Host host;
    final Guest guest;
    final String purpose;
    final String notes;
    final String status;
    final List<String> dateTime;

    const Datum({
        required this.id,
        required this.host,
        required this.guest,
        required this.purpose,
        required this.notes,
        required this.status,
        required this.dateTime,
    });
    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        host: Host.fromJson(json["host"]),
        guest: Guest.fromJson(json["guest"]),
        purpose: json["purpose"],
        notes: json["notes"],
        status: json["status"],
        dateTime: List<String>.from(json["date_time"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "host": host.toJson(),
        "guest": guest.toJson(),
        "purpose": purpose,
        "notes": notes,
        "status": status,
        "date_time": List<dynamic>.from(dateTime.map((x) => x)),
    };
}

class Guest {

    final int id;
    final String name;
    final String nik;
    final String email;
    final String address;

    const Guest({
        required this.id,
        required this.name,
        required this.nik,
        required this.email,
        required this.address,
    });

    factory Guest.fromJson(Map<String, dynamic> json) => Guest(
        id: json["id"],
        name: json["name"],
        nik: json["nik"],
        email: json["email"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "nik": nik,
        "email": email,
        "address": address,
    };
}

class Host {
    final int id;
    final String name;
    final String nip;
    final String position;
    final Users users;

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
    final int id;
    final String name;
    final String email;
    final String role;
    final String photo;

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

class Links {
    final String first;
    final dynamic last;
    final dynamic prev;
    final dynamic next;

    Links({
        required this.first,
        required this.last,
        required this.prev,
        required this.next,
    });

   

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
    );

    Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
    };
}

class Meta {
    final int currentPage;
    final int from;
    final String path;
    final int perPage;
    final int to;

    Meta({
        required this.currentPage,
        required this.from,
        required this.path,
        required this.perPage,
        required this.to,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "path": path,
        "per_page": perPage,
        "to": to,
    };
}


// class AppointmentResponse {
//   final List<AppointmentData> data;
//   final LinkClass link;

//   const AppointmentResponse({
//     required this.data,
//     required this.link
//     }); 
    

//   factory AppointmentResponse.fromJson(Map<String, dynamic> json) => 
//   AppointmentResponse(
//     data: List<AppointmentData>.from(json['data'].map((data){
//       return AppointmentData.fromJson(data);
//     })),
//     link: LinkClass.fromJson(json['link'])
//   );
// }

// class AppointmentData {
//   final Guest guest;
//   final String purpose;

//   const AppointmentData({
//     required this.guest,
//     required this.purpose
//   });

//   factory AppointmentData.fromJson(Map<String, dynamic> json) => AppointmentData(
//     guest: Guest.fromJson(json['guest']), 
//     purpose: json['purpose']
//     );
// }

// class Guest {
//     final String id;
//     final String name;
//     final String nik;
//     final String email;
//     final String address;

//     const Guest({
//       required this.id,
//       required this.name,
//       required this.nik,
//       required this.email,
//       required this.address,
//     });

//     factory Guest.fromJson(Map<String, dynamic> json) => Guest(
//       id: json['id'], 
//       name:json['name'], 
//       nik: json['nik'], 
//       email:json['email'], 
//       address: json['address']
//      );
// }

// class LinkClass {
//   final String first;
  
//   const LinkClass({
//     required this.first,
//   });
  
//   factory LinkClass.fromJson(Map<String, dynamic> json) => LinkClass(
//     first: json['first'],
//   );
// }