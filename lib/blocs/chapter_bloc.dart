import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:formulas_cms/actions/actions.dart';
import 'package:formulas_cms/data/chapters.dart';
import 'package:formulas_cms/models/models.dart';

class ChapterBloc extends Object {
  ValueNotifier<List<Chapter>> chapters = ValueNotifier(null);

  getChapters(String courseId) async {
    chapters.value = null;
    var chaptersRes = await ChapterAction().getChapters(courseId);

    if (chaptersRes != null) {
      List<Chapter> arrangedChapters = List();
      arrangedChapters
          .addAll(chaptersRes.where((c) => c.parentId == null).map((c) {
        return c
          ..children = chaptersRes
              .where((ch) => ch.parentId == c.id)
              .map((chi) => chi..parent = c)
              .toList();
      }).toList());

      this.chapters.value = chaptersRes;
    }
  }

  ValueNotifier<String> searchQuery = ValueNotifier('');

  updateSearchQuery(String q) {
    searchQuery.value = q;
    search(q);
  }

  ValueNotifier<List<Chapter>> searchResults = ValueNotifier(null);

  search(String query) async {
    this.searchResults.value = null;
    var searchRes = await ChapterAction().search(query);

    if (query == this.searchQuery.value) {
      this.searchResults.value = searchRes
          .where((s) =>
              (s.parentId == null && s.children.isEmpty) || s.children.isEmpty)
          .toList();
    }
  }

  resetSearch() {
    this.searchQuery.value = '';
    this.searchResults.value = null;
  }

  Future<bool> addChapters() async {
    var parentChapters = getParentChapters();
    try {
      for (var parentChapter in parentChapters) {
        var pResp = await ChapterAction().addChapter({
          "name": parentChapter.name,
          "description": parentChapter.description,
          "course_id": parentChapter.courseId,
          "parent_chapter_id": null
        });
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
