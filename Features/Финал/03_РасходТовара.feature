﻿#language: ru

@tree

Функционал: проверка документа РасходТовара

Как Тестироващик я хочу
для документа РасходТовара проверить создание, запись, проведения, создание движений по регистрам, а так же формирование печатной форму "Расходная товарная накладная"
чтобы проверить правильность работы документа

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: создание документа Расход Товара
	* закрыть все окна
		И я закрываю все окна клиентского приложения		
	* создание и заполнение шапки
		Дано Я открываю навигационную ссылку "e1cib/list/Документ.РасходТовара"
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
		И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Животноводство ООО '
		И из выпадающего списка с именем "Склад" я выбираю точное значение 'Склад отдела продаж'
		И из выпадающего списка с именем "ВидЦен" я выбираю точное значение 'Розничная'
		Если элемент "Валюта" присутствует на форме Тогда
			Тогда из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
		Иначе	
			Тогда элемент формы с именем "Валюта" не доступен
	* заполнение табличной части		
		И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
		И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю по строке 'VekoNT02'
		И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '2,00'
		И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
		И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю по строке 'Доставка'
	* проведение документа
		И я нажимаю на кнопку с именем 'ФормаПровести'
		И я запоминаю текущее окно как "ТекущийДокумент"
	* проверка документа шапки и табличной части
		И элемент формы с именем "ВидЦен" стал равен 'Розничная'
		И элемент формы с именем "Организация" стал равен 'ООО \"1000 мелочей\"'
		И элемент формы с именем "Покупатель" стал равен 'Животноводство ООО '
		И элемент формы с именем "Склад" стал равен 'Склад отдела продаж'
		И элемент формы с именем "ВидЦен" стал равен 'Розничная'
		И таблица "Товары" стала равной:
			| 'N' | 'Товар'    | 'Цена'     | 'Количество' | 'Сумма'     |
			| '1' | 'VekoNT02' | '8 000,00' | '2,00'       | '16 000,00' |
			| '2' | 'Доставка' | '300,00'   | '1,00'       | '300,00'    |
		И элемент формы с именем "ТоварыИтогКоличество" стал равен '3'
		И элемент формы с именем "ТоварыИтогСумма" стал равен '16 300'
	* проверка движений 'Регистр взаиморасчетов с контрагентами'
		И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр взаиморасчетов с контрагентами'
		Тогда таблица "Список" стала равной:
			| 'Период' | 'Регистратор'       | 'Номер строки' | 'Контрагент'          | 'Сумма'     | 'Валюта' |
			| '*'      | '$ТекущийДокумент$' | '1'            | 'Животноводство ООО ' | '16 300,00' | ''       |
	* проверка движений	'Регистр продаж'
		И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр продаж'
		Тогда таблица "Список" стала равной:
			| 'Период' | 'Регистратор'       | 'Номер строки' | 'Покупатель'          | 'Товар'    | 'Количество' | 'Сумма'     |
			| '*'      | '$ТекущийДокумент$' | '1'            | 'Животноводство ООО ' | 'VekoNT02' | '2,00'       | '16 000,00' |
			| '*'      | '$ТекущийДокумент$' | '2'            | 'Животноводство ООО ' | 'Доставка' | '1,00'       | '300,00'    |
	* проверка движений	'Регистр товарных запасов'
		И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр товарных запасов'
		Тогда таблица "Список" стала равной:
			| 'Период' | 'Регистратор'       | 'Номер строки' | 'Товар'    | 'Склад'               | 'Количество' |
			| '*'      | '$ТекущийДокумент$' | '1'            | 'VekoNT02' | 'Склад отдела продаж' | '2,00'       |
	* проверка печатной формы			
		И В текущем окне я нажимаю кнопку командного интерфейса 'Основное'
		И я нажимаю на кнопку с именем 'ФормаДокументРасходТовараПечатьРасходнойНакладной'
		Тогда открылось окно 'Таблица'
		И в табличном документе 'SpreadsheetDocument' я перехожу к ячейке "R1C1"
		Тогда табличный документ "SpreadsheetDocument" равен:
			| 'Расход товара' | ''                                                | ''           | ''       |
			| ''              | ''                                                | ''           | ''       |
			| 'Номер'         | '*'                                               | ''           | ''       |
			| 'Дата'          | '*'                                               | ''           | ''       |
			| 'Покупатель'    | 'Животноводство ООО '                             | ''           | ''       |
			| 'Склад'         | 'Склад отдела продаж'                             | ''           | ''       |
			| 'Сумма'         | '16 300 рублей (Шестнадцать тысяч триста рублей)' | ''           | ''       |
			| 'Вес'           | ''                                                | ''           | ''       |
			| ''              | ''                                                | ''           | ''       |
			| 'Товар'         | 'Цена'                                            | 'Количество' | 'Сумма'  |
			| 'VekoNT02'      | '8 000'                                           | '2'          | '16 000' |
			| 'Доставка'      | '300'                                             | '1'          | '300'    |
	* закрыть все окна
		И я закрываю все окна клиентского приложения	
				
				

