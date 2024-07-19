from tempfile import NamedTemporaryFile
from utils import execute, run_mvn, SUBMISSION_PATH, AUTOGRADLE_PATH

def test_len():
    test_path = AUTOGRADLE_PATH / 'test_len.asm'
    lib_path = SUBMISSION_PATH / 'string.asm'
    executable_path = execute(test_path, lib_path)
    

    with NamedTemporaryFile("r") as mem_file:
        run_mvn([
                f"p {executable_path}",
                "r", "0", "n",
                f"m 100 101 {mem_file.name}",
                "x",
            ])
        mem_out = mem_file.read()

    assert mem_out.strip() == "0100:  00  00", "O teste não funciona"

def test_cmp():
    test_path = AUTOGRADLE_PATH / 'test_cmp.asm'
    lib_path = SUBMISSION_PATH / 'string.asm'
    executable_path = execute(test_path, lib_path)
    

    with NamedTemporaryFile("r") as mem_file:
        run_mvn([
                f"p {executable_path}",
                "r", "0", "n",
                f"m 100 101 {mem_file.name}",
                "x",
            ])
        mem_out = mem_file.read()

    assert mem_out.strip() == "0100:  00  00", "O teste não funciona"
