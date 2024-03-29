class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String? webLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.webLink,
  });
}

//Projects
List<ProjectUtils> hobbyProjectUtils = [
  ProjectUtils(
    image: 'assets/projects/project1.png',
    title: 'Habit-tracking App',
    subtitle:
        'This is an iOS app for people who would like to track their habits.',
    webLink: 'https://github.com/carolineh-csuf/Habit-tracking',
  ),
  ProjectUtils(
    image: 'assets/projects/project2.png',
    title: 'Battleship App',
    subtitle: 'This is an iOS version of Battleship Game with an AI opponent.',
    webLink: 'https://github.com/carolineh-csuf/BattleShip_CarolineHa',
  ),
  ProjectUtils(
    image: 'assets/projects/project3.png',
    title: 'PhotoRama App',
    subtitle:
        'This is an iOS app for an filker-sychonized photo collection lover.',
    webLink: 'https://github.com/carolineh-csuf/Photorama',
  ),
  ProjectUtils(
    image: 'assets/projects/project4.png',
    title: 'Crossword Puzzle App',
    subtitle: 'This is an iOS game with autogenerated word puzzle themes.',
    webLink: 'https://github.com/carolineh-csuf/CrosswordPuzzle_Final',
  ),
];
