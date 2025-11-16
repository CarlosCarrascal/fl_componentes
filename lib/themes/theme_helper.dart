import 'package:flutter/material.dart';
import 'profile_colors.dart';

class T {
  final bool d;
  const T(this.d);
  
  Color get bg => d ? C.db : C.lb;
  Color get c => d ? C.dc : C.lc;
  Color get b => d ? C.dd : C.ld;
  Color get s => d ? C.dc : C.ls;
  Color get t1 => d ? C.td1 : C.tl1;
  Color get t2 => d ? C.td2 : C.tl2;
  Color get pb => d ? C.pd : C.pl;
  
  List<Color> get g => d ? [C.dg1, C.dg2] : [C.lg1, C.lg2];
  
  BoxDecoration box({double r = 16, bool i = false}) => BoxDecoration(
    color: c,
    borderRadius: BorderRadius.circular(r),
    border: Border.all(color: b, width: 1.5),
    boxShadow: [BoxShadow(
      color: Colors.black.withValues(alpha: d ? (i ? 0.2 : 0.3) : (i ? 0.06 : 0.08)),
      blurRadius: i ? 8 : 12,
      offset: Offset(0, i ? 2 : 4),
    )],
  );
}
