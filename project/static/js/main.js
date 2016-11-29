$( document ).ready(function() {

    //Remove html tags from the question on main page and question page
    $('.questions .row input').each(function(){
      $(this)[0].value = removeHTMLTags($(this)[0].value);
      $(this)[0].style.display = 'block';
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

    //Set sort filter value
    // var $radios = $('input:radio[name=sort_type]');
    // if($radios.is(':checked') === false) {
    //     $radios.filter('[value=Male]').prop('checked', true);
    // }

});