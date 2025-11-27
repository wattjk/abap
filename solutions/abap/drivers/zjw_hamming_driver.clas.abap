CLASS zjw_hamming_driver DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.




  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zjw_hamming_driver IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  data(lo_ham) = new zcl_hamming(  ).

try.
data(lv_result) = lo_ham->hamming_distance( first_strand = ''
                                            second_strand = 'CGT' ).
out->write( |Number of differences: | && lv_result  ).

catch cx_parameter_invalid.
   out->write( 'Invalid input parameters' ).
endtry.



  ENDMETHOD.



ENDCLASS.
