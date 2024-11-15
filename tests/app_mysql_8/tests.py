from django.conf import settings
from django.test import TestCase


class Test(TestCase):
    databases = ['default', settings.DB_MYSQL_8]

    def test(self):
        self.assertTrue(True)
