CLASS zcl_anagram DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS anagram
      IMPORTING
        input         TYPE string
        candidates    TYPE string_table
      RETURNING
        VALUE(result) TYPE string_table.
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS sort_string
      IMPORTING
        init_string   TYPE string
      RETURNING
        VALUE(result) TYPE string.

ENDCLASS.



CLASS zcl_anagram IMPLEMENTATION.
  METHOD anagram.
* add solution here
    DATA: lv_input        TYPE string,
          lv_sorted_input TYPE string.

    lv_input = input.
    TRANSLATE lv_input TO LOWER CASE.
    lv_sorted_input = sort_string( init_string = lv_input ).


    LOOP AT candidates INTO DATA(candidate).
      data(lv_orig) = candidate.
      TRANSLATE candidate TO LOWER CASE.
      IF lv_input = candidate.
        CONTINUE.
      ENDIF.
      DATA(lv_sorted_cand) = sort_string( init_string = candidate ).
      IF lv_sorted_cand = lv_sorted_input.
        APPEND lv_orig TO result.
      ENDIF.

    ENDLOOP.


  ENDMETHOD.

  METHOD sort_string.


    DATA: lv_original_string TYPE string,
          lt_chars           TYPE STANDARD TABLE OF c, " Table to hold individual characters
          ls_char_line       TYPE c,
          lv_sorted_string   TYPE string,
          lv_index           TYPE i.


    lv_original_string = init_string.
* 1. Move each character into an internal table
    lv_index = 0.
    DO strlen( lv_original_string ) TIMES.
      ls_char_line = lv_original_string+lv_index(1).
      APPEND ls_char_line TO lt_chars.
      lv_index = lv_index + 1.
    ENDDO.

* 2. Sort the internal table (default ascending binary sort)
    SORT lt_chars ASCENDING. " Use 'AS TEXT' for locale-specific sorting

* 3. Concatenate the sorted characters back into a string
    LOOP AT lt_chars INTO ls_char_line.
      CONCATENATE lv_sorted_string ls_char_line INTO lv_sorted_string.
    ENDLOOP.

    result = lv_sorted_string.

  ENDMETHOD.

ENDCLASS.