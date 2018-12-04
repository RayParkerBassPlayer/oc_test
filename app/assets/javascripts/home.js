$(function () {
  let largeImageUrl = $("#main-image-tag").attr("src");

  $("#shingle-names").change(function () {
    window.location.replace("/shingles/" + $("#shingle-names").val());
  });

  $(function () {
    $(".color-swatch").hover(function () {
          $("#main-image-tag").attr("src", $(this).data("largeImageUrl"));
        }, function () {
          $("#main-image-tag").attr("src", largeImageUrl);
        }
    )
  });

  $(".color-swatch").click(function(){
    let shingleUid = $("#shingle-names").val();
    let colorUid = $(this).children("img").data("colorId");
    window.location.replace("/shingles/" + shingleUid + "/" + colorUid);
  });
});
