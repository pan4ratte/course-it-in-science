<p align="center">
  <img alt="header" src="https://shieldcn.dev/header/graph.svg?title=%D0%98%D0%BD%D1%84%D0%BE%D1%80%D0%BC%D0%B0%D1%86%D0%B8%D0%BE%D0%BD%D0%BD%D1%8B%D0%B5+%D1%82%D0%B5%D1%85%D0%BD%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D0%B8+%D0%B2+%D0%BD%D0%B0%D1%83%D1%87%D0%BD%D1%8B%D1%85+%D0%B8%D1%81%D1%81%D0%BB%D0%B5%D0%B4%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F%D1%85&amp;subtitle=%D0%9E%D1%84%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9+%D1%80%D0%B5%D0%BF%D0%BE%D0%B7%D0%B8%D1%82%D0%BE%D1%80%D0%B8%D0%B9+%D0%BA%D1%83%D1%80%D1%81%D0%B0&amp;logo=false&amp;size=wide&amp;mode=dark" />
</p>

Данный репозиторий содержит в себе все файлы, на которые даны ссылки в содержании курса. Исходные лицензии всех файлов, которые не созданы мной, сохранены — см. ниже перечисление всех подобных файлов и ссылки на их авторов.

## Мои разработки

### 1. Плагины для Obsidian

| Плагин              | Установить                                                                  | Исходный код                                                        |
| ------------------- | --------------------------------------------------------------------------- | ------------------------------------------------------------------- |
| Advanced Word Count | [Obsidian Store](https://community.obsidian.md/plugins/advanced-word-count) | [GitHub](https://github.com/pan4ratte/obsidian-advanced-word-count) |
| Tags Color Files    | [Obsidian Store](https://community.obsidian.md/plugins/tags-color-files)    | [GitHub](https://github.com/pan4ratte/obsidian-tags-color-files)    |
| Regex Quick Actions | [Obsidian Store](https://community.obsidian.md/plugins/regex-quick-actions) | [GitHub](https://github.com/pan4ratte/obsidian-regex-quick-actions) |
| Publish to Telegram | [Obsidian Store](https://community.obsidian.md/plugins/publish-to-telegram) | [GitHub](https://github.com/pan4ratte/obsidian-publish-to-telegram) |
| Classy PDF Extractor | [Obsidian Store](https://community.obsidian.md/plugins/classy-pdf-extractor) | [GitHub](https://github.com/pan4ratte/obsidian-classy-pdf-extractor) |

### 2. Lua-фильтры для Pandoc

| Фильтр | Назначение |
| :----- | :--------- |
| [figures.lua](https://github.com/pan4ratte/course-it-in-science/blob/main/Obsidian/Pandoc/filters/figures.lua) | Автоматически назначает изображениям, встроенным в заметки в Obsidian, корректный стиль Word. |
| [list-styles.lua](https://github.com/pan4ratte/course-it-in-science/blob/main/Obsidian/Pandoc/filters/list-styles.lua) | Исправляет проблему Pandoc, из-за которой нумерованные и маркированные списки не получают корректный стиль Word. |
| [list-styles-old.lua](https://github.com/pan4ratte/course-it-in-science/blob/main/Obsidian/Pandoc/filters/list-styles-old.lua) | Старая версия предыдущего фильтра, работающая иначе и не так стабильно. В будущем скорее всего будет удалён. |
| [today-date.lua](https://github.com/pan4ratte/course-it-in-science/blob/main/Obsidian/Pandoc/filters/today-date.lua) | Позволяет поместить в любое место заметки `$today` и после конвертации получить сегодняшнюю дату в формате `12 December 2026`. |
| [today-date-ru.lua](https://github.com/pan4ratte/course-it-in-science/blob/main/Obsidian/Pandoc/filters/today-date-ru.lua) | Позволяет поместить в любое место заметки `$today` и после конвертации получить сегодняшнюю дату в формате `12 Декабря 2026`. |

### 3. Стили цитирования для Zotero

Набор моих собственных стилей для Zotero по ГОСТ можно скачать [со страницы проекта](https://github.com/pan4ratte/zotero-gost-styles), либо из этого репозитория, так как все стили отзеркаливаются сюда для удобства. Главная особенность стилей — проработанность деталей и широкая поддержка стандартов ГОСТ. 


## Источники файлов не моего авторства

| Файл          | Автор                                       | Исходник                                                                                                                   |
| ------------- | ------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| gost2018.csl  | Bibliostyle.ru                              | [Bibliostyle](https://bibliostyle.ru/stil-gost-7-0-100-2018-dlya-mendeley-i-zotero-style-russian-gost-r-7-0-100-2018-csl/) |
| pagebreak.lua | retorquere | [GitHub](https://github.com/retorquere/zotero-better-bibtex/blob/master/pandoc/zotero.lua)                                 |
| zotero.lua    | Jonsson B. P., Krewinkel A.                 | [GitHub](https://github.com/pandoc-ext/pagebreak?tab=readme-ov-file)                                                       |

