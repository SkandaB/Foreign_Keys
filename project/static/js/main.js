$( document ).ready(function() {

    //Remove html tags from the question on main page and question page
    $('.questions .row input').each(function(){
      $(this)[0].value = removeHTMLTags($(this)[0].value);
      $(this)[0].style.display = 'block';
    });

    $('#toggle-answer-area').click(function(){
      $('.add-answer').toggle();
    });

    $('#toggle-question-area').click(function(){
      $('.add-question').toggle();
    });
});
