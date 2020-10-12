import 'package:json_annotation/json_annotation.dart';
import 'package:firebase_database/firebase_database.dart';

part 'model.g.dart';

class FoodBankList {
  final List<FoodBank> foodbanks;

  FoodBankList({
    this.foodbanks,
  });

  factory FoodBankList.fromJson(List<dynamic> parsedJson) {
    List<FoodBank> foodbanks = new List<FoodBank>();
    foodbanks = parsedJson.map((i) => FoodBank.fromJson(i)).toList();

    return new FoodBankList(foodbanks: foodbanks);
  }
}

@JsonSerializable()
class FoodBank {
  //final String id;
  // @JsonKey(name: 'address')
  final String aaddress;

  //@JsonKey(name: 'city')
  final String acity;

  // @JsonKey(name: 'date')
  final String adate;

  // @JsonKey(name: 'name')
  final String aname;

  // @JsonKey(name: 'time')
  final String atime;

  FoodBank(
      { //this.id,
      this.aaddress,
      this.acity,
      this.adate,
      this.aname,
      this.atime});

  // factory FoodBanks.fromJson(Map<String, dynamic> json) =>
  //    _$FoodBanksFromJson(json);
  //Map<String, dynamic> toJson() => _$FoodBanksToJson(this);
  //FoodBanks.fromSnapshot(DataSnapshot snapshot)
  factory FoodBank.fromJson(Map<dynamic, dynamic> json) {
    return new FoodBank(
      aaddress: json['address'],
      acity: json["city"],
      adate: json["date"],
      aname: json["name"],
      atime: json["time"],
    );
  }

  toJson() {
    return {
      "address": aaddress,
      "city": acity,
      "date": adate,
      "name": aname,
      "time": atime,
    };
  }
}
