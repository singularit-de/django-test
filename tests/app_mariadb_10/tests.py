from django.conf import settings
from django.test import TestCase


class Test(TestCase):
    databases = ['default', settings.DB_MARIADB_10]

    def test(self):
        self.assertTrue(True)
