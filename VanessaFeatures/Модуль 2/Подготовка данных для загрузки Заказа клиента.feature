﻿#language: ru
@tree

Функционал: Подготовка данных для загрузки заказа клиента

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Подготовка данных для заказа
	И Загрузка контрагентов
	И загрузка организации и констант
	И Загрузка складов и регионов 
	И Загрузка товаров