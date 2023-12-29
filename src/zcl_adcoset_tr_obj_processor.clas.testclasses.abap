*"* use this source file for your ABAP unit test classes
CLASS ltcl_limu_processor DEFINITION FINAL
  FOR TESTING RISK LEVEL HARMLESS DURATION SHORT.

  PRIVATE SECTION.
    CLASS-DATA cut TYPE REF TO zcl_adcoset_tr_obj_processor.

    METHODS setup.
    METHODS test_handle_method FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltcl_limu_processor IMPLEMENTATION.
  METHOD setup.
    cut = NEW #( tr_objects    = VALUE #( ( obj_name = 'CLS1' obj_type = 'CLAS' )
                                          ( obj_name = 'CLS1                          METH1'  obj_type = 'METH' ) )
                 search_ranges = VALUE #( ) ).
  ENDMETHOD.

  METHOD test_handle_method.
*    cut->handle_class_method( tr_object = VALUE #( obj_name = 'CLS1                          METH1'
*                                                      obj_type = 'METH' ) ).
*    cl_abap_unit_assert=>assert_table_contains(
*        line  = VALUE  ty_tadir_object_extended( name       = 'CLS1'
*                                                 type       = 'CLAS'
*                                                 subobjects = VALUE #( ( name = 'METH1' type = 'METH' ) ) )
*        table = mr_cut->objects ).
  ENDMETHOD.
ENDCLASS.