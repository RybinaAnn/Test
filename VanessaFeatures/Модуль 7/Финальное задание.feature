﻿#language: ru

@tree

Функционал: Финальное задание

Контекст:
  Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

# Задание 1. Прикрепление файла картинки к элементу справочника Номенклатура
Сценарий: Прикрепление картинки к номенклатуре
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю "Закупки" "Товары"
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице 'Список' я перехожу к строке:
  		| "Артикул"  | "Код"       | "Наименование" | "Поставщик"           |
  		| "ПРД-0002" | "000000021" | "Масло"        | "Животноводство ООО " |
	И в таблице 'Список' я выбираю текущую строку
	Когда открылось окно "Масло (Товар)"
	И я нажимаю кнопку выбора у поля с именем 'ФайлКартинки'
	Тогда открылось окно "Файлы"
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Масло (Товар) *"
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	
// Задание 2. Проверка отчета "Остатки"
Сценарий: Формирование отчета Остатки
И я закрываю все окна клиентского приложения
И В командном интерфейсе я выбираю "Товарные запасы" "Остатки товаров"
* Загрузка варианта
	И В командном интерфейсе я выбираю "Товарные запасы" "Остатки товаров"
	И я нажимаю на кнопку с именем 'ФормаЗагрузитьВариант'
	Тогда открылось окно "Выбор варианта отчета"
	И в таблице 'СписокНастроек' я перехожу к строке:
		| "Представление" |
		| "Основной"      |
	И я нажимаю на кнопку с именем 'Загрузить'
	Тогда открылось окно "Остатки товаров"
	И из выпадающего списка с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент1Значение' я выбираю по строке "масло"
	И Пауза 20
* Формирование и проверка
	И я нажимаю на кнопку с именем 'ФормаСформировать'
	И я жду, что табличный документ "Результат" заполнится данными в течение 10 секунд
	Дано табличный документ "Результат" равен макету "ОстаткиТоваров" по шаблону
	И я закрываю все окна клиентского приложения
//# Задание 3. Проверка документа "Расход товара"
Сценарий: Создание и проведение документа Реализация
  	И я закрываю все окна клиентского приложения
  	И В командном интерфейсе я выбираю "Продажи" "Документы продаж"
  	Тогда открылось окно "Документы продаж"
  	И я нажимаю на кнопку с именем 'ФормаСоздатьПоПараметруРасходТовара' 
  	Когда открылось окно "Продажа товара (создание)"
  	И из выпадающего списка с именем 'Организация' я выбираю точное значение "ООО \"1000 мелочей\""
  	И из выпадающего списка с именем 'Покупатель' я выбираю точное значение "Животноводство ООО "
  	И из выпадающего списка с именем 'Склад' я выбираю точное значение "Большой"
  	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
  	И в таблице 'Товары' я нажимаю кнопку выбора у реквизита с именем 'ТоварыТовар'
  	Тогда открылось окно "Товары"
  	И я нажимаю на кнопку с именем 'ФормаСписок'
  	Когда открылось окно "Товары"
  	И в таблице 'Список' я перехожу к строке:
  		| "Артикул" | "Код"       | "Наименование" |
  		| "Mol34"   | "000000026" | "Молоко"       |
  	И в таблице 'Список' я выбираю текущую строку
 	И в таблице 'Товары' в поле с именем 'ТоварыЦена' я ввожу текст "100,00"
 	И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
 	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "2,00"
   	И в таблице 'Товары' я завершаю редактирование строки
 	И я нажимаю на кнопку с именем 'ФормаЗаписать'
  	И я нажимаю на кнопку с именем 'ФормаПровести'
  	Тогда не появилось окно предупреждения системы
  	И я нажимаю на кнопку с именем 'ФормаДокументРасходТовараПечатьРасходнойНакладной'
  	Дано табличный документ "SpreadsheetDocument" равен макету "ПФРасходТовара" по шаблону
  	И я закрываю текущее окно
  	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр взаиморасчетов с контрагентами'
  	И я жду, что в таблице 'Список' количество строк будет "больше" 0 в течение 10 секунд
  	Тогда таблица "Список" содержит строки
    	| 'Период' | 'Регистратор' | 'Номер строки' | 'Контрагент'         | 'Сумма'  |
    	| '*'      | '*'           | '1'            | 'Животноводство ООО' | '200,00' |
  	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр продаж'
  	И я жду, что в таблице 'Список' количество строк будет "больше" 0 в течение 10 секунд
  	Тогда таблица "Список" содержит строки
    	| 'Период' | 'Регистратор' | 'Номер строки' | 'Покупатель'         | 'Товар'  | 'Количество' | 'Сумма'  |
    	| '*'      | '*'           | '1'            | 'Животноводство ООО' | 'Молоко' | '2,00'       | '200,00' |
  	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр товарных запасов'
  	И я жду, что в таблице 'Список' количество строк будет "больше" 0 в течение 10 секунд
  	Тогда таблица "Список" содержит строки
    	| 'Период' | 'Регистратор' | 'Номер строки' | 'Товар'  | 'Склад'   | 'Количество' |
    	| '*'      | '*'           | '1'            | 'Молоко' | 'Большой' | '2,00'       |
  	И я закрываю текущее окно
  	И я закрываю все окна клиентского приложения
 