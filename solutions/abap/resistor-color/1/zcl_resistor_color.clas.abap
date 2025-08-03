CLASS zcl_resistor_color DEFINITION PUBLIC CREATE PUBLIC.
  PUBLIC SECTION.

  METHODS constructor.
    METHODS resistor_color
      IMPORTING
        color_code   TYPE string
      RETURNING
        VALUE(value) TYPE i.

  TYPES resistor_tab type standard table of string with empty key.


  PRIVATE SECTION.
    DATA colors_list TYPE resistor_tab.        
ENDCLASS.

CLASS zcl_resistor_color IMPLEMENTATION.

METHOD constructor.
DATA lt_colors TYPE resistor_tab.
    APPEND 'black' TO lt_colors.
    APPEND 'brown' TO lt_colors.
    APPEND 'red' TO lt_colors.
    APPEND 'orange' TO lt_colors.
    APPEND 'yellow' TO lt_colors.
    APPEND 'green' TO lt_colors.
    APPEND 'blue' TO lt_colors.
    APPEND 'violet' TO lt_colors.
    APPEND 'grey' TO lt_colors.
    APPEND 'white' TO lt_colors.
    me->colors_list = lt_colors.
ENDMETHOD.

  METHOD resistor_color.
* add solution here
    DATA lv_color TYPE string.
    lv_color = color_code.
    TRANSLATE lv_color TO LOWER CASE.
    READ TABLE colors_list WITH KEY table_line = lv_color transporting no fields.
    IF sy-subrc = 0.
     value = sy-tabix - 1.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
