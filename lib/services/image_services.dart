enum AssetsIcons {
  colorPalatte("color_palette.png"),
  copy("copy.png"),
  edit("edit.png"),
  leftArrow("left_arrow.png"),
  rightArrow("right_arrow.png"),
  share("share.png"),
  footsteps("footsteps.png"),
  selected("selected.png");

  final String name;
  const AssetsIcons(this.name);
  String path() => "icons/$name";
  String fullPath() => "assets/${path()}";
}
