﻿#language: ru
Функционал: Проверка расчета суммы Заказа

Как Менеджер по закупкам я хочу
проверить добавление услуги Заказа
чтобы нельзя было ввести количество 
Контекст: 
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
Сценарий: Проверка добавление количества услуги в существующем заказе
* Открытие формы документа
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю "Продажи" "Заказы"
	Тогда открылось окно "Заказы товаров"	
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Заказ * от *"
* Заполнение товаров
	И я удаляю все строки таблицы "Товары"	
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' я нажимаю кнопку выбора у реквизита с именем 'ТоварыТовар'
	Тогда открылось окно "Товары"
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице 'Список' я перехожу к строке:
		| "Код"       | "Наименование" |
		| "000000037" | "Доставка"     |
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Заказ * от * *"
	И в таблице 'Товары' из выпадающего списка с именем 'ТоварыТовар' я выбираю точное значение "Доставка"
	И в таблице 'Товары' я завершаю редактирование строки
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
	И в таблице 'Товары' я выбираю текущую строку
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
	Тогда в таблице 'Товары' поле с именем 'ТоварыКоличество' доступно
	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "10"
