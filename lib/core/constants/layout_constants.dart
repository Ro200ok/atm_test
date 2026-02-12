abstract final class LayoutConstants {
  LayoutConstants._();

  /// Factor of the height of the top background block (screenHeight / value).
  static const double atmHeaderHeightFactor = 5.86;

  /// Factor of the height of the input amount block.
  static const double atmAmountSectionHeightFactor = 3.2;

  /// Factor of the height of the grid block (withdraw / balance).
  static const double atmGridHeightFactor = 5.47;

  /// Factor of the height of the bottom background block.
  static const double atmBottomBarHeightFactor = 10.26;

  /// Vertical spacing between sections on the main screen.
  static const double atmPageSectionSpacing = 5.0;

  /// Height of the divider between sections.
  static const double atmPageDividerHeight = 10.0;

  /// Transparency of the divider color (0.0–1.0).
  static const double atmPageDividerAlpha = 0.78;

  /// Padding inside the grid container.
  static const double gridPadding = 15.0;

  /// Spacing between the title and the grid.
  static const double gridTitleBottomSpacing = 10.0;

  /// Number of columns in the grid of denominations.
  static const int gridCrossAxisCount = 2;

  /// Aspect ratio of the grid cell.
  static const double gridChildAspectRatio = 8.0;

  /// Horizontal spacing between cells.
  static const double gridCrossAxisSpacing = 10.0;

  /// Height of the row in the grid.
  static const double gridMainAxisExtent = 20.0;
}
