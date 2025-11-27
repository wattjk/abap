CLASS zcl_phone_number DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS clean
      IMPORTING
        !number       TYPE string
      RETURNING
        VALUE(result) TYPE string
      RAISING
        cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_phone_number IMPLEMENTATION.

  METHOD clean.
    " add your code here


    "1. Check for illegal possibilities.

    DATA: lv_input TYPE string.

    lv_input = number.
    "2. First stage clean up
    "remove spaces.
    CONDENSE lv_input NO-GAPS.
    "remove dots
    REPLACE ALL OCCURRENCES OF '.' IN lv_input WITH ''.
    "remove left bracket
    REPLACE ALL OCCURRENCES OF '(' IN lv_input WITH ''.
    "remove right bracket
    REPLACE ALL OCCURRENCES OF ')' IN lv_input WITH ''.
    "remove dashes
    REPLACE ALL OCCURRENCES OF '-' IN lv_input WITH ''.

    "remove leading '+' if there is one
    DATA lv_len TYPE i.
    lv_len = strlen( lv_input ).

    "length should be at least 10 characters
    IF lv_len LT 10.
      RAISE EXCEPTION NEW cx_parameter_invalid( ).
    ENDIF.

    IF lv_input+0(1) EQ '+'.
    lv_len -= 1.
      lv_input = lv_input+1(lv_len).
    ENDIF.
    IF lv_input+0(1) EQ '1'.
      lv_len -= 1.
      lv_input = lv_input+1(lv_len).
    ENDIF.

    "new length should now be 10 characters
    lv_len = strlen( lv_input ).
    IF lv_len NE 10.
      RAISE EXCEPTION NEW cx_parameter_invalid( ).
    ENDIF.


    "3. If Legal, second stage clean up
    DATA lv_nums TYPE string VALUE '0123456789'.

    "area code value starts with 2 to 9.
    DATA lv_code TYPE string VALUE '23456789'.
    IF lv_code NS lv_input+0(1).
      RAISE EXCEPTION NEW cx_parameter_invalid( ).
    ENDIF.

    "exchange code starts with 2 to 9
    IF lv_code NS lv_input+3(1).
      RAISE EXCEPTION NEW cx_parameter_invalid( ).
    ENDIF.

    "check that it is only numbers
    IF lv_input CO lv_nums.
    ELSE.
      RAISE EXCEPTION NEW cx_parameter_invalid( ).
    ENDIF.

    result = lv_input.


  ENDMETHOD.
ENDCLASS.
