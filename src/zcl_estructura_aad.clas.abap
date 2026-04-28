CLASS zcl_estructura_aad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
     INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

"CREACION DE ESTRUCTURA"



CLASS zcl_estructura_aad IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

"tipo de estructura"
*
*    TYPES: BEGIN OF ty_cliente,
*           nombre TYPE zde_cliente_aad,
*           edad TYPE i,
*           telefono TYPE string,
*           correo TYPE string,
*    END OF ty_cliente.

*"crear estructura OPCION 1"
*
*    DATA ls_cliente TYPE ty_cliente.
*
*    out->write( ls_cliente ).
*
*    ls_cliente-nombre = 'Alejandro'.
*    ls_cliente-edad = 33.
*    ls_cliente-telefono ='666666666'.
*
*    out->write( ls_cliente ).
*
*"crear todo en una linea. OPCION 2"
*    DATA(ls_cliente2) = VALUE ty_cliente( nombre = 'aad' edad = '33' correo = 'asfasasfa' telefono = '68468478' ).
*    out->write( ls_cliente2 ).

* "OPCION 3"
*    DATA: BEGIN OF ls_cliente3,
*          nombre TYPE string VALUE 'laura',
*          id TYPE i,
*          edad TYPE i value 7,
*          end of LS_CLIENTE3.
*
*          ls_cliente3-id = 8.
*
*          out->write( ls_cliente3 ).


"EJERCICIO"
    DATA: BEGIN OF ls_ejercicio,
          nombre TYPE ZDE_NOMBRE_AAD VALUE 'ALEX',
          id TYPE ZDE_ID_AAD VALUE '12345',
          edad TYPE ZDE_EDAD_AAD value 75,
          TELEFONO TYPE ZDE_TELEFONO_AAD VALUE '654654645',
          CORREO TYPE ZDE_CORREO_AAD VALUE 'abadas@gmail.com',
          end of ls_ejercicio.


          out->write( ls_ejercicio ).



  ENDMETHOD.

ENDCLASS.
