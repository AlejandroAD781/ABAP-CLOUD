CLASS zcl_funprocesamiento_aad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
         interfaces if_oo_adt_classrun.
      PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FUNPROCESAMIENTO_AAD IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*  DATA lv_num TYPE i. "Declara una variable entera llamada lv_num
*
** DATA(lv_num) = strlen( 'daniel' ). "Guarda en lv_num la longitud del texto 'daniel' (6 caracteres)
*
*
*"COUNT
*DATA lv_var TYPE string VALUE 'experis experis'. "Declara un string con el valor 'experis experis'
*
*lv_num = count( val = lv_var sub = 'ex' ). "Cuenta cuántas veces aparece exactamente 'ex' dentro del string
*
*
*"COUNT ANY
*lv_num = count_any_of( val = lv_var sub = 'ex' ). "Cuenta cuántos caracteres del string son 'e' o 'x'
*
*lv_num = count_any_not_of( val = lv_var sub = 'ex' ). "Cuenta cuántos caracteres NO son 'e' ni 'x'
*
*
*"FIND
*lv_num = find( val = lv_var sub = 'is' ). "Devuelve la posición donde empieza la primera aparición de 'is'
*
*
*"FIND_ANY_OF
*lv_num = find_any_of( val = lv_var sub = 'is' ). "Devuelve la primera posición donde aparezca 'i' o 's'
*
*
*"FIND_ANY_NOT_OF
*lv_num = find_any_not_of( val = lv_var sub = 'is' ). "Devuelve la primera posición cuyo carácter NO sea 'i' ni 's'


""""
"FUNCIONES DE PROCESAMIENTO
""""

*DATA lv_var TYPE string VALUE 'Hola, este es el curso de ABAP'.
*
*"Convierte todo el texto a mayúsculas
*out->write( | mayusculas = { to_upper( lv_var ) } | ).
*
*"Convierte todo el texto a minúsculas
*out->write( | minusculas = { to_lower( lv_var ) } | ).
*
*"Invierte el orden de todos los caracteres del texto
*out->write( | reverse = { reverse( lv_var ) } | ).
*
*"Desplaza el texto 5 posiciones a la izquierda
*out->write( | shift_left = { shift_left( val = lv_var places = 5 ) } | ).
*
*"Desplaza el texto 5 posiciones a la derecha
*out->write( | shift_right = { shift_right( val = lv_var places = 5 ) } | ).
*
*"Obtiene una subcadena desde la posición 9 con longitud 6
*out->write( | substring = { substring( val = lv_var off = 9 len = 6 ) } | ).
*
*"Obtiene el texto desde la primera aparición de 'el'
*out->write( | substring_from = { substring_from( val = lv_var sub = 'el' ) } | ).
*
*"Obtiene el texto que aparece después de la primera aparición de 'el'
*out->write( | substring_after = { substring_after( val = lv_var sub = 'el' ) } | ).
*
*"Elimina espacios repetidos dejando solo uno entre palabras
*out->write( | condense = { condense( lv_var ) } | ).

"""
"FUNCIONES DE CONTENIDO
"""

data: lv_text type string,
      lv_pattern type string,
      lv_pattern2 type string.

      lv_text = 'the employees asdfasdfasa@sasdfasf.ass aad781@hotmail.es number is: 123-456-7850'.
      lv_pattern = '\d{3}-\d{3}-\d{4}'.
      lv_pattern2 = '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{ 2, }\b'.

      data(lv_num) = match(  val = lv_text pcre = lv_pattern occ = 1 ).

      data(lv_correo) = match(  val = lv_text pcre = lv_pattern2 ).

      if contains(  val = lv_text pcre = lv_pattern2 ).

      out->write( 'tiene una direccion de correo electronico' ).

      data(lv_count) = count( val = lv_text pcre = lv_pattern2 ).

      out->write( lv_count ).

      out->write( lv_correo ).

      else.

      out->write( ' no tiene direccion' ).

      endif.

  ENDMETHOD.
ENDCLASS.
