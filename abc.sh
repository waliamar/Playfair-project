#!/bin/bash
pip install -i https://test.pypi.org/simple/ playfairwali
python - <<END
from playfair import main
END