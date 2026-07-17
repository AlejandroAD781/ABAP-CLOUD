CLASS zcl_marisqueria_sanlucar_aad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_negocio_sanlucar.

    constants: tipo type string value 'MARISQUERIA'.

    DATA: nombre      TYPE string,
          descripcion TYPE string.

    METHODS constructor IMPORTING i_nombre      TYPE string
                                  i_descripcion TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_marisqueria_sanlucar_aad IMPLEMENTATION.

  METHOD constructor.

    nombre = i_nombre.
    descripcion = i_descripcion.

  ENDMETHOD.

  METHOD zif_negocio_sanlucar~calcular_precio.
    rv_precio = 25.
  ENDMETHOD.

  METHOD zif_negocio_sanlucar~get_descripcion.
    rv_descripcion = descripcion.
  ENDMETHOD.

  METHOD zif_negocio_sanlucar~get_nombre.
    rv_nombre = nombre.
  ENDMETHOD.

  METHOD zif_negocio_sanlucar~get_tipo.
    rv_tipo = tipo.
  ENDMETHOD.

ENDCLASS.
