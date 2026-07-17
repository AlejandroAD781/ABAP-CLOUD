CLASS zcl_hipodromo_sanlucar DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces zif_negocio_sanlucar.
    constants: tipo type string value 'hipodromo'.

    DATA: nombre      TYPE string,
          descripcion TYPE string.

    METHODS constructor IMPORTING i_nombre      TYPE string
                                  i_descripcion TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_hipodromo_sanlucar IMPLEMENTATION.

  METHOD constructor.

    nombre = i_nombre.
    descripcion = i_descripcion.

  ENDMETHOD.

  METHOD zif_negocio_sanlucar~calcular_precio.
    rv_precio = 5.
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
