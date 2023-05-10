function myfunction() {
  let a;
  if (
    (navigator.userAgent.match(/Android/i) && screen.width < 513) ||
    navigator.userAgent.match(/webOS/i) ||
    navigator.userAgent.match(/iPhone/i) ||
    navigator.userAgent.match(/iPod/i) ||
    navigator.userAgent.match(/BlackBerry/i) ||
    (navigator.userAgent.match(/Windows Phone/i) && screen.width < 513)
  ) {
    a = true;
    const home = document.getElementById("home");
    home.remove();

    document.getElementById("head").remove();
  } else {
    a = false;
  }
  //alert(a);
  return a;
}
