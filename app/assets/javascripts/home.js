$(function () {
  let largeImageUrl = $("#main-image-tag").attr("src");

  $("#shingle-names").change(function () {
    // Skipping color as new shingle may not have that color
    let shingleUid = $("#shingle-names").val();
    let zip = $("#zip").val();

    if(zip)
      window.location.replace("/shingles_by_zip/" + zip + "/" + shingleUid);
    else
      window.location.replace("/shingles/" + shingleUid);
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
    let zip = $("#zip").val();

    if(zip)
      window.location.replace("/shingles_by_zip/" + zip + "/" + shingleUid + "/" + colorUid);
    else
      window.location.replace("/shingles/" + shingleUid + "/" + colorUid);
  });
});
