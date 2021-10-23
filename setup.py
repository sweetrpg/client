from setuptools import setup

# Metadata goes in setup.cfg. These are here for GitHub's dependency graph.
setup(
    name="sweetrpg-sdk",
    install_requires=["marshmallow==3.13", "sweetrpg-model-core"],
    extras_require={},
)
