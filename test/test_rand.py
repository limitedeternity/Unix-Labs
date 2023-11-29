from hypothesis import given, strategies as st, note
from utils import *


@given(st.text("abcdefghijklmnopqrstuvwxyz", min_size=1, max_size=20))
def test_simple(filename):
    p = TMP_DIR.joinpath(filename)

    try:
        res, outp, err = run_command([f'{SRC_DIR}/rand.sh', p])

        note(str((res, outp, err)))

        assert res == 0
        assert outp == ''

        assert p.is_file()

    finally:
        p.unlink(missing_ok=True)
