import 'package:flutter/material.dart';
import 'package:delivery_app/common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import 'package:delivery_app/utils/helpers/helper_functions.dart';

class TCurvedEdgeWidget extends StatelessWidget {
  const TCurvedEdgeWidget({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCustomCurvedEdges(),
      child: child,
    );
  }
}
