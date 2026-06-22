@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_7_AAD as select from /dmo/flight
{
    key carrier_id as pepe,
    key connection_id as ConnectionID,
    key flight_date as FlightDate,
    @Semantics.amount.currencyCode: 'moneda' //es necesario esta linea @semantics con el caso de moneda y se en la linea antes donde se definen las columnas de los precios
    @EndUserText.label: 'Precio' 
    price as Precio,
    currency_code as moneda,
    'USD' as manual,
    '20300101' as fecha,
    cast( '20200202' as abap.dats ) as FechaC, // cast convierte los tipos
    1.2 as flotante,
    fltp_to_dec(3.2 as abap.dec( 4,3 )) as NumeroDecimal
    
    
}
