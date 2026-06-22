CLASS zcl_select_aad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_select_aad IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


*    SELECT from /dmo/airport
*      FIELDS *
*      "where airport_id = 'DE'
*      into table @data(lt_aeropuerto).


 " READ TABLE lt_aeropuerto into data(ls_vuelo) INDEX 1 .
 " data(ls_vuelo) = lt_aeropuerto[ 2 ]. " forma moderna de hacer el read table.

"DATa(ls_vuelo) = lt_aeropuerto[ airport_id = 'MUC' ].

 "   data(lv_index) = sy-tabix.

 "out->write( lv_index ).


"tipo tabla sorted
*data lt_tabla_sort type SORTED TABLE OF /dmo/airport WITH NON-UNIQUE key airport_id.
*
*
*SELECT from /dmo/airport
*    FIELDS *
*    WHERE country = 'DE'
*    into table @lt_tabla_sort.
*
*
**Read table lt_tabla_sort WITH KEY airport_id = 'BOS' TRANSPORTING NO FIELDS.   " indica el index o linea en el que se encuentra el registro filtrado
**data(lv_index) = sy-tabix.
*
*data(lv_total) = lines( lt_tabla_sort ). " indica el total de lineas que tiene una tabla interna
*
*
*if sy-subrc = 0.
*    out->write( 'el vuelo  existe en la bd ' ).
*out->write( lv_total ).
*else.
*    out->write( 'el vuelo no existe en la bd ' ).
*
*
*ENDIF.



" 1. Seleccionamos solo los registros mayores de 18
SELECT FROM zbd_empleado_der
    FIELDS *
    WHERE edad > 18
    INTO TABLE @DATA(lt_empleados).



" 2. Modificamos en memoria


LOOP AT lt_empleados INTO data(ls_empleado).


    DATA(lv_longitud) = strlen( ls_empleado-nombre ).

    out->write( lv_longitud ).

    IF lv_longitud > 0.
        " Cogemos del carácter 0 hasta el penúltimo, y añadimos 'S'
        ls_empleado-nombre = substring( val = ls_empleado-nombre    " la cadena de caracteres que se examina
                                        off = 0  " la posicion de inicio desde donde se quiere extraer la subcadena.
                                        len = lv_longitud - 1 ) && 's'. " con la longitud calculada le decimos el punto exacto donde hacer la modificacion

    ENDIF.

    MODIFY lt_empleados FROM ls_empleado.

ENDLOOP.

" 3. Guardamos los cambios en la base de datos
MODIFY zbd_empleado_der FROM TABLE @lt_empleados. "MEJOR HACER LA MODIFICACION DE BBDD FUERA DEL LOOP PARA NO SATURARLA.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ELIMINAR CONTENIDO TABLA
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*DELETE lt_empleados FROM 2 to 4.
*DELETE lt_empleados INDEX 2.
*DELETE lt_empleados WHERE nombre IS INITIAL.
*DELETE ADJACENT DUPLICATES FROM lt_empleados COMAPRING nombre. "eliminar campos duplicados con el mismo nombre.










  ENDMETHOD.
ENDCLASS.
