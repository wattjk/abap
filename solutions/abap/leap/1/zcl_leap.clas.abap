CLASS zcl_leap DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS leap
      IMPORTING
        year          TYPE i
      RETURNING
        VALUE(result) TYPE abap_bool.
ENDCLASS.

CLASS zcl_leap IMPLEMENTATION.

  METHOD leap.
* add solution here
    DATA(lv_result) = abap_false.

    IF year MOD 100 = 0.
      IF year MOD 400 = 0.
        lv_result = abap_true.
      ENDIF.
      result = lv_result.
      RETURN.
    ENDIF.

    IF year MOD 4 = 0.
      lv_result = abap_true.
    ENDIF.

    result = lv_result.

  ENDMETHOD.

ENDCLASS.
