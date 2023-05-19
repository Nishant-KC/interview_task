import 'dart:convert';

List<Commit> commitFromJson(String str) => List<Commit>.from(json.decode(str).map((x) => Commit.fromJson(x)));

String commitToJson(List<Commit> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Commit {
  String sha;
  String nodeId;
  CommitClass commit;
  String url;
  String htmlUrl;
  String commentsUrl;
  Committer author;
  Committer committer;
  List<Parent> parents;

  Commit({
    required this.sha,
    required this.nodeId,
    required this.commit,
    required this.url,
    required this.htmlUrl,
    required this.commentsUrl,
    required this.author,
    required this.committer,
    required this.parents,
  });

  factory Commit.fromJson(Map<String, dynamic> json) => Commit(
    sha: json["sha"],
    nodeId: json["node_id"],
    commit: CommitClass.fromJson(json["commit"]),
    url: json["url"],
    htmlUrl: json["html_url"],
    commentsUrl: json["comments_url"],
    author: Committer.fromJson(json["author"]),
    committer: Committer.fromJson(json["committer"]),
    parents: List<Parent>.from(json["parents"].map((x) => Parent.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "sha": sha,
    "node_id": nodeId,
    "commit": commit.toJson(),
    "url": url,
    "html_url": htmlUrl,
    "comments_url": commentsUrl,
    "author": author.toJson(),
    "committer": committer.toJson(),
    "parents": List<dynamic>.from(parents.map((x) => x.toJson())),
  };
}

class Committer {
  String login;
  int id;
  String nodeId;
  String avatarUrl;
  String gravatarId;
  String url;
  String htmlUrl;
  String followersUrl;
  String followingUrl;
  String gistsUrl;
  String starredUrl;
  String subscriptionsUrl;
  String organizationsUrl;
  String reposUrl;
  String eventsUrl;
  String receivedEventsUrl;
  Type type;
  bool siteAdmin;

  Committer({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.siteAdmin,
  });

  factory Committer.fromJson(Map<String, dynamic> json) => Committer(
    login: json["login"],
    id: json["id"],
    nodeId: json["node_id"],
    avatarUrl: json["avatar_url"],
    gravatarId: json["gravatar_id"],
    url: json["url"],
    htmlUrl: json["html_url"],
    followersUrl: json["followers_url"],
    followingUrl: json["following_url"],
    gistsUrl: json["gists_url"],
    starredUrl: json["starred_url"],
    subscriptionsUrl: json["subscriptions_url"],
    organizationsUrl: json["organizations_url"],
    reposUrl: json["repos_url"],
    eventsUrl: json["events_url"],
    receivedEventsUrl: json["received_events_url"],
    type: typeValues.map[json["type"]]!,
    siteAdmin: json["site_admin"],
  );

  Map<String, dynamic> toJson() => {
    "login": login,
    "id": id,
    "node_id": nodeId,
    "avatar_url": avatarUrl,
    "gravatar_id": gravatarId,
    "url": url,
    "html_url": htmlUrl,
    "followers_url": followersUrl,
    "following_url": followingUrl,
    "gists_url": gistsUrl,
    "starred_url": starredUrl,
    "subscriptions_url": subscriptionsUrl,
    "organizations_url": organizationsUrl,
    "repos_url": reposUrl,
    "events_url": eventsUrl,
    "received_events_url": receivedEventsUrl,
    "type": typeValues.reverse[type],
    "site_admin": siteAdmin,
  };
}

enum Type { USER }

final typeValues = EnumValues({
  "User": Type.USER
});

class CommitClass {
  Author author;
  Author committer;
  String message;
  Tree tree;
  String url;
  int commentCount;
  Verification verification;

  CommitClass({
    required this.author,
    required this.committer,
    required this.message,
    required this.tree,
    required this.url,
    required this.commentCount,
    required this.verification,
  });

  factory CommitClass.fromJson(Map<String, dynamic> json) => CommitClass(
    author: Author.fromJson(json["author"]),
    committer: Author.fromJson(json["committer"]),
    message: json["message"],
    tree: Tree.fromJson(json["tree"]),
    url: json["url"],
    commentCount: json["comment_count"],
    verification: Verification.fromJson(json["verification"]),
  );

  Map<String, dynamic> toJson() => {
    "author": author.toJson(),
    "committer": committer.toJson(),
    "message": message,
    "tree": tree.toJson(),
    "url": url,
    "comment_count": commentCount,
    "verification": verification.toJson(),
  };
}

class Author {
  String name;
  String email;
  DateTime date;

  Author({
    required this.name,
    required this.email,
    required this.date,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    name: json["name"],
    email: json["email"],
    date: DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "date": date.toIso8601String(),
  };
}

class Tree {
  String sha;
  String url;

  Tree({
    required this.sha,
    required this.url,
  });

  factory Tree.fromJson(Map<String, dynamic> json) => Tree(
    sha: json["sha"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "sha": sha,
    "url": url,
  };
}

class Verification {
  bool verified;
  Reason reason;
  dynamic signature;
  dynamic payload;

  Verification({
    required this.verified,
    required this.reason,
    required this.signature,
    required this.payload,
  });

  factory Verification.fromJson(Map<String, dynamic> json) => Verification(
    verified: json["verified"],
    reason: reasonValues.map[json["reason"]]!,
    signature: json["signature"],
    payload: json["payload"],
  );

  Map<String, dynamic> toJson() => {
    "verified": verified,
    "reason": reasonValues.reverse[reason],
    "signature": signature,
    "payload": payload,
  };
}

enum Reason { UNSIGNED }

final reasonValues = EnumValues({
  "unsigned": Reason.UNSIGNED
});

class Parent {
  String sha;
  String url;
  String htmlUrl;

  Parent({
    required this.sha,
    required this.url,
    required this.htmlUrl,
  });

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
    sha: json["sha"],
    url: json["url"],
    htmlUrl: json["html_url"],
  );

  Map<String, dynamic> toJson() => {
    "sha": sha,
    "url": url,
    "html_url": htmlUrl,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
