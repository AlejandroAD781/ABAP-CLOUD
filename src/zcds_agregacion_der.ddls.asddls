@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'AGREGACION'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_AGREGACION_DER as select from /dmo/travel
{
    key travel_id as TravelID,
        agency_id as AgencyID,
        
    @Semantics.amount.currencyCode: 'Moneda'  //los campos mix, max, sum, count son reconocidos como agregadores y el sistema requiere group by
    min(total_price) as MinTotalPrecio,
    @Semantics.amount.currencyCode: 'Moneda'
    max(total_price) as MaxTotalPrecio,
    @Semantics.amount.currencyCode: 'Moneda'
    sum(total_price) as sumtotalPrice,
    
    count(distinct agency_id ) as CountDistTotalPrice, //Cuenta el numero de agencias distitnas 
    count( * ) as CountTotalPrice, //Cuenta filas
    
    currency_code as Moneda
}

group by

travel_id,
agency_id,
currency_code;
