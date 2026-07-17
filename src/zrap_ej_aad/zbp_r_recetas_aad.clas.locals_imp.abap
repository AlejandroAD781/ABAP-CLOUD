CLASS LHC_ZR_RECETAS_AAD DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR ZrRecetasAad
        RESULT result,
      validateTiempo FOR VALIDATE ON SAVE
            IMPORTING keys FOR ZrRecetasAad~validateTiempo,
      setPublicada FOR DETERMINE ON MODIFY
            IMPORTING keys FOR ZrRecetasAad~setPublicada,
      setCategoria FOR DETERMINE ON save
            IMPORTING keys FOR ZrRecetasAad~setCategoria.
ENDCLASS.

CLASS LHC_ZR_RECETAS_AAD IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.
  METHOD validateTiempo.

  READ ENTITIES OF ZR_RECETAS_AAD IN LOCAL MODE
    ENTITY ZrRecetasAad
      FIELDS ( TiempoPrep )
      WITH CORRESPONDING #( keys )
    RESULT DATA(TIEMPO).

    LOOP AT tiempo INTO DATA(tiempoprep).
      IF tiempoprep-TiempoPrep not between 1 and 600.
        APPEND VALUE #(
          %tky        = tiempoprep-%tky
          %msg        = new_message_with_text(
                          severity = if_abap_behv_message=>severity-error
                          text     = 'Tiempo erroneo, no se puede guardar' )
        ) TO reported-zrrecetasaad.

        APPEND VALUE #( %tky = tiempoprep-%tky ) TO failed-zrrecetasaad.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD setPublicada.

  MODIFY ENTITIES OF ZR_RECETAS_AAD IN LOCAL MODE
    ENTITY ZrRecetasAad
      UPDATE FIELDS ( Publicada )
      WITH VALUE #(
        FOR key IN keys
        (
          %tky      = key-%tky
          Publicada = abap_true
        )
      ).

  ENDMETHOD.

  METHOD setCategoria.

    MODIFY ENTITIES OF ZR_RECETAS_AAD IN LOCAL MODE
    ENTITY ZrRecetasAad
      UPDATE FIELDS ( Categoria )
      WITH VALUE #(
        FOR key IN keys
        (
          %tky      = key-%tky
          Categoria = 'N'
        )
      ).
  ENDMETHOD.

ENDCLASS.
