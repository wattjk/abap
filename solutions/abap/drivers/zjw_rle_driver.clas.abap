CLASS zjw_rle_driver DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zjw_rle_driver IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    DATA(lo_rle) = NEW zcl_run_length_encoding(  ).

    DATA(lv_result) = lo_rle->decode( input = '12WB12W3B24WB' ).

    out->write( |Decoded string is : | && lv_result  ).

    lv_result = lo_rle->encode( input = '  hsqq qww  ' ).  "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB' ).

    out->write( |Encoded string is : | && lv_result  ).

  ENDMETHOD.
ENDCLASS.
