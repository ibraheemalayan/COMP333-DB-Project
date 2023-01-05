import sys, os

print("\n\nRunning WSGI\n\n")

sys.path.insert(0, ".")

from silal_payments import create_app

application = create_app()

application.debug = True

# if __name__ == "__main__":
#     application.run(load_dotenv=True)
