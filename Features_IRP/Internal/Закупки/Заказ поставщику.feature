﻿#language: ru

@tree

Функционал: заказ поставщику

Как Менеджер пр закупкам я хочу
зафиксировать заказанный поставщику товар
чтобы проанализироавть разницу между тем что было заказано и что было фактически доставлено   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: _0401 подготовительый сценарий (заказ поставщику)
	Когда экспорт основных данных

Сценарий: _0402 проверка заполнения цены из соглашения
	* Заполнение документа заказ поставщику
		Дано Я открываю навигационную ссылку "e1cib/list/Document.PurchaseOrder"
		И я нажимаю на кнопку с именем 'FormCreate'
		И я нажимаю кнопку выбора у поля "Партнер"
		И в таблице "List" я перехожу к строке:
			| 'Наименование'               |
			| 'Поставщик 1 (1 соглашение)' |
		И в таблице "List" я выбираю текущую строку
		И в таблице "ItemList" я активизирую поле с именем "ItemListLineNumber"
		И в таблице "ItemList" я нажимаю на кнопку с именем 'ItemListAdd'
		И в таблице "ItemList" я активизирую поле с именем "ItemListItem"
		И в таблице "ItemList" я нажимаю кнопку выбора у реквизита "Номенклатура"
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование'            | 'Ссылка'                  |
			| '2'   | 'Товар без характеристик' | 'Товар без характеристик' |
		И в таблице "List" я активизирую поле "Наименование"
		И в таблице "List" я выбираю текущую строку
		И в таблице "ItemList" я завершаю редактирование строки
	* Проверка заполнения цены из согласования
		Тогда таблица "ItemList" содержит строки:
			| 'N' | 'Номенклатура'            | 'Характеристика'          | 'Количество' | 'Ед. изм.' | 'Вид цены'          | 'Цена'   |
			| '1' | 'Товар без характеристик' | 'Товар без характеристик' | '1,000'      | 'шт'       | 'Цена поставщика 1' | '150,00' |
	* Изменения вида цен и проверка его перезаполнения при перевыборе соглашения
		И в таблице "ItemList" я выбираю текущую строку
		И в таблице "ItemList" я нажимаю кнопку выбора у реквизита "Вид цены"
		И в таблице "List" я перехожу к строке:
			| 'Валюта' | 'Код' | 'Наименование'      | 'Ссылка'            |
			| 'USD'    | '4'   | 'Цена поставщика 2' | 'Цена поставщика 2' |
		И в таблице "List" я активизирую поле с именем "Description"
		И в таблице "List" я выбираю текущую строку
		Тогда таблица "ItemList" содержит строки:
			| 'N' | 'Номенклатура'            | 'Характеристика'          | 'Количество' | 'Ед. изм.' | 'Вид цены'          | 'Цена' |
			| '1' | 'Товар без характеристик' | 'Товар без характеристик' | '1,000'      | 'шт'       | 'Цена поставщика 2' | ''     |
		И я нажимаю кнопку выбора у поля "Соглашение"
		И в таблице "List" я перехожу к строке:
			| 'Наименование'               |
			| 'Соглашение с поставщиком 1' |
		И в таблице "List" я выбираю текущую строку
		Тогда открылось окно 'Табличная часть товаров будет обновлена'
		И я нажимаю на кнопку 'ОК'
		Тогда таблица "ItemList" содержит строки:
			| 'N' | 'Номенклатура'            | 'Характеристика'          | 'Количество' | 'Ед. изм.' | 'Вид цены'          | 'Цена'   |
			| '1' | 'Товар без характеристик' | 'Товар без характеристик' | '1,000'      | 'шт'       | 'Цена поставщика 1' | '150,00' |
		И я закрываю все окна клиентского приложения
		
//Сценарий: тест
//	И я закрываю все окна клиентского приложения			
//	Дано Я открываю навигационную ссылку "e1cib/list/Document.PurchaseOrder"
//	И я нажимаю на кнопку с именем 'FormCreate'
//	И я нажимаю кнопку выбора у поля "Партнер"
//	И в таблице "List" я перехожу к строке:
//		| 'Наименование'               |
//		| 'Поставщик 1 (1 соглашение)' |
//	И в таблице "List" я выбираю текущую строку
//	И в таблице "ItemList" я активизирую поле с именем "ItemListLineNumber"
//	И в таблице "ItemList" я нажимаю на кнопку с именем 'ItemListAdd'
//	И я нажимаю сочетание клавиш "Enter"
//	И в таблице "ItemList" из выпадающего списка "Номенклатура" я выбираю по строке 'Товар без характеристик'
//	И я нажимаю сочетание клавиш "F9"
//	И в таблице "ItemList" я перехожу к следующей ячейке
//	И в таблице "ItemList" я устанавливаю флаг "Отмена"
//	И Проверяю шаги на Исключение:
//			|'И в таблице "ItemList" я нажимаю кнопку выбора у реквизита "Номенклатура"'|
//	Тогда таблица "ItemList" содержит строки:
//		| 'Сумма без налогов' | 'Сумма скидки' | 'Номенклатура'            | 'Не рассчитывать строки' | 'Характеристика'          | 'Сумма налогов' | 'Серии номенклатуры' | 'Количество' | 'Заказ поставщику'                          | 'Ед. изм.' | 'НДС' | 'Заказ покупателя' | 'Общая сумма' | 'Дата выполнения' | 'Склад'                         | 'Вид цены'          | 'Статья расходов' | 'Центр прибыли/убытков' | 'Цена'   | 'Дополнительная аналитика' | 'Заявка на обеспечение товара' | 'Используется приходная товарная накладная' | 'Комментарий' |
//		| '125,00'            | ''             | 'Товар без характеристик' | 'Нет'                    | 'Товар без характеристик' | '25,00'         | ''                   | '1,000'      | 'Заказ поставщику 1 от 09.06.2023 19:29:40' | 'шт'       | '20%' | ''                 | '150,00'      | ''                | 'Склад 1 (с контролем остатка)' | 'Цена поставщика 1' | ''                | ''                      | '150,00' | ''                         | ''                             | 'Да'                                        | ''            |
//		| ''                  | ''             | 'Услуга'                  | 'Нет'                    | 'Услуга'                  | ''              | ''                   | '1,000'      | ''                                          | 'шт'       | '20%' | ''                 | ''            | ''                | 'Склад 1 (с контролем остатка)' | 'Цена поставщика 1' | ''                | ''                      | ''       | ''                         | ''                             | 'Нет'                                       | ''            |
//	Тогда в таблице "ItemList" количество строк "равно" 2
//	// сортировак по полю количество по убыванию
//	И в таблице "ItemList" я активизирую поле "Количество"
//	И в таблице "ItemList" я нажимаю на кнопку "Сортировать по убыванию"
//	// сортировка списка заказвы поставщикам без возможности сортировки с помощью расширения
//	И в таблице "List" текущего окна я устанавливаю сортировку по колонке "Partner" по возрастанию (расширение)
//	// сравнение с макетом
//	И таблица "List" содержит строки из макета "Макет" по шаблону
	 
	
	
	
	
		
	
	
		
	