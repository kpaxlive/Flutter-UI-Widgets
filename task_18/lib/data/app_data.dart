class AppData {
  String name = '';
  String releaseDate = '';
  String appUrl = '';
  String imagePath = '';

  AppData(this.name, this.releaseDate,this.appUrl, this.imagePath);
}

List<AppData> appDatas = [
  AppData(
    'PDF Editor',
    '05.05.2021',
    'https://apps.apple.com/tr/app/pdf-converter-reader-editor/id1623317186',
    "assets/images/0.png",
  ),
  AppData(
    'Photo Editor',
     '07.05.2022',
     'https://apps.apple.com/vn/app/photo-collage-maker-ap%D1%80/id6445984133',
    'assets/images/1.png',
  ),
  AppData(
    'Smart Cleaner',
    '09.08.2022',
    'https://apps.apple.com/tr/app/smart-cleaner-free-up-space/id1576477935?l=tr',
    'assets/images/2.png',
  ),
  AppData(
    'Snore Tracker',
    '05.02.2023',
    'https://apps.apple.com/us/app/snore-sense/id6448513742',
    'assets/images/3.png',
  ),
  AppData(
    'Call Blocker',
    '14.04.2023',
    'https://apps.apple.com/tr/app/pdf-converter-reader-editor/id1623317186',
    'assets/images/4.png',
  ),
  AppData(
    'Movie Box',
    '10,07.2023',
    'https://apps.apple.com/tr/app/pdf-converter-reader-editor/id1623317186',
    'assets/images/5.png',
  )
];
