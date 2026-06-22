@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'FILTRO I_CURRENCYTEXT'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_CDS_FILTRO
  as select from /dmo/travel
  association [0..*] to I_CurrencyText as _currency on _currency.Currency = $projection.Currency

{
  key travel_id     as TravelID,
      @Semantics.amount.currencyCode: 'Currency'
      total_price   as Price,
      currency_code as Currency,
      _currency.CurrencyName
}
