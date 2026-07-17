@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'logica2'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_LOGICA2
  as select from /dmo/flight  as f
    inner join   /dmo/carrier as c on c.carrier_id = f.carrier_id
{
//  key f.carrier_id,
  key f.connection_id,
  key f.flight_date,
  key c.name,
  @Semantics.amount.currencyCode: 'Currency'
  f.price,
  @Semantics.amount.currencyCode: 'Currency'
  f.price + f.price as doble,
  f.currency_code as Currency,

  case
    when f.price < 10000 then 'Bajo'
    else 'Alto'
  end               as categoria

}
