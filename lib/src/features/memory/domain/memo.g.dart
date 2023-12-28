// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemoImpl _$$MemoImplFromJson(Map<String, dynamic> json) => _$MemoImpl(
      datetime: json['datetime'] == null
          ? null
          : DateTime.parse(json['datetime'] as String),
      textUser: json['textUser'] as String,
      nameRandom: json['nameRandom'] as String,
      guess: json['guess'] as bool,
    );

Map<String, dynamic> _$$MemoImplToJson(_$MemoImpl instance) =>
    <String, dynamic>{
      'datetime': instance.datetime?.toIso8601String(),
      'textUser': instance.textUser,
      'nameRandom': instance.nameRandom,
      'guess': instance.guess,
    };
