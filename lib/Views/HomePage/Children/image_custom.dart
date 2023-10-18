import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageCustom extends StatelessWidget {
  final Widget child;

  const ImageCustom({
    super.key,
    required this.child,
  });

  factory ImageCustom.network({
    Key? key,
    String url = "",
    BoxFit fit = BoxFit.cover,
    bool zoom = false,
    bool circle = false,
    bool enable = true,
    required Widget errorWidget,
    required Widget placeholder,
  }) {
    return ImageCustom(
      child: _ImageNetWorkCustom(
        key: key,
        url: url,
        placeholder: placeholder,
        errorWidget: errorWidget,
        fit: fit,
        zoom: zoom,
        circle: circle,
        enable: enable,
      ),
    );
  }

  factory ImageCustom.file({
    Key? key,
    bool circle = false,
    BoxFit fit = BoxFit.cover,
    bool zoom = false,
    required File file,
    required Widget errorWidget,
  }) {
    return ImageCustom(
      child: _ImageFileCustom(
          key: key,
          file: file,
          errorWidget: errorWidget,
          fit: fit,
          zoom: zoom,
          circle: circle),
    );
  }

  factory ImageCustom.circle({
    Key? key,
    required Widget child,
  }) {
    return ImageCustom(
      child: _ImageCircleCustom(key: key, child: child),
    );
  }

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class _ImageNetWorkCustom extends StatefulWidget {
  final String url;
  final BoxFit fit;
  final bool zoom;
  final bool circle;
  final bool enable;
  final Widget placeholder;
  final Widget errorWidget;

  const _ImageNetWorkCustom({
    super.key,
    required this.url,
    required this.placeholder,
    required this.errorWidget,
    required this.fit,
    required this.zoom,
    required this.circle,
    required this.enable,
  });

  @override
  State<_ImageNetWorkCustom> createState() => _ImageNetworkCustomState();
}

class _ImageNetworkCustomState extends State<_ImageNetWorkCustom> {
  final ValueNotifier<int> _networkHasErrorNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _networkHasErrorNotifier,
      builder: (BuildContext context, int value, Widget? child) {
        return CachedNetworkImage(
          key: widget.key,
          imageUrl: widget.url,
          fit: widget.fit,
          cacheKey: widget.url + _networkHasErrorNotifier.value.toString(),
          imageBuilder: (context, imageProvider) {
            return InteractiveViewer(
              minScale: 1,
              maxScale: 4.0,
              scaleEnabled: widget.zoom,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: widget.circle ? BoxShape.circle : BoxShape.rectangle,
                  image: DecorationImage(
                    image: imageProvider,
                    opacity: widget.enable ? 1 : 0.5,
                    fit: widget.zoom ? BoxFit.contain : BoxFit.cover,
                  ),
                ),
              ),
            );
          },
          placeholder: (context, url) => widget.placeholder,
          errorWidget: (context, url, error) {
            if (_networkHasErrorNotifier.value < 3) {
              Future.delayed(const Duration(milliseconds: 500), () {
                _networkHasErrorNotifier.value++;
              });
              return widget.placeholder;
            }
            return widget.errorWidget;
          },
        );
      },
    );
  }
}

class _ImageFileCustom extends StatefulWidget {
  final File file;
  final BoxFit fit;
  final bool zoom;
  final bool circle;

  const _ImageFileCustom({
    super.key,
    required this.file,
    required this.errorWidget,
    required this.fit,
    required this.zoom,
    required this.circle,
  });

  final Widget errorWidget;

  @override
  State<_ImageFileCustom> createState() => _ImageFileCustomState();
}

class _ImageFileCustomState extends State<_ImageFileCustom> {
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      clipBehavior: widget.circle ? Clip.hardEdge : Clip.none,
      child: InteractiveViewer(
        minScale: 1,
        maxScale: 4.0,
        scaleEnabled: widget.zoom,
        child: SizedBox.expand(
          child: Image.file(
            widget.file,
            errorBuilder: (_, __, ___) {
              return widget.errorWidget;
            },
            fit: widget.fit,
          ),
        ),
      ),
    );
  }
}

class _ImageCircleCustom extends StatefulWidget {
  final Widget child;

  const _ImageCircleCustom({
    super.key,
    required this.child,
  });

  @override
  State<_ImageCircleCustom> createState() => _ImageCircleCustomState();
}

class _ImageCircleCustomState extends State<_ImageCircleCustom> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      child: widget.child,
    );
  }
}
