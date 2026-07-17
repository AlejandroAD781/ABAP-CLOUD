CLASS zcl_calculadora_aad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS:
      sumar IMPORTING num1          TYPE zdecimal2_25
                      num2          TYPE zdecimal2_25
            RETURNING VALUE(result) TYPE zdecimal2_25,

      restar IMPORTING num1          TYPE zdecimal2_25
                       num2          TYPE zdecimal2_25
             RETURNING VALUE(result) TYPE zdecimal2_25,

      multiplicar IMPORTING num1          TYPE zdecimal2_25
                            num2          TYPE zdecimal2_25
                  RETURNING VALUE(result) TYPE zdecimal2_25,

      dividir IMPORTING num1          TYPE zdecimal2_25
                        num2          TYPE zdecimal2_25
              RETURNING VALUE(result) TYPE zdecimal2_25
              raising cx_sy_zerodivide zcx_resultado_novalido_aad.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_calculadora_aad IMPLEMENTATION.

  METHOD sumar.

    result = num1 + num2.

  ENDMETHOD.

  METHOD restar.

    result = num1 - num2.

  ENDMETHOD.

  METHOD multiplicar.

    result = num1 * num2.

  ENDMETHOD.

  METHOD dividir.
    if num2 = 0.
      raise exception type cx_sy_zerodivide.
    endif.
    result = num1 / num2.

" si la calculadora no pudiera dar el resultado 100.

if result = 100.
    raise exception new zcx_resultado_novalido_aad( valor = result ).
    endif.
  ENDMETHOD.

ENDCLASS.
