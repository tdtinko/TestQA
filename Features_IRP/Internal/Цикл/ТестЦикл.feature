﻿#language: ru

@tree

Функционал: <описание фичи>

Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект>   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: изменение количества во всех строках таблицы
	
	И для каждой строки таблицы "ItemList" я выполняю используя колонку "N"
		И в таблице "ItemList" в поле "Количество" я ввожу текст "10,000"

Сценарий: удаление строк таблицы
	И пока в таблице "ItemList" количество строк ">" 0 Тогда
		И в таблице "ItemList"  я удаляю строку

Сценарий: изменение вида цен ро условиям
	И для каждой строки таблицы "ItemList" я выполняю
		Если таблица  "ItemList" содержит строки Тогда:
			| 'Номенклатура'             | 'Характеристика' | 'Вид цены'          |
			| 'Товар с характеристиками' | 'S/Красный'      | 'Цена поставщика 1' |
			И в таблице "ItemList" я перехожу к строке:
				| 'Номенклатура'             | 'Характеристика' | 'Вид цены'          |
				| 'Товар с характеристиками' | 'S/Красный'      | 'Цена поставщика 1' |
			И в таблице "ItemList" я выбираю текущую строку
			И в таблице "ItemList" я нажимаю кнопку выбора у реквизита "Вид цены"
			И в таблице "List" я перехожу к строке:
				| 'Код' | 'Наименование'      | 'Ссылка'            |
				| '1'   | 'Ручное назначение' | 'Ручное назначение' |
			И в таблице "List" я выбираю текущую строку
	// проверяем что все строки поменялись
	И таблица  "ItemList" не содержит строки:
		| 'Номенклатура'             | 'Характеристика' | 'Вид цены'          |
		| 'Товар с характеристиками' | 'S/Красный'      | 'Цена поставщика 1' |
		
Сценарий: перебор элементов справочника Номенклатура
	И в таблице "List" я перехожу к первой строке
		И для каждой строки таблицы "List" я выполняю
		Тогда не появилось окно предупреждения системы
		И я закрываю текущее окно
										
Сценарий: создание большого объема данных (справочник Ед. измерения)
	И я запоминаю значение выражения '1' в переменную "Шаг"
	И я делаю 10 раз
		И Я запоминаю значение выражения '$Шаг$+1' в переменную "Шаг"
		И Я запоминаю значение выражения '"ед.изм." + $Шаг$' в переменную "ЕдиницаИзмерения"
		И я проверяю или создаю для справочника "Units" объекты:
		| 'Ref'                                                              | 'DeletionMark' | 'Code' | 'Item' | 'Quantity' | 'BasisUnit' | 'UOM' | 'Description_en'     | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'Height' | 'Length' | 'Volume' | 'Weight' | 'Width' |
		| '{"e1cib/data/Catalog.Units?ref=" + StrReplace(New UUID, "-","")}' | 'False'        |        | ''     | 1          | ''          | ''    | '$ЕдиницаИзмерения$' | ''                 | ''               | ''               |          |          |          |          |         |




		
	 
