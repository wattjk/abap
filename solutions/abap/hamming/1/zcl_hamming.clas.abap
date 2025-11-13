CLASS zcl_hamming DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS hamming_distance
      IMPORTING
        first_strand  TYPE string
        second_strand TYPE string
      RETURNING
        VALUE(result) TYPE i
      RAISING
        cx_parameter_invalid.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS zcl_hamming IMPLEMENTATION.

  METHOD hamming_distance.
    " add solution here

 IF ( strlen( first_strand ) NE strlen( second_strand ) ).

    RAISE EXCEPTION  NEW cx_parameter_invalid( ).

 ENDIF.


 DATA: count TYPE i,
       index type i.
    CLEAR: count, index.
    DO strlen( first_strand ) TIMES.

      DATA(cur_1) = first_strand+index(1).
      DATA(cur_2) = second_strand+index(1).

      IF ( cur_1 NE cur_2 ).
       count = count + 1.
      ENDIF.
      index = index + 1.
    ENDDO.


    result = count.
    


  ENDMETHOD.


ENDCLASS.