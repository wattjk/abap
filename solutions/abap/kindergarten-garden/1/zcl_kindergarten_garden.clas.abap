CLASS zcl_kindergarten_garden DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS plants
      IMPORTING
        diagram        TYPE string
        student        TYPE string
      RETURNING
        VALUE(results) TYPE string_table.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA students TYPE string_table.

      METHODS create_new.

ENDCLASS.


CLASS zcl_kindergarten_garden IMPLEMENTATION.

  METHOD create_new.

    APPEND |Alice| TO students.
    APPEND |Bob| TO students.
    APPEND |Charlie| TO students.
    APPEND |David| TO students.
    APPEND |Eve| TO students.
    APPEND |Fred| TO students.
    APPEND |Ginny| TO students.
    APPEND |Harriet| TO students.
    APPEND |Ileana| TO students.
    APPEND |Joseph| TO students.
    APPEND |Kincaid| TO students.
    APPEND |Larry| TO students.

    SORT students ASCENDING.

  ENDMETHOD.

  METHOD plants.
    " add solution here
DATA: lv_index   TYPE i,
          lv_pos     TYPE i,
          lv_chars   TYPE string,
          lv_initial TYPE string.

    DATA  lt_results TYPE string_table.


    CONSTANTS: lc_grass  TYPE string VALUE 'Grass',
               lc_clover TYPE string VALUE 'Clover',
               lc_radish TYPE string VALUE 'Radishes',
               lc_violet TYPE string VALUE 'Violets'.

    DATA: lt_plant_table TYPE string_table.
    APPEND lc_grass TO lt_plant_table.
    APPEND lc_clover TO lt_plant_table.
    APPEND lc_radish TO lt_plant_table.
    APPEND lc_violet TO lt_plant_table.

    me->create_new( ).

    DATA: lt_diagram_list TYPE TABLE OF string,
          lv_diagram      TYPE string.

    SPLIT diagram AT `\n` INTO TABLE lt_diagram_list.

    READ TABLE students WITH KEY table_line = student TRANSPORTING NO FIELDS.
    IF sy-subrc = 0.
      lv_index = sy-tabix.
    ENDIF.

    lv_pos = lv_index - 1.
    lv_pos = lv_pos * 2.

    READ TABLE lt_diagram_list INDEX 1 INTO lv_diagram.
    IF sy-subrc = 0.
      lv_chars = lv_diagram+lv_pos(2).  "chars of first row of plants
    ENDIF.
    READ TABLE lt_diagram_list INDEX 2 INTO lv_diagram.
    IF sy-subrc = 0.
      DATA(lv_second) = lv_diagram+lv_pos(2).
    ENDIF.
    lv_chars = lv_chars && lv_second.

    DATA lv_counter TYPE i.
    CLEAR lv_counter.


    DO strlen( lv_chars ) TIMES.
      lv_initial = lv_chars+lv_counter(1).

      LOOP AT lt_plant_table INTO DATA(lv_plant).
        IF lv_plant+0(1) = lv_initial.
*                  IF lv_counter NE 0.
          TRANSLATE lv_plant TO LOWER CASE.
*                  ENDIF.
          APPEND lv_plant TO results.
          EXIT.
        ENDIF.
      ENDLOOP.

      lv_counter = lv_counter + 1.
    ENDDO.

*    results = lt_results.    
  ENDMETHOD.


ENDCLASS.
