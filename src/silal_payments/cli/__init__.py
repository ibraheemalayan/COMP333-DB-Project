from flask import Blueprint, current_app

cli_bp = Blueprint("cli", __name__)


@cli_bp.cli.command("init-db")
def init_db():
    from silal.db_mig import initialize_db


@cli_bp.cli.command("db-fill")
def init_db():
    from silal.db_mig import fill_defaults_and_fake


@cli_bp.cli.command("drop-db")
def drop_db():

    from sqlalchemy.schema import DropTable
    from sqlalchemy.ext.compiler import compiles

    # add cascades
    @compiles(DropTable, "postgresql")
    def _compile_drop_table(element, compiler, **kwargs):
        return compiler.visit_drop_table(element) + " CASCADE"

    print("\n❕ Dropping Database ...")

    from silal import db

    db.drop_all()
    db.session.commit()

    db.engine.execute("DROP TABLE IF EXISTS alembic_version;")

    print("\n✅ Database was dropped successfully\n")


@cli_bp.cli.command("clear-solr")
def drop_db():

    from silal import solr_listing_client, solr_images_client

    solr_listing_client.delete(q="*:*")
    solr_images_client.delete(q="*:*")

    print("\n✅ Solr was cleared successfully\n")


@cli_bp.cli.command("fake-fill-db")
def fake_fill_db():
    from silal.db_mig import fill_defaults
    from silal.db_mig import fake_fill_db


@cli_bp.cli.command("init-db-w-sample-data")
# def init_db_with_sample_data():
#     from silal.db_mig import initialize_db
#     from silal.db_mig import fake_fill_db


# TODO Never make this runnable in production
@cli_bp.cli.command("reset-db-w-sample-data")
def init_db_with_sample_data():

    if not current_app.debug:
        raise Exception("Seriously !")

    print("\n❕ Reseting Database ...")

    from silal import db

    db.drop_all()
    db.session.commit()

    db.engine.execute("DROP TABLE IF EXISTS alembic_version;")

    print("✅ Database was droped successfully")

    import silal.models

    from silal.db_mig import initialize_db
    from silal.db_mig import fake_fill_db
