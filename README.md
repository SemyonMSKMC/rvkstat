# Содержание ReadMe пакета rvkstat
- [Краткое описание пакета rvkstat](https://github.com/selesnow/rvkstat/blob/master/README.md#Краткое-описание-пакета-rvkstat)
- [Что необходимо для начала работы с API Вктонтакте с помощью пакета rvkstat](https://github.com/selesnow/rvkstat/blob/master/README.md#Требование)
- [Установка пакета rvkstat](https://github.com/selesnow/rvkstat/blob/master/README.md#Установка-пакета)
- [Как пройти аутентификацию для работы с API Вконтакте с помощью пакета rvkstat]()
- [Функции доступные в пакете rvkstat](https://github.com/selesnow/rvkstat/blob/master/README.md#Функции-доступные-в-пакете-rvkstat)
  - [Функции для загрузки данных из рекламного кабинета Вконтакте]()
    - [vkGetAccount]() - Получить список доступных рекламных кабинетов
    - [vkGetAds]() - Получить список объявлений
  - [Функции для загрузки данных из сообществ Вконтакте]()
    - [vkGetGroupStat]() - Получить общую статистику по сообществу
    - [vkGetGroupStatAge]() - Получить данные о посетителях сообщества по возрасту
    - [vkGetGroupStatCity]() -Получить данные о посетителях сообщества по городам
    - [vkGetGroupStatCountries]() - Получить данные о посетителях сообщества по странам
    - [vkGetGroupStatGender]() - Получить данные о посетителях сообщества по полу
    - [vkGetGroupStatGenderAge]() - Получить данные о посетителях сообщества по полу и возрасту
- [Примеры работы с пакетом rvkstat]()

## Краткое описание пакета rvkstat
Пакет rvkstat является R клиентом для работы с API социальной сети [Вконтакте](url), с помощью функций данного пакета можно получить статистику из рекламного кабинета Вконтакте, а так же данные о посетителях сообществ вконтакте по дням, в разрезе возрастных групп, пола и геолокации посетителей.

## Что необходимо для начала работы с API Вктонтакте с помощью пакета rvkstat
Для работы с api вконтакте вам необходимо создать Standalone-приложение, для этого перейдите по этой <a href="https://vk.com/editapp?act=create">ссылке</a>, и выберите Standalone-приложение. 
<img src="http://picsee.net/upload/2016-04-29/ccbead79d129.png" data-canonical-src="http://picsee.net/upload/2016-04-29/ccbead79d129.png" style="max-width:100%;">

Для начала работы и для того, что бы с помощью функции `vkGetToken()` получить токен разработчика используйте ID приложения.
<img src="http://picsee.net/upload/2016-04-29/39ef5f2d1d09.png" data-canonical-src="http://picsee.net/upload/2016-04-29/39ef5f2d1d09.png" style="max-width:100%;">


## Установка пакета
Пакет rvkstat может быть установлен непосредственно из репозитория Github с помощью приведённого ниже программного кода.

```
if(!"devtools" %in% installed.packages()[,1]){install.packages("devtools")}
devtools::install_github('selesnow/rvkstat')
```
## Авторизация вконтакте для работы с API.
Для прохождения процесса авторизации в пакете rvkstat есть две функции:

+ vkGetToken - Упрощённая авторизация по методу [Implicit Flow](https://vk.com/dev/implicit_flow_user), токен доступа выдаётся с привязкой к IP адресу, в связи с чем при смене IP адреса прийдётся проходить процедуру авторизации.
+ vkAuth - Для прохождение процесса авторизации с помощью метода [Authorization Code Flow](https://vk.com/dev/authcode_flow_user), токен полученный с помощью данной функции будет работать с любого IP.

#### Пример прохождения авторизации с помощью функции vkGetToken
Для авторизации по схеме [Implicit Flow](https://vk.com/dev/implicit_flow_user) воспользуйтесь следующим кодом:

`myToken <- vkGetToken(appId = <ID Вашего Приложения>)`

Измените <ID Вашего Приложения> на ID вашего приложения, ID приложения можно получить на странице настройки приложения, как показано в разделе "[Что необходимо для начала работы с API Вктонтакте с помощью пакета rvkstat](https://github.com/selesnow/rvkstat/blob/master/README.md#Требование)".

После запуска функции откроется окно браузера, в котором вы должны подтвердить доступ к данным в вконтакте, далее откроется страница в URL адресе которой будет параметр access_token, скопируйте его значение и вставьте в R, в качестве ответа на запрос "Your vk token from URL parameter access_token: ".

#### Пример прохождения авторизации с помощью функции vkAuth
`myToken <- vkAuth(client_id = <ID Вашего Приложения>, client_secret = <Защищённый Ключ Вашего Приложения>)`

Вместо <ID Вашего Приложения> укажите ID вашего приложения, вместо <Защищённый Ключ Вашего Приложения> укажите защищёный ключ вашего приложения, оба аргумента можно посмотреть на странице настройки приложения как описано в разделе "[Что необходимо для начала работы с API Вктонтакте с помощью пакета rvkstat](https://github.com/selesnow/rvkstat/blob/master/README.md#Требование)". 

После запуска функции откроется окно браузера, в котором вы должны подтвердить доступ к данным в вконтакте, далее откроется страница в URL адресе которой будет параметр code, скопируйте его значение и вставьте в R, в качестве ответа на запрос "Enter code from URL: ".

## Функции доступные в пакете rvkstat

### Функции для загрузки данных из рекламного кабинета Вконтакте

#### Получить список досупных рекламных кабинетов Вконтакте
```
##Авторизация в вк
my_tok <- vkAuth(client_id = 1,client_secret = "H2Pk8htyFD8024mZaPHm")
##Запрос списка доступных рекламных кабинетов
my_vk_acc <- vkGetAccounts(my_tok$access_token)
```
##### Аргументы
<b>access_token</b> - Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken


#### Получить список объявлений из рекламного кабинета вконтакте
```
##Авторизация в вконтакте
my_tok <- vkAuth(client_id = 1,client_secret = "H2Pk8htyFD8024mZaPHm")
#Получаем список объявлений
my_vk_ads <- vkGetAds(account_id = 11111111, 
                      access_token = my_tok$access_token)
```
##### Аргументы
<b>account_id</b> - Идентификатор рекламного кабинета, список всех доступных рекламных кабинетов можно получить с помщью функции vkgetAccounts.
<b>client_id</b> - Идентификатор клиента, у которого запрашиваются рекламные объявления. Доступно и обязательно для рекламных агентств.
<b>include_deleted</b> - Логическое TRUE или FALSE, флаг, задающий необходимость вывода архивных объявлений.
<b>campaign_ids</b> - Числовой вектор, фильтр по рекламным кампаниям.
<b>ad_ids</b> - Числовой вектор, фильтр по рекламным объявлениям.
<b>access_token</b> - Токен доступа к API, полученный с помощью функций vkAuth или vkGetToken

### Функции для загрузки данных из сообществ Вконтакте

#### Получить данные о количестве просмотров, посетителях, подписавшихся и отписавшихся посетителей по дням

`communityData <- vkGetGroupStat(date_from = "2016-01-01", date_to = "2016-04-01", group_id = 1, access_token = myToken)`

#### Получить данные о возрастных группах посетителей по дням.

`communityDataAge <- vkGetGroupStatAge(date_from = "2016-01-01", date_to = "2016-04-01", group_id = 1, access_token = myToken)`

#### Получить данные о поле посетителей по дням.

`communityDataGender <- vkGetGroupStatGender(date_from = "2016-01-01", date_to = "2016-04-01", group_id = 1, access_token = myToken)`

#### Получить данные о половозрастной структуре ваших посетителей по дням.

`communityDataGenderAge <- vkGetGroupStatGenderAge(date_from = "2016-01-01", date_to = "2016-04-01", group_id = 1, access_token = myToken)`

#### Получить данные о городах посетителей.

`communityDataCity <- vkGetGroupStatCity(date_from = "2016-01-01", date_to = "2016-04-01", group_id = 1, access_token = myToken)`

#### Получить данные о странах посетителей.

`communityDataCountries <- vkGetGroupStatCountries(date_from = "2016-01-01", date_to = "2016-04-01", group_id = 1, access_token = myToken)`

<p align="center">
<img src="http://s017.radikal.ru/i444/1608/b7/989edcf88741.png" data-canonical-src="http://s017.radikal.ru/i444/1608/b7/989edcf88741.png" style="max-width:100%;">
</p>
