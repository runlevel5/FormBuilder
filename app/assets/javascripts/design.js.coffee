jQuery ->

  $('#update_page').submit ->
    # do something here


  # Navigation to page
  $('select#page_id').change ->
    if( $(this).find('option:selected').val() != '' )
      selected_page = $(this).find('option:selected').val()
      url = $('#page_' + selected_page).val()
      window.location.href = url


  # Toolbox draggable
  $('#toolbox').draggable(
    containment: 'body',
    scroll: false,
    zIndex: 888
  )


  # Canvas draggable
  $('#canvas').draggable()


  # Existing fields
  $('#canvas .drag').draggable(
    containment: '#canvas img',
    snap: true,
    stop: (evt, u2) ->
      new_coordinate = new coordinate( $(u2.helper) )
      $(u2.helper).find('input.pos_x').val(new_coordinate.left)
      $(u2.helper).find('input.pos_y').val(new_coordinate.top)
  ).resizable(
    containment: '#canvas img',
    stop: (evt, rs) ->
      size = rs.size
      $(this).find('input.value').css('width',  size.width  - 20)
      $(this).find('input.value').css('height', size.height - 1)

      $(this).find('input.width').val($(this).css('width').replace('px', ''))
      $(this).find('input.height').val($(this).css('height').replace('px', ''))
  ).dblclick ->
    # mark _destroy
    $(this).find('input.destroy').val(1)
    $(this).hide()



  # calculate the relative coordinate of the field to the canvas
  coordinate = (obj) ->
    object_pos = obj.offset()
    canvas_pos = obj.parent().offset()

    left = object_pos.left - canvas_pos.left
    top = object_pos.top - canvas_pos.top

    this.left = left
    this.top = top

  $('#toolbox .drag').draggable(
    appendTo: '#canvas',
    containment: '#canvas img',
    helper:'clone',
    stop: (event, ui) ->
      # clone the field and append to canvas
      clone = $(ui.helper).clone()
      clone.removeClass('drag').addClass('clone')
      $('#canvas').append(clone)

      # Set the field name so it could be submitted as POST params
      value_field = clone.find('input.value')
      pos_x_field = clone.find('input.pos_x')
      pos_y_field = clone.find('input.pos_y')
      width_field = clone.find('input.width')
      height_field = clone.find('input.height')

      # prepare fields for accepts_nested_attributes POST params
      value_field.attr('name', 'page[fields_attributes][][value]')
      pos_x_field.attr('name', 'page[fields_attributes][][pos_x]')
      pos_y_field.attr('name', 'page[fields_attributes][][pos_y]')
      width_field.attr('name', 'page[fields_attributes][][width]')
      height_field.attr('name', 'page[fields_attributes][][height]')

      c = new coordinate(clone)
      pos_x_field.val(c.left)
      pos_y_field.val(c.top)
      width_field.val(clone.css('width').replace('px', ''))
      height_field.val(clone.css('height').replace('px', ''))

      # make the clone field draggable and resizeable
      clone.draggable(
        containment: '#canvas img',
        snap: true,
        stop: (evt, u2) ->
          new_coordinate = new coordinate( $(u2.helper) )
          $(u2.helper).find('input.pos_x').val(new_coordinate.left)
          $(u2.helper).find('input.pos_y').val(new_coordinate.top)
      ).resizable(
        containment: '#canvas img',
        stop: (evt, rs) ->
          size = rs.size
          $(this).find('input.value').css('width',  size.width  - 20)
          $(this).find('input.value').css('height', size.height - 1)

          $(this).find('input.width').val($(this).css('width').replace('px', ''))
          $(this).find('input.height').val($(this).css('height').replace('px', ''))
      ).dblclick ->
        # got error in console, revisit later - TODO
        $(this).remove()
  )

