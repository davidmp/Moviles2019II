import 'package:json_annotation/json_annotation.dart';

part 'wrapped_response.g.dart';

@JsonSerializable()
class WrappedResponse {
  
  @JsonKey(name: "data")
  Map<String,dynamic> data;
  
  WrappedResponse();

  factory WrappedResponse.fromJson2(Map<String, dynamic > json)=> 
  __$WrappedResponseFromJson(json);

  Map<String,dynamic> toJson2()=>__$WrappedResponseToJson(this);
}