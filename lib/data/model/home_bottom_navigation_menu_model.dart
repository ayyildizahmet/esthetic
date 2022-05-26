class HomeBottomNavigationMenuModel {
  final int id;
  final String imagePath;
  final String name;

  HomeBottomNavigationMenuModel({
    required this.id,
    required this.imagePath,
    required this.name,
  });
}

List<HomeBottomNavigationMenuModel> navBtn = [
  HomeBottomNavigationMenuModel(id: 0, imagePath: 'assets/icons/home.png', name: 'Home'),
  HomeBottomNavigationMenuModel(id: 1, imagePath: 'assets/icons/search.png', name: 'Search'),
  HomeBottomNavigationMenuModel(id: 2, imagePath: 'assets/icons/heart.png', name: 'Like'),
  HomeBottomNavigationMenuModel(id: 3, imagePath: 'assets/icons/notification.png', name: 'notification'),
  HomeBottomNavigationMenuModel(id: 4, imagePath: 'assets/icons/user.png', name: 'Profile'),
];
