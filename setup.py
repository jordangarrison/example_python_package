import os
from setuptools import setup, find_packages

setup(
    name='example-python-package',
    version=open(os.path.join(os.path.dirname(__file__), "VERSION")).read().strip(),
    packages=find_packages(),
    author="Jordan Garrision",
    author_email="jordan.garrison@flosports.tv",
    description="This is an example python project which you can install with pip",
    url="https://github.com/jordanagarrison/example-python-package",
    package_data={
        # Include any packages inside of *.txt, *.rst, and *.md files
        "": ["*.txt", "*.rst", "*.md"]
    },
    entry_points={
        "console_scripts": ["guassian-number=example.cli.cli:guass"]
    },
    long_description=open("README.md").read(),
    keywords="example python pip guass"
)
