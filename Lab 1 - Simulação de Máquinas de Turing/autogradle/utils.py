from pathlib import Path
import subprocess


SUBMISSION_PATH = Path('./submission')
AUTOGRADLE_PATH = Path('./autogradle')
TEMP_PATH = Path("/tmp")


def mvn_cli(arguments: list[str], output_filepath: str | Path):
    command = ["./mvn-cli"] + arguments
    with open(output_filepath, "w", encoding="utf8") as output_file:
        subprocess.run(command, check=True, stdout=output_file)


def execute(*subroutines: Path) -> Path:
    for subroutine in subroutines:
        mvn_cli(f"assemble -i {subroutine}".split(), f"{TEMP_PATH / subroutine.stem}.int")

    link_arguments = []
    for subroutine in subroutines:
        link_arguments.append("-i")
        link_arguments.append(f"{TEMP_PATH / subroutine.stem}.int")
    link_arguments.insert(0, "link")
    link_arguments.append("--complete")

    linked_path = TEMP_PATH / 'program.lig'
    mvn_cli(link_arguments, linked_path)

    executable_path = TEMP_PATH / 'program.mvn'
    mvn_cli(f"relocate -i {TEMP_PATH / 'program.mvn'} --base 0".split(), executable_path)

    return executable_path


def run_mvn(inputs: list[str]):
    p = subprocess.run(
        [
            "python",
            "-m",
            "MVN.mvnMonitor"
        ],
        input='\n'.join(inputs),
        capture_output=True,
        text=True,
        check=True,
    )
    return p.stdout
