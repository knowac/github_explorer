// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "appTitle": MessageLookupByLibrary.simpleMessage("Github Explorer"),
    "cannotOpenLink": MessageLookupByLibrary.simpleMessage("Cannot open link"),
    "clearQueryButtonAccessibility": MessageLookupByLibrary.simpleMessage(
      "Clear query",
    ),
    "enterKeyword": MessageLookupByLibrary.simpleMessage("Search repositories"),
    "enterKeywordHint": MessageLookupByLibrary.simpleMessage("Start typing"),
    "error": MessageLookupByLibrary.simpleMessage("Error"),
    "generalError": MessageLookupByLibrary.simpleMessage(
      "Failed to fetch repositories",
    ),
    "issues": MessageLookupByLibrary.simpleMessage("Issues"),
    "language": MessageLookupByLibrary.simpleMessage("Language"),
    "noData": MessageLookupByLibrary.simpleMessage("No data"),
    "noIssues": MessageLookupByLibrary.simpleMessage("No issues"),
    "noPullRequests": MessageLookupByLibrary.simpleMessage("No pull requests"),
    "pageNotExist": MessageLookupByLibrary.simpleMessage(
      "Given page does not exist",
    ),
    "pullRequests": MessageLookupByLibrary.simpleMessage("Pull requests"),
    "rateLimitError": MessageLookupByLibrary.simpleMessage(
      "Github does not allow more requests. Please try again later.",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("Retry"),
    "searchButtonAccessibility": MessageLookupByLibrary.simpleMessage(
      "Search repositories",
    ),
    "stars": MessageLookupByLibrary.simpleMessage("Stars"),
  };
}
