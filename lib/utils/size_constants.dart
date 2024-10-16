import 'package:flutter/material.dart';

double getWidth(context)=>MediaQuery.of(context).size.width;

double getHeight(context)=>MediaQuery.of(context).size.height;

double getPixelRatio(context)=>MediaQuery.of(context).devicePixelRatio;

double contentPadding=20;

BorderRadius largeBorderRadius=BorderRadius.circular(contentPadding);
BorderRadius smallBorderRadius=BorderRadius.circular(contentPadding/2);


List<BoxShadow> appBoxShadows(context,{Color? color})=>[
  BoxShadow(color:color??Theme.of(context).colorScheme.secondary.withOpacity(.125),
offset: const Offset(0,4),
blurRadius: 4
),

];