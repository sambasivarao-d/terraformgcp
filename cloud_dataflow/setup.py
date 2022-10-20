import setuptools
"""
This setup file is necessary for template creation, as these packages are necessary for the template creation.
"""
setuptools.setup(
    name='Dataflow Component of Processor Service',
    version='1.0',
    install_requires=['google-cloud-storage==2.5.0', 'google-cloud-core==2.3.2'],
    packages=setuptools.find_packages(),
    author='Mohit Hada',
    author_email='mohit.na@hm.com')
