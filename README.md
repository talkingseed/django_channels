# django_channels
Repository should work both for WSL Ubuntu 20 and for Docker (based on linux Python3.8 image)
Ubuntu 18 might need redis or uwsgi installation and configuration workarounds.
Main idea is to use Django for ORM, API, admin panel

## Next:
- Outside mysql
- React front end, normalized data on front end (db, state, routing?)
- Admin: admin, users, anonymous users, chat rooms
- API docs generation
- Tests
- Authentication, including social
- Mail integration (salesforce?)
- Chat
- Resume, Portfolio, Blog with comments option
- Social sharing and permalinks
- Long background processes with socket support: progress bars -- uploads, downloads, rendering
- Infinite slideshow

## Questions:
- Docker Redis connect to RedisInsight?
- What is the difference in one for all Docker vs. each for every in one (like: nginx, django, redis)
- Entity versions (or events)
- Caching
- Access to/sharing with Docker volumes