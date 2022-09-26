class UserDetailsEntity {
  final String name;
  final int id;
  final String nodeId;
  final String htmlUrl;
  final String avatarUrl;
  final int followers;
  final int following;
  final String bio;
  final DateTime createdAt;
  final int publicRepos;
  final String page;
  UserDetailsEntity({
    required this.name,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.htmlUrl,
    required this.followers,
    required this.following,
    required this.bio,
    required this.createdAt,
    required this.publicRepos,
    required this.page,
  });
}
