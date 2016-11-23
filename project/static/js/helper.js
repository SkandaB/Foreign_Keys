function removeHTMLTags(str){
  return str.replace(/<(?:.|\n)*?>/gm, '');
}
