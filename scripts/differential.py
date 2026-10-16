"""Deterministic Python plistlib <-> MoonPlist differential gate, no downloads.
Generated cases are synthetic, not upstream test data. Python >=3.8, Node + moon.
"""
import datetime as dt
import json
import math
from pathlib import Path
import plistlib
import random
import subprocess

ROOT = Path(__file__).resolve().parents[1]
rng = random.Random(601016)
epoch = dt.datetime(2001, 1, 1)


def mb(v):
    if v is None:
        return '@moonplist.Null'
    if isinstance(v, bool):
        return '@moonplist.Boolean(' + str(v).lower() + ')'
    if isinstance(v, plistlib.UID):
        return '@moonplist.Uid(%dUL)' % v.data
    if isinstance(v, int):
        return '@moonplist.%s(%d%s)' % ('Integer' if v < 2**63 else 'Unsigned', v, 'L' if v < 2**63 else 'UL')
    if isinstance(v, float):
        return '@moonplist.Real(%s)' % repr(v)
    if isinstance(v, str):
        return '@moonplist.Text(%s)' % json.dumps(v, ensure_ascii=False)
    if isinstance(v, bytes):
        return '@moonplist.Data(@moonplist.decode_hex("%s"))' % v.hex()
    if isinstance(v, dt.datetime):
        return '@moonplist.Date(%s)' % (v - epoch).total_seconds()
    if isinstance(v, list):
        return '@moonplist.List([' + ','.join(map(mb, v)) + '])'
    return '@moonplist.Dict([' + ','.join('(%s,%s)' % (json.dumps(k), mb(x)) for k, x in v.items()) + '])'


def random_value(depth=0):
    if depth < 3:
        t = rng.randrange(9)
        if t == 7:
            return [random_value(depth+1) for _ in range(rng.randrange(5))]
        if t == 8:
            return {'k%d' % i: random_value(depth+1) for i in range(rng.randrange(5))}
    else:
        t = rng.randrange(7)
    return [rng.randrange(-2**63, 2**64), rng.random()*100-50,
            '汉字🍎 <&>\r\n' + str(rng.randrange(1000)),
            bytes(rng.randrange(256) for _ in range(rng.randrange(35))),
            bool(rng.randrange(2)), dt.datetime(2024,2,29,12,30,59), ''][t]


values = [-2**63, -1, 0, 255, 256, 2**31, 2**63-1, 2**63, 2**64-1,
          0.0, -0.0, 1.25, True, False, '', '汉🍎<&>\r\n', bytes(range(256)),
          epoch, dt.datetime(1900,1,1), [], {}, list(range(300))]
values += [random_value() for _ in range(70)]
cases = [(v, fmt) for v in values for fmt in ('Binary', 'Xml')]
cases += [(v, 'Binary') for v in (None, plistlib.UID(0), plistlib.UID(2**64-1), epoch+dt.timedelta(microseconds=500000))]
lines = ['///|', 'fn main {', '  try {']
for i, (value, fmt) in enumerate(cases):
    data = plistlib.dumps(value, fmt=getattr(plistlib, 'FMT_'+fmt.upper()), sort_keys=False)
    lines += ['    {', '      let expected = '+mb(value),
              '      let decoded = @moonplist.decode(@moonplist.decode_hex("%s"))' % data.hex(),
              '      assert_true(@moonplist.equivalent(%s, decoded))' % mb(plistlib.loads(data)),
              '      println("CASE:%d:" + @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.%s)))' % (i, fmt), '    }']
lines += ['  } catch { _ => abort("interop assertion or codec failure") }', '}']
(ROOT/'examples/interop/main.mbt').write_text('\n'.join(lines)+'\n', encoding='utf8')
subprocess.run(['moon', 'fmt'], cwd=ROOT, check=True)
p = subprocess.run(['moon', 'run', 'examples/interop', '--target', 'js'], cwd=ROOT, capture_output=True, text=True, encoding='utf8')
if p.returncode:
    raise SystemExit(p.stdout + p.stderr)
observed = {}
for line in p.stdout.splitlines():
    if line.startswith('CASE:'):
        _, n, hexdata = line.split(':', 2)
        observed[int(n)] = plistlib.loads(bytes.fromhex(hexdata))
assert len(observed) == len(cases), (len(observed), len(cases))
for i, (expected, _) in enumerate(cases):
    actual = observed[i]
    assert actual == expected, (i, actual, expected)
    if isinstance(expected, float) and expected == 0:
        assert math.copysign(1, actual) == math.copysign(1, expected)
print(json.dumps({'seed':601016, 'cases':len(cases), 'python_to_moon':len(cases), 'moon_to_python':len(cases), 'passed':True}))


