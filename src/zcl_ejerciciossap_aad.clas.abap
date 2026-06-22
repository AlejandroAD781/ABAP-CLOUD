
CLASS zcl_ejerciciossap_aad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_ejerciciossap_aad IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*    DATA connection TYPE REF TO lcl_connection.
*    DATA connections TYPE TABLE OF REF TO lcl_connection.
*
** First Instance
***********************************************************************
*    connection = NEW #(  ).
*    connection->carrier_id    = 'LH'.
*    connection->connection_id = '0400'.
*    APPEND connection TO connections.
*
** Second Instance
***********************************************************************
*    connection->carrier_id    = 'AA'.
*    connection->connection_id = '0017'.
*    APPEND connection TO connections.
*
** Third Instance
***********************************************************************
*    connection->carrier_id    = 'SQ'.
*    connection->connection_id = '0001'.
*    APPEND connection TO connections.
*
*    out->write( connections ).

*    INSERT zej2aad FROM TABLE @( VALUE #(
*      ( id = '001' nombre = 'Alejandro' apellido = 'Garcia'
*        direccion = 'Pez 8, 3B, Granada'
*        correo = 'alejandro@correo.es'
*        telefono = '666777888' )
*
*      ( id = '002' nombre = 'Maria' apellido = 'Lopez'
*        direccion = 'Mayor 12, Madrid'
*        correo = 'maria@correo.es'
*        telefono = '611223344' )
*
*      ( id = '003' nombre = 'Javier' apellido = 'Martinez'
*        direccion = 'Sol 5, Sevilla'
*        correo = 'javier@correo.es'
*        telefono = '622334455' )
*
*      ( id = '004' nombre = 'Laura' apellido = 'Fernandez'
*        direccion = 'Luna 18, Valencia'
*        correo = 'laura@correo.es'
*        telefono = '633445566' )
*
*      ( id = '005' nombre = 'Carlos' apellido = 'Ruiz'
*        direccion = 'Rio 22, Malaga'
*        correo = 'carlos@correo.es'
*        telefono = '644556677' )
*
*      ( id = '006' nombre = 'Ana' apellido = 'Sanchez'
*        direccion = 'Olmo 7, Zaragoza'
*        correo = 'ana@correo.es'
*        telefono = '655667788' )
*
*      ( id = '007' nombre = 'Gustavo' apellido = 'Diaz'
*        direccion = 'Bosque 14, Bilbao'
*        correo = 'pablo@correo.es'
*        telefono = '677889900' )
*    ) ).

    DATA ls_new_registro TYPE zej2aad.
    ls_new_registro = VALUE #( id = 8 nombre = '1' apellido = 'gonzalez ramirez' direccion = 'C/mirador de la nava' correo = 'luis@gmail.com' telefono = '666666666' ).
    WAIT UP TO 20 SECONDS.
    MODIFY zej2aad FROM @ls_new_registro.


  ENDMETHOD.
ENDCLASS.
