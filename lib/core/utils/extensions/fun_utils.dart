String getSourceByPng(String nameImage,
    {String path = 'assets/png/', String ext = 'png'}) {
  return '$path$nameImage.$ext';
}

String getSourceByJpg(String nameImage,
    {String path = 'assets/jpg/', String ext = 'jpg'}) {
  return '$path$nameImage.$ext';
}

String getSourceBySvg(String nameImage,
    {String path = 'assets/svg/', String ext = 'svg'}) {
  return '$path$nameImage.$ext';
}
