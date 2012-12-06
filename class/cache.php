<?php

CLASS CACHE {//Begin class
//Название класса

    var $name = "WebCachePage";
//Версия класса кэширования
    var $version = "_v_1.0";
//Хэш код файла
    var $hash_code = "";
//Каталог кэширования файлов
    var $dir_cache = "cache";
//Переменная содержащая дату последнего кэширования, которую получаем в результате вычислений
    var $modifi_file;
//Время последней модификации
//Устанавливается в секундах, по умолчанию 10 мин
    var $time_file_cache = 600;
//Хранение значения контента файла
//При буферизации
    var $CONTENT;

    /*
      ----------------------------------------------
      Главная функция кэшируемых файлов
      ----------------------------------------------
     */

    function haupt_cache() {
        $this->code_file(); //Получение хэш кода файла
        $this->clean_content(); //Получение и отчистка буфера
        if ($this->file_and_katalog_isset() == FALSE)
            $this->create_cache_file(); //Создания файла кэша если его нет
        else
            $this->cache_file(); //Проверка последней модификации
        if ($this->modifi_file > $this->time_file_cache)
            $this->mod_file_cache(); //Модифицирование файла кэша
    }

    /*
      -------------------------------------------------------------------------------
      Функция проверки существования файла и каталога кэширования
      -------------------------------------------------------------------------------
     */

    function file_and_katalog_isset() {
        if (file_exists($this->dir_cache . "/" . $this->hash_code . ".php"))
            return TRUE; //Проверяет существование файла в каталоге кэширования
        else
            return FALSE;
    }

    /*
      ----------------------------------------------
      Функция кэширования контента файла
      ----------------------------------------------
     */

    function cache_content() {
        ob_start(); //Кэшируем контент файла
    }

    /*
      -------------------------------------------------------
      Функция преобразования url файла в хэш код
      -------------------------------------------------------
     */

    function code_file() {
        $url = $GLOBALS['REQUEST_URI']; //Получаем url файла
        $hashcode_file = md5($url); //Хэш код файла
        $this->hash_code = $hashcode_file;
    }

    /*
      ----------------------------------------------------------------------------------
      Функция создания файла кэша если его нет в каталоге кэширования
      ----------------------------------------------------------------------------------
     */

    function create_cache_file() {
        $open = fopen($this->dir_cache . "/" . $this->hash_code . ".php", "at") or die(trigger_error("Невозможно открыть файл " . $this->hash_code . ".php [" . $this->name . $this->version . "]", E_USER_ERROR)); //Создаём файл с кэшем
        flock($open, LOCK_EX); //Блокируем файл
        rewind($open); //Установка позиции в начало файла
        $time_create_file = time(); //Время создания кэшируемого файла
        $write_file = $this->CONTENT . ""; //Формируем контент файла для записи
        fwrite($open, $write_file); //Записываем данные
        fclose($open); //Закрываем файл
        readfile($this->dir_cache . "/" . $this->hash_code . ".php");
    }

    /*
      -------------------------------------------------------------
      Функция проверки последнего кэширования файла
      -------------------------------------------------------------
     */

    function cache_file() {
        $fopen = fopen($this->dir_cache . "/" . $this->hash_code . ".php", "rt") or die(trigger_error("Невозможно открыть файл " . $this->hash_code . ".php [" . $this->name . $this->version . "]", E_USER_ERROR)); //Открываем файл
        $fread = fread($fopen, filesize($this->dir_cache . "/" . $this->hash_code . ".php")); //Прочитываем контент файла
        preg_match_all("/()/i", $fread, $time_mod); //Ишем дату последней модификации файла
        fclose($fopen); //Закрываем файл с кэшем
        $mod_file = time() - $time_mod[2][0]; //Время последнего кэширования файла
        $this->modifi_file = $mod_file; //Присваиваем модификацию файла переменной
        if ($this->modifi_file < $this->time_file_cache) { //Проверяем время последнего кэширования
            readfile($this->dir_cache . "/" . $this->hash_code . ".php"); //Подключаем файл
        }
    }

    /*
      ------------------------------------------------------------------------------------------
      Функция модификации файла если время полседнего кэширования истекло
      ------------------------------------------------------------------------------------------
     */

    function mod_file_cache() {
        unlink($this->dir_cache . "/" . $this->hash_code . ".php"); //Удаляем кэшируемый файл так как время последней модификации истекло
        $open = @fopen($this->dir_cache . "/" . $this->hash_code . ".php", "at") or die(trigger_error("Невозможно открыть файл " . $this->hash_code . ".php [" . $this->name . $this->version . "]", E_USER_ERROR)); //Открываем файл
        flock($open, LOCK_EX); //Блокируем файл
        rewind($open); //Установка позиции в начало файла
        $time_create_file = time(); //Время создания кэшируемого файла
        $write_file = $this->CONTENT . ""; //Формируем контент файла для записи
        fwrite($open, $write_file); //Записываем данные
        fclose($open); //Закрываем файл
        readfile($this->dir_cache . "/" . $this->hash_code . ".php");
    }

    /*
      -------------------------------------------
      Функция отчистки каталога с кэшем
      -------------------------------------------
     */

    function cleaning_cache_katalog($type, $file = "") {
        switch ($type) {
            case"all":
                $dir = opendir($this->dir_cache); //Открываем каталог с кэшем
                while ($delete_file = readdir($dir)) { //Читаем каталог с кэшем в цикле
                    unlink($this->dir_cache . "/" . $delete_file); //Удаляем все файлы
                }
                closedir($dir);
                break;
            case"file":
                if (unlink($this->dir_cache . "/" . $file))
                    echo"Файл кэша " . $file . " успешно удалён из каталога"; //Удаляем файл из каталога с кэшем
                else
                    trigger_error("Невозможно удалить файл с кэшем [" . $this->name . $this->version . "]", E_USER_ERROR); //Выводми сообщение об ошибке
                break;
            default:
                trigger_error("Такой команда отсутствует [" . $this->name . $this->version . "]", E_USER_ERROR); //Сообщение об ошибке
                break;
        }
    }

    /*
      ---------------------------------
      Функция получения буфера
      ---------------------------------
     */

    function clean_content() {
        $this->CONTENT = ob_get_contents(); //Записываем буфер в переменную
        ob_end_clean(); //Отчищаем буфер
    }

}

//End_class
?>

