// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemoImpl _$$MemoImplFromJson(Map<String, dynamic> json) => _$MemoImpl(
      date: json['date'] as String,
      hour: json['hour'] as String,
      textUser: json['textUser'] as String,
      nameRandom: json['nameRandom'] as String,
      guess: json['guess'] as bool,
    );

Map<String, dynamic> _$$MemoImplToJson(_$MemoImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'hour': instance.hour,
      'textUser': instance.textUser,
      'nameRandom': instance.nameRandom,
      'guess': instance.guess,
    };
