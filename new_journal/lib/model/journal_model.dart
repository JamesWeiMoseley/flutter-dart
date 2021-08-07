import 'package:flutter/material.dart';
import 'package:new_journal/db/journal_db.dart';

class Entry {
  final int? id;
  final String title;
  final String body;
  final int rating;
  final String date;

  Entry(
      {this.id,
      required this.title,
      required this.body,
      required this.rating,
      required this.date});

  factory Entry.fromMap(Map<String, dynamic> json) => new Entry(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      rating: json['rating'],
      date: json['date']);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'rating': rating,
      'date': date
    };
  }
}
