import warnings


class BaseDBRouter:
    route_app_labels = {}
    db = None

    def __init__(self):
        if self.route_app_labels is None:
            warnings.warn(f"Router {self.__class__.__name__}: {self.route_app_labels}")
        if self.db is None:
            warnings.warn(f"Router {self.__class__.__name__}: {self.db}")

    def db_for_read(self, model, **hints):
        if model._meta.app_label in self.route_app_labels:
            return self.db
        return None

    def db_for_write(self, model, **hints):
        if model._meta.app_label in self.route_app_labels:
            return self.db
        return None

    def allow_relation(self, obj1, obj2, **hints):
        if (
                obj1._meta.app_label in self.route_app_labels or
                obj2._meta.app_label in self.route_app_labels
        ):
            return True
        return None

    def allow_migrate(self, db, app_label, model_name=None, **hints):
        if db == self.db:
            return app_label in self.route_app_labels
        return None
