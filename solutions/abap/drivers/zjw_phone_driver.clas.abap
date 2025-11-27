CLASS zjw_phone_driver DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.




  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zjw_phone_driver IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    DATA(lo_phone) = NEW zcl_phone_number( ).

constants lc_input type string value '12234567890'.
    TRY.
        DATA(lv_cleaned) = lo_phone->clean( number = lc_input ).
        out->write( |{ lv_cleaned } is the new phone number.| ).
      CATCH cx_parameter_invalid.
        out->write( 'Parameter exception' ).
    ENDTRY.



  ENDMETHOD.
ENDCLASS.
