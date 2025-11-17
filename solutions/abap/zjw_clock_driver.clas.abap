CLASS zjw_clock_driver DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.




  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zjw_clock_driver IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  data(lo_clock) = new zcl_clock( hours = 10
                                   ).

  data(lv_string) = lo_clock->get( ).


  out->write( lv_string ).

  lo_clock->add( 3 ).

  lv_string = lo_clock->get( ).
  out->write( lv_string ).

  lo_clock->sub( 30 ).

  lv_string = lo_clock->get( ).
  out->write( lv_string ).



  ENDMETHOD.



ENDCLASS.
