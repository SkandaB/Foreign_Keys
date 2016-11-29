$( document ).ready(function() {

    //Remove html tags from the question on main page and question page
    $('.questions .row input').each(function(){
      $(this)[0].value = removeHTMLTags($(this)[0].value);
      $(this)[0].style.display = 'block';
    });

    //Remove html tags from the question table
    $('.question-table td input').each(function(){
      $(this)[0].value = removeHTMLTags($(this)[0].value);
      $(this)[0].style.display = 'inherit';
    });

    //Toggle text area for question and answer
    $('#toggle-answer-area').click(function(){
      $('.add-answer').toggle();
    });

    $('#toggle-question-area').click(function(){
      $('.add-question').toggle();
    });

    //Set tag filter dropdown value after select
    var filter_tag_id = $('#filter-tag-picker').data("id");
    $('#filter-tag-picker').selectpicker('val', filter_tag_id);

    //Show/hide comments
    $('#show-comments').click(function(){
      $('.comment').css('display', 'block');
      $('#hide-comments').css('display', 'block');
      $(this).css('display', 'none');
    });

    $('#hide-comments').click(function(){
      $('.comment').css('display', 'none');
      $('#show-comments').css('display', 'block');
      $(this).css('display', 'none');
    });

});
