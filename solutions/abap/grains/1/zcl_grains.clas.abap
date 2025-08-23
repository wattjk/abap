CLASS zcl_grains DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES type_result TYPE p LENGTH 16 DECIMALS 0.
    METHODS square
      IMPORTING
        input         TYPE i
      RETURNING
        VALUE(result) TYPE type_result
      RAISING
        cx_parameter_invalid.
    METHODS total
      RETURNING
        VALUE(result) TYPE type_result
      RAISING
        cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_grains IMPLEMENTATION.
  METHOD square.
    " add solution here to provide the value in a square
    data lv_input type i.
    IF input LT 1 OR input GT 64.
        RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    lv_input = input - 1.

    result = 2 ** lv_input.
    
  ENDMETHOD.

  METHOD total.
    " add solution here to provide the total number of grains.

    result = 2 ** 64.
    
  ENDMETHOD.


ENDCLASS.
