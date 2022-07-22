import 'package:flutter/material.dart';
import 'package:temporalobe/ui/box/services/component/search_app_bar_painter.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  const SearchAppBar({super.key, required this.onSearch});

  final ValueChanged<String> onSearch;

  @override
  State<StatefulWidget> createState() => _State();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _State extends State<SearchAppBar>
    with SingleTickerProviderStateMixin<SearchAppBar> {
  final _keySearchIcon = GlobalKey();
  final _textEditingController = TextEditingController();

  double? _rippleStartX;
  double? _rippleStartY;
  late Animation<double> _animation;
  late AnimationController _animationController;

  bool _isSearchMode = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: kThemeChangeDuration,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animationController.addStatusListener((status) {
      setState(() {
        _isSearchMode = status == AnimationStatus.completed;
      });
    });
    _textEditingController.addListener(() {
      widget.onSearch(_textEditingController.text);
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _startSearch() {
    final renderBox =
        _keySearchIcon.currentContext?.findRenderObject() as RenderBox?;

    if (renderBox == null) {
      return;
    }

    final size = renderBox.size;
    final position = renderBox.localToGlobal(Offset.zero);

    _rippleStartX = position.dx + size.width / 2;
    _rippleStartY = position.dy + size.height / 2;

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final statusBarHeight = mediaQuery.padding.top;
    final scheme = Theme.of(context).colorScheme;

    final animatedBuilder = AnimatedBuilder(
      animation: _animation,
      builder: (context, child) => ColoredBox(
        color: scheme.surface,
        child: SizedBox(
          height: kToolbarHeight + statusBarHeight,
          width: screenWidth,
          child: CustomPaint(
            painter: SearchAppBarPainter(
              containerHeight: kToolbarHeight,
              center: Offset(_rippleStartX ?? 0, _rippleStartY ?? 0),
              radius: _animation.value * screenWidth,
              context: context,
              color: scheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );

    final appBar = SafeArea(
      child: PreferredSize(
        preferredSize: widget.preferredSize,
        child: SizedBox(
          width: screenWidth,
          height: kToolbarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints.tightFor(
                  width: kMinInteractiveDimension,
                ),
                child: AnimatedOpacity(
                  opacity: _isSearchMode ? 1 : 0,
                  duration: kThemeChangeDuration,
                  child: IconButton(
                    onPressed: _isSearchMode
                        ? () {
                            _textEditingController.clear();
                            _animationController.reverse();
                          }
                        : null,
                    icon: Icon(
                      Icons.arrow_back,
                      color: scheme.surface,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: AnimatedCrossFade(
                  firstChild: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Filter by character',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: scheme.surfaceVariant),
                    ),
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: scheme.surface),
                  ),
                  secondChild: Center(
                    child: Text(
                      'Services',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: scheme.onSurfaceVariant),
                    ),
                  ),
                  duration: kThemeChangeDuration,
                  crossFadeState: _isSearchMode
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints.tightFor(
                  width: kMinInteractiveDimension,
                ),
                child: AnimatedCrossFade(
                  firstChild: IconButton(
                    onPressed: _textEditingController.clear,
                    icon: Icon(
                      Icons.clear,
                      color: scheme.surface,
                    ),
                  ),
                  secondChild: IconButton(
                    key: _keySearchIcon,
                    onPressed: _startSearch,
                    icon: Icon(
                      Icons.search,
                      color: scheme.onSurface,
                    ),
                  ),
                  duration: kThemeChangeDuration,
                  crossFadeState: _isSearchMode
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return WillPopScope(
      onWillPop: () async {
        if (_isSearchMode) {
          _textEditingController.clear();
          await _animationController.reverse();
          return false;
        } else {
          return true;
        }
      },
      child: Stack(
        children: [
          animatedBuilder,
          Material(
            type: MaterialType.transparency,
            child: appBar,
          )
        ],
      ),
    );
  }
}
