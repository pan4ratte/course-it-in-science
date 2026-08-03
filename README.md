<p align="center">
  <img alt="header" src="https://shieldcn.dev/header/graph.svg?title=%D0%98%D0%BD%D1%84%D0%BE%D1%80%D0%BC%D0%B0%D1%86%D0%B8%D0%BE%D0%BD%D0%BD%D1%8B%D0%B5+%D1%82%D0%B5%D1%85%D0%BD%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D0%B8+%D0%B2+%D0%BD%D0%B0%D1%83%D1%87%D0%BD%D1%8B%D1%85+%D0%B8%D1%81%D1%81%D0%BB%D0%B5%D0%B4%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F%D1%85&amp;subtitle=%D0%9E%D1%84%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9+%D1%80%D0%B5%D0%BF%D0%BE%D0%B7%D0%B8%D1%82%D0%BE%D1%80%D0%B8%D0%B9+%D0%BA%D1%83%D1%80%D1%81%D0%B0&amp;logo=false&amp;size=wide&amp;mode=dark" />
</p>

Данный репозиторий содержит в себе все файлы, на которые даны ссылки в содержании курса. Исходные лицензии всех файлов, которые не созданы мной, сохранены — см. ниже перечисление всех подобных файлов и ссылки на их авторов.

## Мои разработки

### 1. Плагины для Obsidian

| Плагин              | Краткое описание | Установить                                                                  | Исходный код                                                        |
| ------------------- | :------- | --------------------------------------------------------------------------- | ------------------------------------------------------------------- |
| Advanced Word Count | Создание сложных и детальных счётчиков слов с пресетами, отображением с троке состояния, в боковой панели и много другого. | [Obsidian Store](https://community.obsidian.md/plugins/advanced-word-count) | [GitHub](https://github.com/pan4ratte/obsidian-advanced-word-count) |
| Tags Color Files    | Окрашивает файлы в проводнике в зависимости от тегов внутри них, согласно созданным правилам. Очень гибкие настройки отображения и фильтрации. | [Obsidian Store](https://community.obsidian.md/plugins/tags-color-files)    | [GitHub](https://github.com/pan4ratte/obsidian-tags-color-files)    |
| Regex Quick Actions | Позволяет создать библиотеку команд регулярных выражений и быстро применять их к заметкам и папкам разными способами. | [Obsidian Store](https://community.obsidian.md/plugins/regex-quick-actions) | [GitHub](https://github.com/pan4ratte/obsidian-regex-quick-actions) |
| Publish to Telegram | Публикация (и редактирование) заметок прямо в Telegram в любые чаты от лица бота или аккаунта, как с классическим, так и с Rich Text форматированием. | [Obsidian Store](https://community.obsidian.md/plugins/publish-to-telegram) | [GitHub](https://github.com/pan4ratte/obsidian-publish-to-telegram) |
| Classy PDF Extractor | Извлечение всех видов аннотаций из файлов с гибкими шаблонами оформления и гибкими настроками группировки, распределения и извлечения заметок. | [Obsidian Store](https://community.obsidian.md/plugins/classy-pdf-extractor) | [GitHub](https://github.com/pan4ratte/obsidian-classy-pdf-extractor) |

### 2. Lua-фильтры для Pandoc

Все фильтры подключаются к Pandoc через `--lua-filter=имя-фильтра.lua`, а фильтры, которые работают со стилями Word, требуют ещё и референсного файла (шаблона оформления): `--reference-doc=reference-gost-14.docx`. Нужные стили должны существовать в этом файле, причём совпадать должны именно *названия* стилей, а не их идентификаторы.

| Фильтр | Назначение | Что нужно для работы |
| :----- | :--------- | :------------------- |
| [figures.lua](https://github.com/pan4ratte/course-it-in-science/blob/main/Obsidian/Pandoc/filters/figures.lua) | Назначает изображениям *без* подписи, встроенным в заметки в Obsidian, корректный стиль Word. | Стиль абзаца `Figure` в референсном файле (создаётся автоматически при генерации файла). |
| [list-styles.lua](https://github.com/pan4ratte/course-it-in-science/blob/main/Obsidian/Pandoc/filters/list-styles.lua) | Исправляет проблему Pandoc, из-за которой нумерованные и маркированные списки не получают корректный стиль Word. | Стили абзаца `List Bullet` и `List Number` с уровнями до 6 включительно (`List Bullet 2`, `List Bullet 3` и т.д.). В Word такие стили уже встроены, просто обновите их оформление под свои нужды. |
| [table-styles.lua](https://github.com/pan4ratte/course-it-in-science/blob/main/Obsidian/Pandoc/filters/table-styles.lua) | Исправляет проблему, из-за которой Pandoc принудительно назначает тексту в таблицах стиль `Compact`, перебивая тем самым оформление стиля таблицы. | Стиль абзаца `Table Text` в референсном файле (если название другое — укажите `table-text-style` в метаданных при экспорте). В этом стиле не нужно задавать шрифт, размер и полужирность: они должны остаться за стилем таблицы, а сам стиль абзаца стоит использовать только для отступов, интервалов и выравнивания. Ячейки шапки по умолчанию получают тот же стиль; чтобы оформить их отдельно, укажите название стиля в `table-head-style`. |
| [table-verbatim.lua](https://github.com/pan4ratte/course-it-in-science/blob/main/Obsidian/Pandoc/filters/table-verbatim.lua) | Позволяет использовать стиль формления `кода` внутри таблиц: Pandoc жёстко назначает такому тексту стиль `VerbatimChar`, из-за чего размер кода в ячейках не подстроить под таблицу. | Стиль `Table Verbatim` в референсном файле, причём обязательно **знаковый** (символьный), а не стиль абзаца — иначе он не может применяться к фрагменту текста и будет проигнорирован. Другое название задаётся через `table-verbatim-style`. |
| [table-spacing.lua](https://github.com/pan4ratte/course-it-in-science/blob/main/Obsidian/Pandoc/filters/table-spacing.lua) | Добавляет отступы 12 пт до и после таблиц, так как в Word отступы у таблиц не настраиваются вообще. | Специальных требований нет. |
| [today-date.lua](https://github.com/pan4ratte/course-it-in-science/blob/main/Obsidian/Pandoc/filters/today-date.lua) | Позволяет поместить в любое место заметки `$today` и после конвертации получить сегодняшнюю дату в формате `December 12, 2026`. | Специальных требований нет. |
| [today-date-ru.lua](https://github.com/pan4ratte/course-it-in-science/blob/main/Obsidian/Pandoc/filters/today-date-ru.lua) | Позволяет поместить в любое место заметки `$today` и после конвертации получить сегодняшнюю дату в формате `12 декабря 2026 г.`. | Специальных требований нет. |
| [keywords.lua](https://github.com/pan4ratte/course-it-in-science/blob/main/Obsidian/Pandoc/filters/keywords.lua) | Позволяет копировать ключевые слова, заполненные в свойстве `keywords`, в тело документа — они автоматически помещаются сразу после аннотации.  | Специальных требований нет. При этом, по умолчанию выводится заголовок `Keywords:`. Чтобы изменить его, создайте и заполните свойство `keywords-title` любым текстом. |

### 3. Стили цитирования для Zotero

Набор моих собственных стилей для Zotero по ГОСТ можно скачать [со страницы проекта](https://github.com/pan4ratte/zotero-gost-styles), либо из этого репозитория, так как все стили отзеркаливаются сюда для удобства. Главная особенность стилей — проработанность деталей и широкая поддержка стандартов ГОСТ. 


## Источники файлов не моего авторства

| Файл          | Автор                                       | Исходник                                                                                                                   |
| ------------- | ------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| gost2018.csl  | Bibliostyle.ru                              | [Bibliostyle](https://bibliostyle.ru/stil-gost-7-0-100-2018-dlya-mendeley-i-zotero-style-russian-gost-r-7-0-100-2018-csl/) |
| pagebreak.lua | retorquere | [GitHub](https://github.com/retorquere/zotero-better-bibtex/blob/master/pandoc/zotero.lua)                                 |
| zotero.lua    | Jonsson B. P., Krewinkel A.                 | [GitHub](https://github.com/pandoc-ext/pagebreak?tab=readme-ov-file)                                                       |

