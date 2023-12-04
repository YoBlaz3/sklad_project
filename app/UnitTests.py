import unittest
from flask import Flask
from app import app, db, migrate

class AppTestCase(unittest.TestCase):
    def setUp(self):
        app.config['TESTING'] = True
        app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///:memory:'
        self.app = app.test_client()
        with app.app_context():
            db.create_all()
            migrate.init_app(app, db)

    def tearDown(self):
        with app.app_context():
            db.session.remove()
            db.drop_all()

    def test_index_route(self):
        response = self.app.get('/')
        self.assertEqual(response.status_code, 200)

    def test_popular_books_route(self):
        response = self.app.get('/popular_books')
        self.assertEqual(response.status_code, 200)

    def test_last_visits_route(self):
        response = self.app.get('/last_visits')
        self.assertEqual(response.status_code, 200)

    def test_journal_route_authenticated(self):
        with app.test_request_context('/journal'):
            app.preprocess_request()
            response = app.full_dispatch_request()
            self.assertEqual(response.status_code, 302)  # Должно перенаправлять на страницу входа при отсутствии аутентификации

    def test_journal_route_unauthenticated(self):
        response = self.app.get('/journal')
        self.assertEqual(response.status_code, 302)  # Должно перенаправлять на страницу входа при отсутствии аутентификации

if __name__ == '__main__':
    unittest.main()
