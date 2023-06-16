﻿#language: ru

@tree

Функционал: отображение возвратов в отчете D2001 Продажи

Как Тестировщик я хочу
Протестирвавать отображение возвратов в отчете D2001 Продажи
чтобы проверить правильность отображение отчета продаж

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: подготовительй сценарий
	И я закрываю все окна клиентского приложения
	Когда экспорт основных данных
	Когда загрузка документов Поступления товаров и услуг
	Когда загрузка документов Реализация товаров и услуг
	Когда загрузка документов Возврат товаров от покупателя

Сценарий: отображение возвратов в отчете D2001 Продажи
	И я закрываю все окна клиентского приложения
	И Я открываю навигационную ссылку "e1cib/app/Report.D2001_Sales"
	И я нажимаю на кнопку 'Сформировать'
	И я жду когда в табличном документе "Result" заполнится ячейка "R2C1" в течение 20 секунд
	Дано Табличный документ "Result" равен макету "МакетD2001ПродажиСВозвратом" по шаблону	
	И я закрываю все окна клиентского приложения