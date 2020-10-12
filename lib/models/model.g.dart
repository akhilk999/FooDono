// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodBank _$FoodBankFromJson(Map<String, dynamic> json) {
  return FoodBank(
    aaddress: json['aaddress'] as String,
    acity: json['acity'] as String,
    adate: json['adate'] as String,
    aname: json['aname'] as String,
    atime: json['atime'] as String,
  );
}

Map<String, dynamic> _$FoodBankToJson(FoodBank instance) => <String, dynamic>{
      'aaddress': instance.aaddress,
      'acity': instance.acity,
      'adate': instance.adate,
      'aname': instance.aname,
      'atime': instance.atime,
    };
