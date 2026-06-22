CLASS zcl_poo_aad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA lv_nombre TYPE string.
    DATA lv_color TYPE string.
    METHODS: ladrar RETURNING VALUE(rv_accion) TYPE string,
     lanzar_pelota RETURNING VALUE(rv_accion) TYPE string,
     dormir RETURNING VALUE(rv_accion) TYPE string.



  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_poo_aad IMPLEMENTATION.


    METHOD ladrar.
        rv_accion = |{ lv_nombre } dice guau|.
    ENDMETHOD.
    METHOD lanzar_pelota.
        rv_accion = |{ lv_nombre } pelota lanzada|.
    ENDMETHOD.
  METHOD dormir.
       rv_accion = |{ lv_nombre } que es { lv_color } está  zzz|.
  ENDMETHOD.


ENDCLASS.
