﻿#language: ru

@tree

Функционал: Проверка заполнения поля Организация в Заказе покупателя 

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Проверка заполнения поля Организация в Заказе покупателя
И я закрываю все окна клиентского приложения
И В командном интерфейсе я выбираю "Продажи" "Заказы покупателей"
Когда открылось окно "Заказы покупателей"
И я нажимаю на кнопку с именем 'FormCreate'
И я нажимаю кнопку выбора у поля с именем 'Partner'
Тогда открылось окно "Партнеры"
И в таблице 'List' я перехожу к строке:
	| "Код" | "Наименование"       |
	| "12"  | "Розничный клиент 1" |
И я нажимаю на кнопку с именем 'FormChoose'
Если поле "Организация" не заполнено Тогда
	И я нажимаю кнопку выбора у поля с именем 'Company'
	Тогда открылось окно "Организации"
	И в таблице 'List' я перехожу к строке:
		| "Код" | "Наименование"           |
		| "1"   | "Собственная компания 1" |
	И я нажимаю на кнопку с именем 'FormChoose'