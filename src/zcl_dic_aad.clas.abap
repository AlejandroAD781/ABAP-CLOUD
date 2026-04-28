CLASS zcl_dic_aad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_dic_aad IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

* ── Variables principales del ejercicio ──────────────────────────────
    DATA lv_nombre    TYPE string VALUE 'paco'.   " Variable que almacena el nombre
    DATA lv_operacion TYPE string VALUE '+'.      " Variable que almacena la operación


* ── Variables adicionales para la calculadora ────────────────────────
    DATA: lv_numero1   TYPE decfloat34 VALUE 10,  " Primer número a operar
          lv_numero2   TYPE decfloat34 VALUE 5,   " Segundo número a operar
          lv_resultado TYPE decfloat34.           " Variable que guarda el resultado

* ── Lógica principal ─────────────────────────────────────────────────
* 1. Comprobamos que el usuario sea "paco"
    IF lv_nombre = 'paco'.



*2. Ejecutamos la operación según lo que haya en lv_operacion
      CASE lv_operacion.
        WHEN '+'.
          lv_resultado = lv_numero1 + lv_numero2.
        WHEN '-'.
          lv_resultado = lv_numero1 - lv_numero2.
        WHEN '*'.
          lv_resultado = lv_numero1 * lv_numero2.
        WHEN '/'.
          IF lv_numero2 <> 0.
            lv_resultado = lv_numero1 / lv_numero2.
          ELSE.
            out->write( 'Error: División entre cero no permitida.' ).
            RETURN.
          ENDIF.
        WHEN OTHERS.
          out->write( 'Error: Operación no reconocida. Usa +, -, * o /' ).
          RETURN.
      ENDCASE.

*3. Mostramos el resultado
      out->write( |Resultado:  { lv_numero1 } { lv_operacion }  { lv_numero2 }  = { lv_resultado } | ).
     ELSE.

*4. Si el usuario no es "paco", acceso denegado
      out->write(  'Acceso denegado. Solo el usuario "paco" puede usar esta calculadora.' ).
     ENDIF.
     ENDMETHOD.

ENDCLASS.

