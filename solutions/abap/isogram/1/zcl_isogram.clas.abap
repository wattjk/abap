CLASS zcl_isogram DEFINITION PUBLIC.

  PUBLIC SECTION.
    METHODS is_isogram
      IMPORTING
        VALUE(phrase) TYPE string
      RETURNING
        VALUE(result) TYPE abap_bool.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_isogram IMPLEMENTATION.

  METHOD is_isogram.
    " add solution here
    DATA: count  TYPE i,
          cnt2   TYPE i,
          found_cnt type i,
          lv_times type i.
    CLEAR: count, result.

    data(lv_phrase) = phrase.
    TRANSLATE lv_phrase to LOWER CASE.
    IF lv_phrase = ''.
      result = abap_true.
      EXIT.
    ENDIF.
    lv_times = strlen( lv_phrase ).
    DATA(lv_c) = lv_phrase+count(1).
    DO lv_times TIMES.

      IF lv_c = '-' OR
         lv_c = space.
        CONTINUE.
      ENDIF.
      CLEAR cnt2.
      DO lv_times TIMES.
        DATA(lv_c2) = lv_phrase+cnt2(1).
        IF lv_c2 = lv_c.
          found_cnt += 1.
        ENDIF.
        cnt2 += 1.
      ENDDO.
      IF found_cnt > 1.
        EXIT.
      ENDIF.
      clear found_cnt.
      count += 1.
      IF count LT strlen( lv_phrase ).
        lv_c = lv_phrase+count(1).
      ELSE.
        EXIT.
      ENDIF.

    ENDDO.

    IF found_cnt > 1.
      result = abap_false.
    ELSE.
      result = abap_true.
    ENDIF.

  ENDMETHOD.

ENDCLASS.