# inetweb

## Архитектура приложения

``` plain
lib/
├── core/
│   ├── di/                    # Dependency Injection (get_it)
│   ├── router/                # GoRouter навигация
│   └── theme/                 # Цвета, типографика
│
├── data/
│   ├── datasources/           # HTTP клиенты, парсеры
│   ├── repositories/          # Реализации репозиториев
│   └── models/                # JSON модели (freezed)
│
├── domain/
│   ├── entities/              # Чистые сущности
│   ├── repositories/          # Абстракции
│   └── usecases/              # Бизнес-логика
│
├── presentation/
│   ├── graph/                 # Flame граф (главный экран)
│   ├── sidebar/               # Панель деталей ноды
│   ├── search/                # Ввод URL
│   └── widgets/               # Общие UI компоненты
│
└── flame_graph/               # Отдельный слой Flame
    ├── components/            # NodeComponent, EdgeComponent
    ├── graph_game.dart        # FlameGame
    └── layout/                # Алгоритм расположения нод
```
