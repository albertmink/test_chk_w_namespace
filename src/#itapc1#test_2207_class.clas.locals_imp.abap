CLASS meta_data DEFINITION FINAL.
PUBLIC SECTION.
  INTERFACES if_ci_atc_check_meta_data.

ENDCLASS.

CLASS meta_data IMPLEMENTATION.

  METHOD if_ci_atc_check_meta_data~get_attributes ##NEEDED.
    attributes = VALUE #( ).
  ENDMETHOD.

  METHOD if_ci_atc_check_meta_data~get_checked_object_types.
    types = VALUE #( ( 'DDLS' ) ).
  ENDMETHOD.

  METHOD if_ci_atc_check_meta_data~get_description.
    description = 'Check CDS view object names against naming convention.'(des).
  ENDMETHOD.

  METHOD if_ci_atc_check_meta_data~get_finding_code_infos.
    finding_code_infos = VALUE #(
      ( code = 'ITAPC_NAME'
        severity = if_ci_atc_check=>finding_severities-error
        text = 'CDS view names must start with I or C'(mov)
      )
    ).
  ENDMETHOD.

  METHOD if_ci_atc_check_meta_data~uses_checksums.
    uses_checksums = abap_false.
  ENDMETHOD.

  METHOD if_ci_atc_check_meta_data~get_quickfix_code_infos.
    quickfix_code_infos = value #(
    ).
  ENDMETHOD.

  METHOD if_ci_atc_check_meta_data~is_remote_enabled.
    is_remote_enabled = abap_true.
  ENDMETHOD.

ENDCLASS.
