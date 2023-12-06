import logging
from pathlib import Path
import random
import time

log_file = Path(__file__).parent / "build.log"
log_file.unlink(missing_ok=True)

logging.basicConfig(filename=log_file, level=logging.INFO)

for i in range(1, 101):
    if random.choice([True, False]):
        logging.info("DeprecationWarning: The module 'your_life' is no longer maintained")

    logging.info(f"[{i}/100] Building...")
    time.sleep(2)

else:
    logging.info("Build completed")
