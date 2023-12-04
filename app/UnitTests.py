import unittest
from flask import Flask
from app import app, db, migrate
from models import Book, Genre, Book_Genre
from flask_testing import TestCase

class AppTestCase(unittest.TestCase):
    def setUp(self):
        app.config['TESTING'] = True
        app.config.from_pyfile('config.py')
        self.app = app.test_client()
        with app.app_context():
            db.create_all()
            migrate.init_app(app, db)

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

    def test_new_book_route(self):
        response = self.app.get('/book/new')
        self.assertEqual(response.status_code, 302)

    def test_error_route(self):
        response = self.app.get('/error_route')
        self.assertEqual(response.status_code, 404)
    
if __name__ == '__main__':
    unittest.main()
