﻿#language: ru

@tree
@Документы

Функционал: заполнение шапки документа Заказ и расчета поля Количество (итог)

Как Менеджер по продажам я хочу
создать заполнить документ Заказ
чтобы провеить заполнение шапки документа Заказ и расчет поля Количество (итог) 

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Проверка Шапки и количество итог
И я закрываю все окна клиентского приложения
// Дано Я открываю навигационную ссылку 'e1cib/data/Документ.Заказ?ref=904e50ebf6785fab11edecf6f8788a16'
// И элемент формы с именем "ТоварыИтогКоличество" стал равен '25'
* Открытие формы  создания документа
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'
* Заполнение шапки документа
	И заполнение шапки документа заказ	
* Заполнение табличной части документа
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю точное значение 'Тапочки'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '15'
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю точное значение 'Торт '
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '10'
	И в таблице "Товары" я завершаю редактирование строки
	И я нажимаю на кнопку "Записать"
* Проверка расчета Количество Итог
	И итог по количеству равен "25"
* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Поступление товара (создание) *' в течение 20 секунд