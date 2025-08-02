CLASS zcl_high_scores DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES integertab TYPE STANDARD TABLE OF i WITH EMPTY KEY.
    METHODS constructor
      IMPORTING
        scores TYPE integertab.

    METHODS list_scores
      RETURNING
        VALUE(result) TYPE integertab.

    METHODS latest
      RETURNING
        VALUE(result) TYPE i.

    METHODS personalbest
      RETURNING
        VALUE(result) TYPE i.

    METHODS personaltopthree
      RETURNING
        VALUE(result) TYPE integertab.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA scores_list TYPE integertab.

ENDCLASS.


CLASS zcl_high_scores IMPLEMENTATION.

  METHOD constructor.
    me->scores_list = scores.
  ENDMETHOD.

  METHOD list_scores.
    " add solution here
    result = scores_list.
  ENDMETHOD.

  METHOD latest.
    " add solution here
    data(lv_rows) = lines( scores_list ).
    READ TABLE scores_list INTO DATA(lv_latest) INDEX lv_rows.
    IF sy-subrc = 0.
      result = lv_latest.
    ENDIF.
  ENDMETHOD.

  METHOD personalbest.
    " add solution here
    CLEAR result.
    SORT scores_list BY table_line DESCENDING.
    READ TABLE scores_list INTO DATA(lv_highest) INDEX 1.
    IF sy-subrc = 0.
      result = lv_highest.
    ENDIF.


  ENDMETHOD.

  METHOD personaltopthree.
    " add solution here
    CLEAR result.
    SORT scores_list BY table_line DESCENDING.
    DO 3 TIMES.
      READ TABLE scores_list INTO DATA(lv_highest) INDEX sy-index.
      IF sy-subrc = 0.
        APPEND lv_highest TO result.
      ENDIF.
    ENDDO.

  ENDMETHOD.



ENDCLASS.
