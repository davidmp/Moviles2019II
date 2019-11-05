import 'dart:io';

import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';
import 'package:servicio_upeu/models/categoriacli.dart';
import 'package:servicio_upeu/webservices/url_api.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

part 'api_categorcli.g.dart';

@RestApi(baseUrl: url_base)
abstract class RestCategorCli {
  factory RestCategorCli(Dio dio) = _RestCategorCli;

  @GET("post")
  Future<List<CategoriaCliente>> listCategorCli();
  @GET("post2")
  Future<List<CategoriaCliente>> listCategorCli2();

  @GET("/catcli/{id}")
  Future<CategoriaCliente> getCategorCliId(@Path("id") String id);

  @PATCH("/catcli/{id}")
  Future<CategoriaCliente> updateCategorCliPart(
      @Path() String id, @Body() Map<String, dynamic> map);

  @PUT("/catcli/catcliu/{id}")
  Future<CategoriaCliente> updateCategorCli(
      @Path() String id, @Body() CategoriaCliente task);

  @DELETE("/catcli/catcli/{id}")
  Future<void> deleteCategorCli(@Path("id") int id);

  @POST("/catcli")
  Future<CategoriaCliente> createCategorCli(@Body() CategoriaCliente task);
/*
  @POST("http://httpbin.org/post")
  Future<void> createNewCategorCliFromFile(@Field() File file);*/
}
