CLASS zcl_rna_transcription DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS
      transcribe
        IMPORTING
          strand        TYPE string
        RETURNING
          VALUE(result) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rna_transcription IMPLEMENTATION.

  METHOD transcribe.
    "Implement solution
    DATA count TYPE i.
    CLEAR count.
    DO strlen( strand ) TIMES.

      DATA(cur_c) = strand+count(1).
      CASE cur_c.

        WHEN 'C'.
          result = result && |G|.

        WHEN 'G'.
          result = result && |C|.
        WHEN 'T'.
          result = result && |A|.
        WHEN 'A'.
          result = result && |U|.
        WHEN OTHERS.

      ENDCASE.
      count = count + 1.
    ENDDO.


  ENDMETHOD.

ENDCLASS.