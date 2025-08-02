CLASS zcl_reverse_string DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS reverse_string
      IMPORTING
        input         TYPE string
      RETURNING
        VALUE(result) TYPE string.
ENDCLASS.

CLASS zcl_reverse_string IMPLEMENTATION.

  METHOD reverse_string.
    " " Please complete the implementation of the reverse_string method

    data(lv_string) = input.

    result = reverse(  lv_string ).

  ENDMETHOD.

ENDCLASS.
