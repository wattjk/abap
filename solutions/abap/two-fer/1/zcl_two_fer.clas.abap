CLASS zcl_two_fer DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS two_fer
      IMPORTING
        input         TYPE string OPTIONAL
      RETURNING
        VALUE(result) TYPE string.
ENDCLASS.

CLASS zcl_two_fer IMPLEMENTATION.

  METHOD two_fer.
* add solution here
    data(lv_string) = input.
    IF input is INITIAL.
        lv_string = 'you'.
    ENDIF.

    result = |One for | & |{ lv_string }| & |, one for me.|.

  ENDMETHOD.

ENDCLASS.
