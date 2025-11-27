CLASS zjw_driver DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.




  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZJW_DRIVER IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  data(lo_hello) = new zjw_hello_world(  ).

  data(lv_greet) = lo_hello->hello( iv_text = | With extra text.| ).

  out->write( lv_greet ).

  ENDMETHOD.
ENDCLASS.
