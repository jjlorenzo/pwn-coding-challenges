import argparse
import logging

from . import Timer


def entry_point():
  """
  Command-Line Interface entry-point, used when run as a script.
  """
  parser = argparse.ArgumentParser()
  parser.add_argument("-v", default=False, dest="verbose", action=argparse.BooleanOptionalAction)
  parser.add_argument("statements", nargs="+")
  args = parser.parse_args()

  logging.basicConfig(level=logging.INFO)
  logger = logging.getLogger("cprofile")
  if args.verbose:
    logger.setLevel(logging.DEBUG)
  logger.debug("code %s", args.statements)

  try:
    code = compile("\n".join(args.statements), "<cprofile-statements>", "exec")
  except SyntaxError as e:
    parser.exit(1, f"SyntaxError {e}\n")

  try:
    with Timer() as timer:
      exec(code)
  except Exception as e:
    parser.exit(2, f"{e.__class__.__name__}: {e}\n")
  else:
    logger.debug("duration %s", timer.duration_timedelta)
    print(f"Execution time: {timer.duration}")
