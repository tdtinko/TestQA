#language: ru

@tree
@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: экспорт Поступления товаров и услуг

Сценарий: загрузка документов Поступления товаров и услуг

	// Документ.PurchaseInvoice

	И я проверяю или создаю для документа "PurchaseInvoice" объекты:
		| 'Ref'                                                                      | 'DeletionMark' | 'Number' | 'Date'                | 'Posted' | 'Agreement'                                                          | 'Company'                                                           | 'Currency'                                                           | 'DocDate'            | 'DocNumber' | 'LegalName'                                                         | 'Partner'                                                          | 'PriceIncludeTax' | 'IgnoreAdvances' | 'LegalNameContract' | 'Author'                                                        | 'Branch' | 'Description' | 'DocumentAmount' |
		| 'e1cib/data/Document.PurchaseInvoice?ref=905550ebf6785fab11ee0c35148362a3' | 'False'        | 3        | '16.06.2023 14:01:02' | 'True'   | 'e1cib/data/Catalog.Agreements?ref=b762b13668d0905011eb76684b9f6870' | 'e1cib/data/Catalog.Companies?ref=b762b13668d0905011eb7663e35d7964' | 'e1cib/data/Catalog.Currencies?ref=b762b13668d0905011eb7663e35d795e' | '01.01.0001 0:00:00' | ''          | 'e1cib/data/Catalog.Companies?ref=b762b13668d0905011eb766bf96b276f' | 'e1cib/data/Catalog.Partners?ref=b762b13668d0905011eb7663e35d794d' | 'True'            | 'False'          | ''                  | 'e1cib/data/Catalog.Users?ref=aa7f120ed92fbced11eb13d7279770c0' | ''       | ''            | 2000             |

	И я перезаполняю для объекта табличную часть "ItemList":
		| 'Ref'                                                                      | 'Key'                                  | 'ItemKey'                                                          | 'Store'                                                          | 'PurchaseOrder' | 'Unit'                                                          | 'Quantity' | 'Price' | 'PriceType'                                             | 'TaxAmount' | 'TotalAmount' | 'NetAmount' | 'OffersAmount' | 'ProfitLossCenter' | 'ExpenseType' | 'DeliveryDate'       | 'SalesOrder' | 'Detail' | 'AdditionalAnalytic' | 'DontCalculateRow' | 'QuantityInBaseUnit' | 'UseGoodsReceipt' | 'InternalSupplyRequest' |
		| 'e1cib/data/Document.PurchaseInvoice?ref=905550ebf6785fab11ee0c35148362a3' | '6b17871a-93dd-40c9-b471-e339517c340a' | 'e1cib/data/Catalog.ItemKeys?ref=b762b13668d0905011eb766bf96b2751' | 'e1cib/data/Catalog.Stores?ref=b762b13668d0905011eb76684b9f6861' | ''              | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | 10         | 200     | 'e1cib/data/Catalog.PriceTypes?refName=ManualPriceType' | 333.33      | 2000          | 1666.67     |                | ''                 | ''            | '01.01.0001 0:00:00' | ''           | ''       | ''                   | 'False'            | 10                   | 'True'            | ''                      |

	И я перезаполняю для объекта табличную часть "TaxList":
		| 'Ref'                                                                      | 'Key'                                  | 'Tax'                                                           | 'Analytics' | 'TaxRate'                                                          | 'Amount' | 'IncludeToTotalAmount' | 'ManualAmount' |
		| 'e1cib/data/Document.PurchaseInvoice?ref=905550ebf6785fab11ee0c35148362a3' | '6b17871a-93dd-40c9-b471-e339517c340a' | 'e1cib/data/Catalog.Taxes?ref=b762b13668d0905011eb7663e35d7970' | ''          | 'e1cib/data/Catalog.TaxRates?ref=b762b13668d0905011eb7663e35d796c' | 333.33   | 'True'                 | 333.33         |

	И я перезаполняю для объекта табличную часть "Currencies":
		| 'Ref'                                                                      | 'Key' | 'CurrencyFrom'                                                       | 'Rate' | 'ReverseRate' | 'ShowReverseRate' | 'Multiplicity' | 'MovementType'                                                                                    | 'Amount' | 'IsFixed' |
		| 'e1cib/data/Document.PurchaseInvoice?ref=905550ebf6785fab11ee0c35148362a3' | ''    | 'e1cib/data/Catalog.Currencies?ref=b762b13668d0905011eb7663e35d795e' | 1      | 1             | 'False'           | 1              | 'e1cib/data/ChartOfCharacteristicTypes.CurrencyMovementType?ref=b762b13668d0905011eb7663e35d796b' | 2000     | 'False'   |
		| 'e1cib/data/Document.PurchaseInvoice?ref=905550ebf6785fab11ee0c35148362a3' | ''    | 'e1cib/data/Catalog.Currencies?ref=b762b13668d0905011eb7663e35d795e' | 0.859  | 1.1641        | 'False'           | 1              | 'e1cib/data/ChartOfCharacteristicTypes.CurrencyMovementType?ref=b762b13668d0905011eb7663e35d796a' | 1718     | 'False'   |
		| 'e1cib/data/Document.PurchaseInvoice?ref=905550ebf6785fab11ee0c35148362a3' | ''    | 'e1cib/data/Catalog.Currencies?ref=b762b13668d0905011eb7663e35d795e' | 1      | 1             | 'False'           | 1              | 'e1cib/data/ChartOfCharacteristicTypes.CurrencyMovementType?ref=b762b13668d0905011eb7663e35d7968' | 2000     | 'False'   |
		| 'e1cib/data/Document.PurchaseInvoice?ref=905550ebf6785fab11ee0c35148362a3' | ''    | 'e1cib/data/Catalog.Currencies?ref=b762b13668d0905011eb7663e35d795e' |        |               | 'False'           |                | 'e1cib/data/ChartOfCharacteristicTypes.CurrencyMovementType?ref=b762b13668d0905011eb7663e35d7969' |          | 'False'   |

	И я перезаполняю для объекта табличную часть "RowIDInfo":
		| 'Ref'                                                                      | 'Key'                                  | 'RowID'                                | 'Quantity' | 'Basis' | 'CurrentStep' | 'NextStep'                                    | 'RowRef'                                                         | 'BasisKey' |
		| 'e1cib/data/Document.PurchaseInvoice?ref=905550ebf6785fab11ee0c35148362a3' | '6b17871a-93dd-40c9-b471-e339517c340a' | '6b17871a-93dd-40c9-b471-e339517c340a' | 10         | ''      | ''            | 'e1cib/data/Catalog.MovementRules?refName=GR' | 'e1cib/data/Catalog.RowIDs?ref=905550ebf6785fab11ee0c35148362a2' | ''         |
	
	И я выполняю код встроенного языка на сервере
		|'Документы.PurchaseInvoice.НАйтиПоНомеру(3).ПолучитьОбъект().Записать(РежимЗаписиДокумента.проведение);'|


