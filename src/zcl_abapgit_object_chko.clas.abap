CLASS zcl_abapgit_object_chko DEFINITION
  PUBLIC
  INHERITING FROM zcl_abapgit_objects_super
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    INTERFACES zif_abapgit_object.
    ALIASES mo_files FOR zif_abapgit_object~mo_files.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_abapgit_object_chko IMPLEMENTATION.


  METHOD zif_abapgit_object~changed_by.

    DATA: ls_header      TYPE cl_chko_db_api=>ty_header,
          lo_chko_db_api TYPE REF TO cl_chko_db_api,
          lv_name        TYPE c LENGTH 30,
          lx_error       TYPE REF TO cx_root.

    IF ms_item-obj_type <> 'CHKO'.
      RETURN.
    ENDIF.

    TRY.
        CREATE OBJECT lo_chko_db_api.

        lv_name = ms_item-obj_name.

        ls_header = lo_chko_db_api->get_header(
          name    = lv_name
          version = 'I' ).
        IF ls_header IS INITIAL.
          ls_header = lo_chko_db_api->get_header(
            name    = lv_name
            version = 'A' ).
        ENDIF.

        rv_user = ls_header-changed_by.

      CATCH cx_root INTO lx_error.
        zcx_abapgit_exception=>raise_with_text( lx_error ).
    ENDTRY.

  ENDMETHOD.


  METHOD zif_abapgit_object~delete.

  ENDMETHOD.


  METHOD zif_abapgit_object~deserialize.

  ENDMETHOD.


  METHOD zif_abapgit_object~exists.

  ENDMETHOD.


  METHOD zif_abapgit_object~get_comparator.
    RETURN.
  ENDMETHOD.


  METHOD zif_abapgit_object~get_deserialize_steps.
    APPEND zif_abapgit_object=>gc_step_id-abap TO rt_steps.
  ENDMETHOD.


  METHOD zif_abapgit_object~get_metadata.
    rs_metadata = get_metadata( ).
  ENDMETHOD.


  METHOD zif_abapgit_object~is_active.
    rv_active = is_active( ).
  ENDMETHOD.


  METHOD zif_abapgit_object~is_locked.
  ENDMETHOD.


  METHOD zif_abapgit_object~jump.
  ENDMETHOD.


  METHOD zif_abapgit_object~serialize.
  ENDMETHOD.
ENDCLASS.