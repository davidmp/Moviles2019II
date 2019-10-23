// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'persona.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Persona _$PersonaFromJson(Map<String, dynamic> json) {
  return Persona()
    ..idPersona = json['idPersona'] as int
    ..dniCodigo = json['dniCodigo'] as String
    ..nombres = json['nombres'] as String
    ..apellidoPat = json['apellidoPat'] as String
    ..apellidoMat = json['apellidoMat'] as String
    ..celular = json['celular'] as String
    ..usuario = json['usuario'] as String
    ..clave = json['clave'] as String;
//    ..api_token = json['api_token'] as String;
}

Map<String, dynamic> _$PersonaToJson(Persona instance) => <String, dynamic>{
      'idPersona': instance.idPersona,
      'dniCodigo': instance.dniCodigo,
      'nombres': instance.nombres,
      'apellidoPat': instance.apellidoPat,
      'apellidoMat': instance.apellidoMat,
      'celular': instance.celular,
      'usuario': instance.usuario,
      'clave': instance.clave,
      // 'api_token': instance.api_token,
    };
