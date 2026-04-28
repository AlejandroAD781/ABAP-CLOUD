CLASS zcl_tablas_aad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
       INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_tablas_aad IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TYPES: BEGIN OF ty_cliente,
          nombre TYPE ZDE_NOMBRE_AAD,
          id TYPE ZDE_ID_AAD,
          edad TYPE ZDE_EDAD_AAD,
          TELEFONO TYPE ZDE_TELEFONO_AAD,
          CORREO TYPE ZDE_CORREO_AAD,
          end of ty_cliente.

    DATA ls_cliente TYPE ty_cliente.
    DATA lt_cliente TYPE TABLE OF ty_cliente.

    ls_cliente-nombre = 'Alex'.
    ls_cliente-edad = 50.
    ls_cliente-id = '12345'.
    ls_cliente-telefono = '666666666'.
    ls_cliente-correo = '1@a.com'.

    INSERT ls_cliente into lt_cliente index 1.

    ls_cliente-nombre = 'Blue'.
    ls_cliente-edad = 60.
    ls_cliente-id = '54321'.
    ls_cliente-telefono = '777777777'.
    ls_cliente-correo = '1@a.com'.

    INSERT ls_cliente into table lt_cliente.

    INSERT VALUE #(
    nombre = 'Laura'
    edad = 7
    id = 8
    telefono = '66666777'
    correo = 'asfas')
    into table lt_cliente.

*    out->write( lt_cliente ).

*    data lt_cliente2 like lt_cliente.
*    INSERT LINES OF LT_CLIENTE INTO TABLE LT_CLIENTE2.
*
*    INSERT LINES OF lt_cliente to 1 into table lt_cliente2.
*    INSERT LINES OF lt_cliente from 2 to 3 INTO table LT_CLIENTE2.
*    out->write( lt_cliente2 ).

LOOP at lt_cliente into ls_cliente.
out->write( ls_cliente-nombre ).

ENDLOOP.

DATA lt_aeropuerto type table of /dmo/airport.

lt_aeropuerto = value #(
(
client = 100
airport_id = 'FRA'
name = 'dadasad'
city = 'adasda'
country = 'DE'
)
).
    out->write( lt_aeropuerto ).

  ENDMETHOD.

ENDCLASS.
