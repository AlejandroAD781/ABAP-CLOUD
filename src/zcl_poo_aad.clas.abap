CLASS zcl_poo_aad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA nombre TYPE string.
    METHODS: ladrar RETURNING VALUE(rv_accion) TYPE string.
    METHODS: lanzar_pelota RETURNING VALUE(rv_accion) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_poo_aad IMPLEMENTATION.
    METHOD ladrar.
        rv_accion = |{ nombre } dice guau|.

    ENDMETHOD.

    METHOD lanzar_pelota.
        rv_accion = |{ nombre } pelota lanzada|.

    ENDMETHOD.


ENDCLASS.
