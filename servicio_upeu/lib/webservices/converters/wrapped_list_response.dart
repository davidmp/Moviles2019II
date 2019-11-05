import 'package:json_annotation/json_annotation.dart';

part 'wrapped_list_response.g.dart';

@JsonSerializable()
class WrappedListResponse {
  @JsonKey(name: "data")
  List<dynamic> data;

  WrappedListResponse();

  factory WrappedListResponse.fromJson(Map<dynamic, dynamic> json) =>
      _$WrappedListResponseFromJson(json);
  Map<dynamic, dynamic> toJson() => _$WrappedListResponseToJson(this);

  factory WrappedListResponse.fromJson2(Map<dynamic, dynamic> json) =>
      __$WrappedListResponseFromJson(json);
  Map<dynamic, dynamic> toJson2() => __$WrappedListResponseToJson(this);
}
