CLASS /itapc1/test_2207_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_ci_atc_check.

  PROTECTED SECTION.
  PRIVATE SECTION.
  DATA assistant_factory TYPE REF TO cl_ci_atc_assistant_factory.
ENDCLASS.



CLASS /ITAPC1/TEST_2207_CLASS IMPLEMENTATION.


METHOD if_ci_atc_check~get_meta_data.
    DATA lo_meta_data TYPE REF TO if_ci_atc_check_meta_data .
    meta_data = NEW meta_data( ).
  ENDMETHOD.


  METHOD if_ci_atc_check~run.

  "We are interested in CDS views
  IF object-type = 'DDLS'.
    " '/ITAPC1/' is 8 characters long
    " We are interested in the first letter after the namespace, i.e. the 9th position
    DATA(cds_view_prefix) = object-name+8(1).
    IF cds_view_prefix NE 'C' AND cds_view_prefix NE 'I'.

        INSERT VALUE #(
               code = 'ITAPC_NAME'
*               location = code_provider->get_statement_location( <statement> )
*               checksum = code_provider->get_statement_checksum( <statement> )
*               details = assistant_factory->create_finding_details( )
            ) INTO TABLE findings.

    ENDIF.
  ENDIF.

  ENDMETHOD.


  METHOD if_ci_atc_check~set_assistant_factory.
    assistant_factory = factory.
  ENDMETHOD.


  METHOD if_ci_atc_check~verify_prerequisites.

  ENDMETHOD.
ENDCLASS.
