
from typing import Any


def WPSClassFactory(iface: 'WPSServerInterface') -> Any:
    """ Load GeoVit
    """
    from algorithms.TestAlgorithmProvider import  TestAlgorithmProvider

    iface.registerProvider(TestAlgorithmProvider())

