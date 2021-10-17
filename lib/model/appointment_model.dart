// To parse this JSON data, do
//
//     final showAppointment = showAppointmentFromJson(jsonString);

import 'dart:convert';

ShowAppointment showAppointmentFromJson(String str) => ShowAppointment.fromJson(json.decode(str));

String showAppointmentToJson(ShowAppointment data) => json.encode(data.toJson());

class ShowAppointment {
    ShowAppointment({
        required this.data,
        required this.links,
        required this.meta,
    });

    List<Datum> data;
    Links links;
    Meta meta;

    factory ShowAppointment.fromJson(Map<String, dynamic> json) => ShowAppointment(
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
    Datum({
        required this.id,
        required this.host,
        required this.guest,
        required this.purpose,
        required this.notes,
        required this.status,
        required this.dateTime,
    });

    int id;
    Host host;
    Guest guest;
    String purpose;
    String notes;
    String status;
    List<String> dateTime;

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
    Guest({
        required this.id,
        required this.name,
        required this.nik,
        required this.email,
        required this.address,
    });

    int id;
    String name;
    String nik;
    String email;
    String address;

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
    Host({
        required this.id,
        required this.name,
        required this.nip,
        required this.position,
        required this.users,
    });

    int id;
    String name;
    String nip;
    String position;
    Users users;

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
    Users({
        required this.id,
        required this.name,
        required this.email,
        required this.role,
        required this.photo,
    });

    int id;
    String name;
    String email;
    String role;
    String photo;

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
    Links({
        required this.first,
        this.last,
        this.prev,
        this.next,
    });

    String first;
    dynamic last;
    dynamic prev;
    dynamic next;

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
    Meta({
        required this.currentPage,
        required this.from,
        required this.path,
        required this.perPage,
        required this.to,
    });

    int currentPage;
    int from;
    String path;
    int perPage;
    int to;

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
