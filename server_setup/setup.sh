cd
python3.8 -m venv .
source bin/activate
pip -V
pip install --upgrade pip
pip install django channels channels-redis mysqlclient djangorestframework pyyaml uritemplate django-cors-headers
pip install uvicorn nltk numpy pytesseract uwsgi
