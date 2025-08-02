CLASS zcl_scrabble_score DEFINITION PUBLIC .

  PUBLIC SECTION.
    METHODS score
      IMPORTING
        input         TYPE string OPTIONAL
      RETURNING
        VALUE(result) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_scrabble_score IMPLEMENTATION.
  METHOD score.
    " add solution here

    TYPES: BEGIN OF score_type,
             letters TYPE string,
             value TYPE i,
           END OF score_type.
    TYPES scores TYPE STANDARD TABLE OF score_type.

    data: ls_score type score_type,
          lt_scores type scores.

    ls_score-letters = 'aeioulnrst'.
    ls_score-value = 1.
    append ls_score to lt_scores.
    ls_score-letters = 'dg'.
    ls_score-value = 2.
    append ls_score to lt_scores.
    ls_score-letters = 'bcmp'.
    ls_score-value = 3.
    append ls_score to lt_scores.
    ls_score-letters = 'fhvwy'.
    ls_score-value = 4.
    append ls_score to lt_scores.
    ls_score-letters = 'k'.
    ls_score-value = 5.
    append ls_score to lt_scores.
    ls_score-letters = 'jx'.
    ls_score-value = 8.
    append ls_score to lt_scores.
    ls_score-letters = 'qz'.
    ls_score-value = 10.
    append ls_score to lt_scores.

    data(lv_len) = STRLEN( input ).

    data: lv_count type i,
          lv_tot type i,
          lv_input type string.

    clear: lv_count, lv_tot.

    lv_input = input.

    translate lv_input to lower case.

    DO lv_len TIMES.

     data(lv_char) = lv_input+lv_count(1).

     LOOP AT lt_scores into ls_score.
       FIND lv_char IN ls_score-letters.
       IF sy-subrc = 0.
        lv_tot = lv_tot + ls_score-value.
        EXIT.
       ENDIF.
     ENDLOOP.
      lv_count = lv_count + 1.

    ENDDO.

    result = lv_tot.
    return.
    
  ENDMETHOD.

ENDCLASS.
