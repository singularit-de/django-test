from django.conf import settings

from tests.base_db_router import BaseDBRouter


class DBRouter(BaseDBRouter):
    route_app_labels = {"app_postgres_16"}
    db = settings.DB_POSTGRES_16
