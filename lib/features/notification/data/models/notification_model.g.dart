// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationItemImpl _$$NotificationItemImplFromJson(
  Map<String, dynamic> json,
) => _$NotificationItemImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  time: json['time'] as String,
  message: json['message'] as String,
  highlights:
      (json['highlights'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  notificationType: json['notificationtype'] as String,
  unread: json['unread'] as bool? ?? false,
);

Map<String, dynamic> _$$NotificationItemImplToJson(
  _$NotificationItemImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'time': instance.time,
  'message': instance.message,
  'highlights': instance.highlights,
  'notificationtype': instance.notificationType,
  'unread': instance.unread,
};
