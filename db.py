import sqlite3

from flask import g

_DATABASE = "mugsy"


def bootstrap_data(app):
    with app.app_context():
        db = get_db()
        with app.open_resource("db/schema.sql", mode="r") as f:
            db.cursor().executescript(f.read())
        db.commit()


def init_db(app):
    with app.app_context():
        db = get_db()
        with app.open_resource(f"db/schema.sql", mode="r") as f:
            db.cursor().executescript(f.read())
        db.commit()


def get_db():
    db = getattr(g, "_database", None)
    if db is None:
        db = g._database = sqlite3.connect(f"db/{_DATABASE}.db")
    return db


def close_connection():
    db = getattr(g, "_database", None)
    if db is not None:
        db.close()


def _init_db():
    conn = None
    try:
        conn = sqlite3.connect(f"db/{_DATABASE}.db")
        with open(f"db/schema.sql", "r") as f:
            conn.executescript(f.read())
        print("Created sqlite database and schema.")
    except sqlite3.Error as e:
        print(e)
    finally:
        if conn:
            conn.close()


if __name__ == "__main__":
    _init_db()
