CLASS zjw_kg_driver DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.




  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZJW_KG_DRIVER IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  data(lo_kg) = new zcl_kindergarten_garden(  ).

  data(lt_results) = lo_kg->plants( diagram = 'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV'
                                    student  = 'Larry' ).

    DATA lv_string  TYPE string.

    LOOP AT lt_results INTO DATA(lv_result).

      IF sy-tabix = 1.
        lv_string = lv_result.
      ELSE.
        CONCATENATE lv_string lv_result INTO lv_string SEPARATED BY ', '.
      ENDIF.

    ENDLOOP.

  out->write( lv_string ).

  ENDMETHOD.
ENDCLASS.
