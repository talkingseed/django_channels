cd
python3.8 -m venv .
source bin/activate
pip -V
pip install --upgrade pip
pip install django channels channels-redis mysqlclient djangorestframework pyyaml uritemplate django-cors-headers
pip install uvicorn nltk numpy pytesseract uwsgi
git clone kindofparadox
cd kindofparadox/my_auth/frontend
npm install
npm run mybuild
cd ../..
./manage.py collectstatic