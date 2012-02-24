$(document).ready(function(){

  function transferstylesback(){
    $(".property_container .styles").hide().appendTo(".clicked");
    $(".clicked").each(function(){
      $(this).removeClass("clicked");
    });
  }

  $(".assets").draggable({
    containment: '.rto_template',
    zIndex: 3
  });

  $(".drag").draggable({
    helper:'clone',
    zIndex: 3,
    stop:function(event,ui){
      clone = $(ui.helper).clone();
      clone.removeClass("drag").addClass("clone");

      $(".panel").append(clone);

      pos = $(ui.helper).offset();
      parent_pos = clone.parent().offset();

      /*position*/
      l = pos.left - parent_pos.left;      
      t = pos.top - parent_pos.top;
      clone.css({
        "left": l,
        "top": t
      });

      clone.draggable({
        containment: '.panel'
      }).resizable().click(function(event){
        transferstylesback();
        $(this).addClass("clicked");
        styles = $(this).find(".styles");
        styles.appendTo(".property_container").show().click(function(event){
          event.stopPropagation();
        });
        event.stopPropagation();
      });
    }
  });


  $('body').click(function() {
    transferstylesback();
  });


  function grid_values(str){
    res = str.split(',');
    return res;
  }

  $(".dynamic").draggable({
    helper:'clone',
    stop:function(event,ui){
      clone = $(ui.helper).clone();
      clone.removeClass("drag").addClass("clone");
      $(".panel").append(clone);

      pos = $(ui.helper).offset();
      parent_pos = clone.parent().offset();

      /*position*/
      l = pos.left - parent_pos.left;
      t = pos.top - parent_pos.top;

      clone.css({
        "left": l,
        "top": t
      });

      clone.draggable({
        containment: '.panel'
      }).resizable().click(function(event){
        transferstylesback();
        $(this).addClass("clicked");
        styles = $(this).find(".styles");
        styles.appendTo(".property_container").show().click(function(event){
          event.stopPropagation();
        });
        event.stopPropagation();
      });
      
      grid = clone.find("input[name='grid[]']").val();      
      clone.find(".dynamic_slide").slider({
        values: grid_values(grid)
      });
    }
  });

  $(document).keydown(function(e) {    
    if(e.which == 0 || e.which == 27 || e.which == 8 || e.which == 46){
      $(".clicked").remove();
      $(".property_container").html('');
    }
  });



  $("input[name=generate]").click(function(){
    transferstylesback()

    $(".panel .clone").each(function(){
      t = $(this).css("top");
      l = $(this).css("left");
      width = $(this).css("width");
      height = $(this).css("height");
      grid = new Array;

      $(this).find("input[name='pos_x[]']").val(parseInt(l));
      $(this).find("input[name='pos_y[]']").val(parseInt(t));
      $(this).find("input[name='width[]']").val(parseInt(width));
      $(this).find("input[name='height[]']").val(parseInt(height));

      $(this).find(".ui-slider-handle").each(function(){
        grid.push( Math.round(parseInt($(this).css("left")) / parseInt(width) * 100) );
      });

      $(this).find("input[name='grid[]']").val(grid.join(","));
    });

    $("input[name=page_id]").val($("select[name=template_page_id] option:selected").val());
    $("input[name=paper_size]").val($("select[name=template_paper_size] option:selected").val());
    if($("input[name=template_landscape]").is(":checked")){
      $("input[name=landscape]").val("1");
    }else{
      $("input[name=landscape]").val("0");
    }

    $.ajax({
      'type':'POST',
      'url': $(".panel_form").attr("action"),
      'cache':false,
      'data':$(".panel_form").serialize(),
      'success':function(data){
        $(".returned_file").html("<a href='/template/" + data + "' target='_blank'>" + data + '</a>');
        $(".returned_file").slideUp("fast");
        $(".returned_file").slideDown("slow");
      }
    });

  });

});