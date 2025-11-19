CLASS zcl_nth_prime DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS prime
      IMPORTING
        input         TYPE i
      RETURNING
        VALUE(result) TYPE i
      RAISING
        cx_parameter_invalid.

    METHODS find_primes
      IMPORTING
        input         TYPE i
      RETURNING
        VALUE(result) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_nth_prime IMPLEMENTATION.

  METHOD find_primes.

    DATA counter TYPE i.
    DATA divisor TYPE i.
    DATA: lt_results TYPE string_table,
          prime_num  TYPE i,
          not_prime  TYPE abap_bool.


    APPEND 2 TO lt_results.
    counter = 3.
    DO.

      divisor = counter - 1.
      not_prime = abap_false.
      DO.
        IF divisor LE 1.
          EXIT.
        ENDIF.
        IF counter MOD divisor = 0.
          "not prime.
          not_prime = abap_true.
          EXIT.
        ELSE.

        ENDIF.
        divisor -= 1.
      ENDDO.
      IF not_prime = abap_false.
        APPEND counter TO lt_results.
        DATA(lv_row_count) = lines( lt_results ).
        IF lv_row_count GE input.
          EXIT.
        ENDIF.
      ENDIF.
      counter = counter + 1.
*      IF counter = 30.
*        EXIT.
*      ENDIF.
    ENDDO.

    result = counter.

  ENDMETHOD.

  METHOD prime.
    " add solution here
    IF input = 0.
      RAISE EXCEPTION NEW cx_parameter_invalid( ).
    ENDIF.

    IF input = 1.
      result = 2.
      EXIT.
    ENDIF.

   result = find_primes( input ).

  ENDMETHOD.

ENDCLASS.