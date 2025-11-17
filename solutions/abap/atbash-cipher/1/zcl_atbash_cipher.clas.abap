CLASS zcl_atbash_cipher DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS decode
      IMPORTING
        cipher_text       TYPE string
      RETURNING
        VALUE(plain_text) TYPE string .
    METHODS encode
      IMPORTING
        plain_text         TYPE string
      RETURNING
        VALUE(cipher_text) TYPE string .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_ATBASH_CIPHER IMPLEMENTATION.


  METHOD decode.
* todo
    DATA(lv_cipher) = 'zyxwvutsrqponmlkjihgfedcba'.
    DATA(lv_plain)  = 'abcdefghijklmnopqrstuvwxyz'.
    DATA(lv_numbers) = '1234567890'.

data: lv_cipher_text type string,
      index type i,
      lv_code type string.

  lv_cipher_text = cipher_text.
  CONDENSE lv_cipher_text NO-GAPS.
  TRANSLATE lv_cipher_text TO LOWER CASE.
  clear: index, plain_text.

  DO strlen( lv_cipher_text  ) TIMES.

      DATA(lv_char) = lv_cipher_text+index(1).
      FIND FIRST OCCURRENCE OF lv_char IN lv_cipher MATCH OFFSET DATA(lv_offset).
      IF sy-subrc NE 0.
        IF lv_numbers CS lv_char.
          lv_code = lv_char.
        ELSE.
          CLEAR lv_code.
        ENDIF.
      ELSE.
        lv_code = lv_plain+lv_offset(1).
      ENDIF.

      plain_text = plain_text && lv_code.

      index = index + 1.

    ENDDO.


  ENDMETHOD.


  METHOD encode.
* todo

    DATA(lv_cipher) = 'zyxwvutsrqponmlkjihgfedcba'.
    DATA(lv_plain)  = 'abcdefghijklmnopqrstuvwxyz'.
    DATA(lv_numbers) = '1234567890'.

    DATA: index          TYPE i,
          lv_cipher_text TYPE string,
          lv_plain_text  TYPE string,
          lv_code        TYPE string.

    CLEAR: index.
    lv_plain_text = plain_text.

    CONDENSE lv_plain_text NO-GAPS.
    TRANSLATE lv_plain_text TO LOWER CASE.

    DO strlen( lv_plain_text  ) TIMES.

      DATA(lv_char) = lv_plain_text+index(1).
      FIND FIRST OCCURRENCE OF lv_char IN lv_plain MATCH OFFSET DATA(lv_offset).
      IF sy-subrc NE 0.
        IF lv_numbers CS lv_char.
          lv_code = lv_char.
        ELSE.
          CLEAR lv_code.
        ENDIF.
      ELSE.
        lv_code = lv_cipher+lv_offset(1).
      ENDIF.

      lv_cipher_text = lv_cipher_text && lv_code.

      index = index + 1.

    ENDDO.

    clear: index, lv_code.
    DO strlen( lv_cipher_text  ) TIMES.
        lv_code = lv_cipher_text+index(1).
        IF ( ( index + 1 ) MOD 5 = 0  AND ( index + 1 )  NE strlen( lv_cipher_text ) ).
          lv_code = lv_code && | |.
        ENDIF.
        cipher_text = cipher_text && lv_code.
      index = index + 1.
    ENDDO.

  ENDMETHOD.
ENDCLASS.