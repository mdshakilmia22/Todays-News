import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Repository/newConfig.dart';

final latestProvider=FutureProvider((ref) => NewsPaperClass().latestNews());
final detailsNewsProvider=FutureProvider.family((ref, newsid) => NewsPaperClass().detailsNews(newsid.toString()));
final categoryProvider= FutureProvider((ref) => NewsPaperClass().getcategory());
final categoryDetailsP=FutureProvider.family((ref, newsid) => NewsPaperClass().getCategoryNewsdetails(newsid.toString()));