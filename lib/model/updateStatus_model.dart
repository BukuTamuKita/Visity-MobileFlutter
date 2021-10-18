import 'dart:convert';

UpdateStatus updateStatusFromJson(String str) => UpdateStatus.fromJson(json.decode(str));

String updateStatusToJson(UpdateStatus data) => json.encode(data.toJson());

class UpdateStatus {
    UpdateStatus({
        required this.data,
    });

    Data data;

    factory UpdateStatus.fromJson(Map<String, dynamic> json) => UpdateStatus(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Data({
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

    factory Data.fromJson(Map<String, dynamic> json) => Data(
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
