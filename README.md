# django_channels
Repository should work both for WSL Ubuntu 20 and for Docker (based on linux Python3.8 image)
Ubuntu 18 might need redis or uwsgi installation and configuration workarounds.
Main idea is to use Django for ORM, API, admin panel

## Next:
- Swagger paths are not generated right, missed prefixes
- Docker flow with React front end made locally and copied into Docker container to test
- Nginx settings to safely redirect to https (and from err URLs to back/home)
- render Swagger(Open API) for developing React locally
- React front end, normalized data on front end (db, state, routing?)
- Tests
- Authentication, including social
- Mail integration (salesforce?)
- Chat
- Resume, Portfolio, Blog with comments option
- Social sharing and permalinks
- Long background processes with socket support: progress bars -- uploads, downloads, rendering
- Infinite slideshow

## Questions:
- What is the difference between Basic and Session Authentication?
- Turn on Bash Smart Completion
- Docker Redis connect to RedisInsight? It looks like Reddis immediately goes offline. Their standard package doesn't do it, so maybe separate container is a way to go.
- What is the difference in one for all Docker vs. each for every in one (like: nginx, django, redis)
- Entity versions (or events)
- Caching https://www.nginx.com/blog/maximizing-python-performance-with-nginx-parti-web-serving-and-caching/
- Access to/sharing with Docker volumes

## Technical debt:
- DRF UI has to be disabled for production (and remove the need for "content-type": 'application/json' header)
  with Session and Basic Authentication enabled in settings of the REST_FRAMEWORK
- clean auto-generated React folders
- npm i for Docker
- SSL certificates for unicorn in git folder
- Not clear on mobile keys and authentication
- figure out which shell should run nginx and redis
- .env and .env_docker, .onload and .onload_docker -- have to be maintained in parallel, which is error prone
- process manager for uvicorn in case it decides to drop out once in a while
- CORS_ORIGIN_ALLOW_ALL = True in settings might not be the best, disable on deploy
- API dj_rest_auth and allauth looks like overkill in general. Also probobly should be separated into the app, not in "chat". And Admin probably too, so it would be easier to completely disable/enable it. 
- If JWT authentication, the way to recall the token like on logout/pass change needed (blacklisting?)