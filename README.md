# django_channels
Repository should work both for WSL Ubuntu 20 and for Docker (based on linux Python3.8 image)
Ubuntu 18 might need redis or uwsgi installation and configuration workarounds.
Main idea is to use Django for ORM, API, admin panel

## Next:
- Nginx settings to safely redirect to https
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
- Docker Redis connect to RedisInsight? It looks like Reddis immediately goes offline. Their standard package doesn't do it, so maybe separate container is a way to go.
- What is the difference in one for all Docker vs. each for every in one (like: nginx, django, redis)
- Entity versions (or events)
- Caching https://www.nginx.com/blog/maximizing-python-performance-with-nginx-parti-web-serving-and-caching/
- Access to/sharing with Docker volumes

## Technical debt:
- SSL certificates for unicorn in git folder
- Not clear on mobile keys and authentication
- figure out which shell should run nginx and redis
- .env and .env_docker, .onload and .onload_docker -- have to be maintained in parallel, which is error prone
- process manager for uvicorn in case it decides to drop out once in a while