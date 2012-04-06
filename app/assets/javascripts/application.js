// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.tokeninput
$(function () {
  // Setup CSRF token for ajax requests
  $.ajaxSetup({
    headers: {
     'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') 
    },
    dataType: 'json'
  });
  
  // Setup the tokenInput
  $('#quote_tag_tokens').tokenInput('/tags.json', { 
    crossDomain: false,
    prePopulate: $('#quote_tags').data('pre'),
    theme: 'bootstrap',
    onResult: function(items) {
      items.push({
        id: -1, 
        name: "create..."
      });
      
      return items;
    },
    beforeAdd: function(item) {
      if (item.id === -1) {
        console.log($(this).val());
        
        // Create a new tag with name: $(this).val()
        $.ajax('/tags', {
          type: 'POST',
          success: function(data) {
            $("#quote_tags").tokenInput("add", {id: data.id, name: data.name});
          },
          error: function(jqXHR, textStatus, errorThrown){
            console.log("Error creating new tag from tokenInput");
          },
          data: {
            tag: {
              name: $(this).val()
            }
          }
        });
        
        return false;
      } else {
        return true;
      }
    }
  });
});