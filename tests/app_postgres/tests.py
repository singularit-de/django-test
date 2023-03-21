from django.conf import settings
from django.test import TestCase


class Test(TestCase):
    databases = [settings.DB_POSTGRES]

    def test(self):
        self.assertTrue(True)
