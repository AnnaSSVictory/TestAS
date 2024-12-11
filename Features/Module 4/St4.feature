﻿#language: ru

@tree
@Отчеты

Функционал: 4.1 Практические задания четвертого урока.  

//Задания:
//1. Протестируйте заполнение следующих полей документа Заказ покупателя: Партнер, Соглашение, блокировку поля Контрагент – в случае, если не выбран Партнер. В качестве отчета пришлите ссылку на созданный feature файл в репозитории и скриншот о выполнении теста.
//2. Протестируйте отображение возвратов в отчете D2001 Продажи. В качестве отчета пришлите ссылку на созданный feature файл в репозитории и скриншот о выполнении теста. 

Как тестировщик я хочу
Подготовить проверить корректнось заполнения документа Заказ покупателя
чтобы процесс продаж проходил без сбоев
(Заполнение следующих полей документа Заказ покупателя: Партнер, Соглашение, блокировку поля Контрагент – в случае, если не выбран Партнер)

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Проверка работы поля Партнер, Контрагент, Соглашение документа Заказ покупателя
* Подготовка
	И я закрываю все окна клиентского приложения
* Создание документа
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
	Тогда открылось окно 'Заказы покупателей'
	И я нажимаю на кнопку с именем 'FormCreate'
	Тогда открылось окно 'Заказ покупателя (создание)'
* Выбор партнера		
	И из выпадающего списка с именем "Partner" я выбираю по строке 'Розничный покупатель'
	И в таблице "ItemList" я активизирую поле с именем "ItemListLineNumber"
	И я перехожу к следующему реквизиту
* Проверка заполнения полей Контрагент и Соглашение
	Тогда элемент формы с именем "Agreement" стал равен 'Розничное'
	И элемент формы с именем "LegalName" стал равен 'Розничный покупатель'
* Очистка поля Партнер
	И в поле с именем 'Partner' я ввожу текст ''
	И я перехожу к следующему реквизиту
* Проверка недоступности поля Контрагент	
	И элемент формы с именем "LegalName" не доступен
* Проверка очистик поля Соглашение
	Тогда элемент формы с именем "Agreement" стал равен ''

Сценарий: Отображение возвратов в отчете D2001
//Для тестирования я создал настройку отчет D2001, которая отражает документ регистратор, также сохранил макет
//Данные на тестовой БД считаем эталонными и менять их нельзя, иначе отчет будет сформирвоан не верно
* Создание отчета
	И В командном интерфейсе я выбираю 'Отчеты' 'D2001 Продажи'
	Тогда открылось окно 'D2001 Продажи (Отчет для тестироваиня возвратов СДА)'
* Выбор варианта отчета	
	И я нажимаю на кнопку с именем 'FormLoadVariant'
	Тогда открылось окно 'Загрузить форму'
	И в таблице "OptionsList" я активизирую поле с именем "OptionsListReportOption"
	И я нажимаю на кнопку с именем 'FormLoadSetting'
* Формирование отчета
	И я нажимаю на кнопку с именем 'FormGenerate'
* Проверка отчета по шаблону макета
	Дано Табличный документ "Result" равен макету "4_Maket_8_8A2_94" по шаблону
* Проверка полей ячеек относящихся к возвратам
	// Для строки с "Товар с характеристиками"
	И в табличном документе "Result" ячейка с адресом "R18C2" равна "-1,000"
	И в табличном документе "Result" ячейка с адресом "R18C3" равна "-190,00"
	И в табличном документе "Result" ячейка с адресом "R18C4" равна "-158,33"
	// Для строки с "Товар без характеристик"
	И в табличном документе "Result" ячейка с адресом "R20C2" равна "-1,000"
	И в табличном документе "Result" ячейка с адресом "R20C3" равна "-490,00"
	И в табличном документе "Result" ячейка с адресом "R20C4" равна "-408,33"
	

	