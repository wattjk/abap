CLASS zjw_atbash_driver DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.




  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZJW_ATBASH_DRIVER IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  data(lo_attie) = new zcl_atbash_cipher(  ).

"data(lv_result) = lo_attie->decode( cipher_text = 'gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt' ).
data(lv_result) = lo_attie->encode( plain_text = 'The quick brown fox jumps over the lazy dog.' ).

out->write( |Encoded string is : | && lv_result  ).






  ENDMETHOD.
ENDCLASS.
