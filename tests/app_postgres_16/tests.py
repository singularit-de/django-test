from django.conf import settings
from django.test import TestCase


class Test(TestCase):
    databases = ['default', settings.DB_POSTGRES_16]

    def test(self):
        self.assertTrue(True)
