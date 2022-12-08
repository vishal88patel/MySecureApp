// To parse this JSON data, do
//
//     final faqsModel = faqsModelFromJson(jsonString);

import 'dart:convert';

FaqsModel faqsModelFromJson(String str) => FaqsModel.fromJson(json.decode(str));

String faqsModelToJson(FaqsModel data) => json.encode(data.toJson());

class FaqsModel {
  FaqsModel({
    this.status,
    this.message,
    this.data,
  });

  final bool? status;
  final String? message;
  final List<FaqData>? data;

  factory FaqsModel.fromJson(Map<String, dynamic> json) => FaqsModel(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : List<FaqData>.from(json["data"].map((x) => FaqData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class FaqData {
  FaqData({
    this.id,
    this.question,
    this.answer,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String? question;
  final String? answer;
  final dynamic createdAt;
  final dynamic updatedAt;

  factory FaqData.fromJson(Map<String, dynamic> json) => FaqData(
    id: json["id"] == null ? null : json["id"],
    question: json["question"] == null ? null : json["question"],
    answer: json["answer"] == null ? null : json["answer"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "question": question == null ? null : question,
    "answer": answer == null ? null : answer,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
