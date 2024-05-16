import 'dart:convert';

class GithubUser {
  final String login;
  final int id;
  final String nodeId;
  final String avatarUrl;
  final String url;
  final String htmlUrl;
  final String followersUrl;
  final String followingUrl;
  final String gistsUrl;
  final String starredUrl;
  final String subscriptionsUrl;
  final String organizationsUrl;
  final String reposUrl;
  final String eventsUrl;
  final String receivedEventsUrl;
  final String type;
  final bool siteAdmin;
  final String name;
  final String company;
  final String blog;
  final String location;
  final String email;
  final bool hireable;
  final String bio;
  final String twitterUsername;
  final int publicRepos;
  final int publicGists;
  final int followers;
  final int following;
  final DateTime createdAt;
  final DateTime updatedAt;

  GithubUser({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
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
    required this.name,
    required this.company,
    required this.blog,
    required this.location,
    required this.email,
    required this.hireable,
    required this.bio,
    required this.twitterUsername,
    required this.publicRepos,
    required this.publicGists,
    required this.followers,
    required this.following,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'login': login,
      'id': id,
      'nodeId': nodeId,
      'avatarUrl': avatarUrl,
      'url': url,
      'htmlUrl': htmlUrl,
      'followersUrl': followersUrl,
      'followingUrl': followingUrl,
      'gistsUrl': gistsUrl,
      'starredUrl': starredUrl,
      'subscriptionsUrl': subscriptionsUrl,
      'organizationsUrl': organizationsUrl,
      'reposUrl': reposUrl,
      'eventsUrl': eventsUrl,
      'receivedEventsUrl': receivedEventsUrl,
      'type': type,
      'siteAdmin': siteAdmin,
      'name': name,
      'company': company,
      'blog': blog,
      'location': location,
      'email': email,
      'hireable': hireable,
      'bio': bio,
      'twitterUsername': twitterUsername,
      'publicRepos': publicRepos,
      'publicGists': publicGists,
      'followers': followers,
      'following': following,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory GithubUser.fromMap(Map<String, dynamic> map) {
    String? getStringValue(Map<String, dynamic> map, String key) {
      return map[key] as String?;
    }

    int? getIntValue(Map<String, dynamic> map, String key) {
      return map[key] as int?;
    }

    bool? getBoolValue(Map<String, dynamic> map, String key) {
      return map[key] as bool?;
    }

    DateTime? getDateTimeValue(Map<String, dynamic> map, String key) {
      int? milliseconds = map[key] as int?;
      return milliseconds != null
          ? DateTime.fromMillisecondsSinceEpoch(milliseconds)
          : null;
    }

    return GithubUser(
      login: getStringValue(map, 'login') ?? '',
      id: getIntValue(map, 'id') ?? 0,
      nodeId: getStringValue(map, 'node_id') ?? '',
      avatarUrl: getStringValue(map, 'avatar_url') ?? '',
      url: getStringValue(map, 'url') ?? '',
      htmlUrl: getStringValue(map, 'html_url') ?? '',
      followersUrl: getStringValue(map, 'followers_url') ?? '',
      followingUrl: getStringValue(map, 'following_url') ?? '',
      gistsUrl: getStringValue(map, 'gists_url') ?? '',
      starredUrl: getStringValue(map, 'starred_url') ?? '',
      subscriptionsUrl: getStringValue(map, 'subscriptions_url') ?? '',
      organizationsUrl: getStringValue(map, 'organizations_url') ?? '',
      reposUrl: getStringValue(map, 'repos_url') ?? '',
      eventsUrl: getStringValue(map, 'events_url') ?? '',
      receivedEventsUrl: getStringValue(map, 'received_events_url') ?? '',
      type: getStringValue(map, 'type') ?? '',
      siteAdmin: getBoolValue(map, 'site_admin') ?? false,
      name: getStringValue(map, 'name') ?? '',
      company: getStringValue(map, 'company') ?? '',
      blog: getStringValue(map, 'blog') ?? '',
      location: getStringValue(map, 'location') ?? '',
      email: getStringValue(map, 'email') ?? '',
      hireable: getBoolValue(map, 'hireable') ?? false,
      bio: getStringValue(map, 'bio') ?? '',
      twitterUsername: getStringValue(map, 'twitterUsername') ?? '',
      publicRepos: getIntValue(map, 'public_repos') ?? 0,
      publicGists: getIntValue(map, 'public_gists') ?? 0,
      followers: getIntValue(map, 'followers') ?? 0,
      following: getIntValue(map, 'following') ?? 0,
      createdAt: getDateTimeValue(map, 'createdAt') ?? DateTime(0),
      updatedAt: getDateTimeValue(map, 'updatedAt') ?? DateTime(0),
    );
  }

  String toJson() => json.encode(toMap());

  factory GithubUser.fromJson(String source) =>
      GithubUser.fromMap(json.decode(source) as Map<String, dynamic>);
}
