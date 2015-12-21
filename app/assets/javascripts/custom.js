function add_answer(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(".new_answer").append(content.replace(regexp, new_id));
}

function remove_answer(){
  $("#answer_field").on("click", ".remove-answer", function(){
    $(this).prev().val(1);
    $(this).parent().hide(100);
  });
}