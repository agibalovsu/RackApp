# `RackApp`

### Минималистичное `Rack-приложение`, возвращает дату и время в заданном формате.

#### *Запуск: команда rackup в консоли.*

#### *Пример верного запроса:*

- 1: curl --url "http://localhost:9292/time?format=year%2Cmonth%2Cday%2Chour%2Cminute%2Csecond" -i

- 2:Пример неверного запроса, вернет ответ с кодом статуса 404:
curl --url "http://localhost:9292/date?format=year%2Cmonth%2Cday%2Chour%2Cminute%2Csecond" -i

- 3:Незвестный формат, вернет "Unknown time format":
curl --url "http://localhost:9292/time?format=year%2Cmonth%2Cday%2Chour%2Cminute%2Cse" -i
