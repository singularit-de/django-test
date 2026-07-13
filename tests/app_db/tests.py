from django.conf import settings
from django.test import TestCase


class Test(TestCase):
    databases = ['default', settings.DB_UNDER_TEST]

    def test(self):
        self.assertTrue(True)
