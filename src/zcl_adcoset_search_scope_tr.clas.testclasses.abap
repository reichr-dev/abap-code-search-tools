*"* use this source file for your ABAP unit test classes
CLASS ltcl_limu_processor DEFINITION FINAL
  FOR TESTING RISK LEVEL HARMLESS DURATION SHORT.

  PRIVATE SECTION.
    CLASS-DATA mr_cut TYPE REF TO lcl_limu_processor.

    METHODS setup.
    METHODS test_handle_method FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltcl_limu_processor IMPLEMENTATION.
  METHOD setup.
    mr_cut = NEW #( VALUE #( count  = 1
                             object = VALUE #( ( name = 'CLS1' type = 'CLAS' ) ) ) ).
  ENDMETHOD.

  METHOD test_handle_method.
    mr_cut->handle_class_method( tr_object = VALUE #( obj_name = 'CLS1                          METH1'
                                                      obj_type = 'METH' ) ).
    cl_abap_unit_assert=>assert_table_contains(
        line  = VALUE zif_adcoset_ty_global=>ty_tadir_object( name       = 'CLS1'
                                                              type       = 'CLAS'
                                                              subobjects = VALUE #( ( name = 'METH1' type = 'METH' ) ) )
        table = mr_cut->result_extended-object ).
  ENDMETHOD.
ENDCLASS.
