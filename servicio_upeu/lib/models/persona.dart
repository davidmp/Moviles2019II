
import 'package:json_annotation/json_annotation.dart';

part "persona.g.dart";

@JsonSerializable()
class Persona {
  @JsonKey()
  int idPersona;
  @JsonKey()
  String dniCodigo;
  @JsonKey()
  String nombres;
  @JsonKey()
  String apellidoPat;
  @JsonKey()
  String apellidoMat;
  @JsonKey()
  String celular;
  @JsonKey()
  String usuario;
  @JsonKey()
  String clave;
  @JsonKey()
  String api_token;

  Persona();

  factory Persona.fromJson(Map<String, dynamic> json) =>
      _$PersonaFromJson(json);

  Map<String, dynamic> toJson() => _$PersonaToJson(this);
}
