///|
fn leap(year : Int32) -> Bool {
  year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)
}

///|
fn month_days(year : Int32, month : Int32) -> Int32 {
  match month {
    2 => if leap(year) { 29 } else { 28 }
    4 | 6 | 9 | 11 => 30
    _ => 31
  }
}

///|
fn days_before(year : Int32) -> Int32 {
  let y = year - 1
  365 * y + y / 4 - y / 100 + y / 400
}

///|
fn decimal_at(
  text : String,
  start : Int32,
  size : Int32,
) -> Int32 raise PlistError {
  if start < 0 || size > text.length() - start {
    raise Invalid("date field truncated")
  }
  let mut n = 0
  for i = start; i < start + size; i = i + 1 {
    let c = text[i].to_int()
    if c < 48 || c > 57 {
      raise Invalid("date field is not decimal")
    }
    n = n * 10 + c - 48
  }
  n
}

///|
/// UTC whole-second XML date, returned as seconds from 2001-01-01.
pub fn parse_date(text : String) -> Double raise PlistError {
  if text.length() != 20 ||
    text[4] != 45 ||
    text[7] != 45 ||
    text[10] != 84 ||
    text[13] != 58 ||
    text[16] != 58 ||
    text[19] != 90 {
    raise Invalid("expected YYYY-MM-DDTHH:MM:SSZ")
  }
  let y = decimal_at(text, 0, 4)
  let m = decimal_at(text, 5, 2)
  let d = decimal_at(text, 8, 2)
  let h = decimal_at(text, 11, 2)
  let minute = decimal_at(text, 14, 2)
  let second = decimal_at(text, 17, 2)
  if y < 1 ||
    m < 1 ||
    m > 12 ||
    d < 1 ||
    d > month_days(y, m) ||
    h > 23 ||
    minute > 59 ||
    second > 59 {
    raise Invalid("date component out of range")
  }
  let mut days = days_before(y) - days_before(2001) + d - 1
  for month = 1; month < m; month = month + 1 {
    days += month_days(y, month)
  }
  days.to_double() * 86400.0 + (h * 3600 + minute * 60 + second).to_double()
}

///|
fn padded(n : Int32, width : Int32) -> String {
  let s = n.to_string()
  let out = StringBuilder()
  for i = s.length(); i < width; i = i + 1 {
    out.write_char('0')
  }
  out.write_string(s)
  out.to_string()
}

///|
/// Rejects fractional seconds rather than silently losing binary date precision.
pub fn format_date(seconds : Double) -> String raise PlistError {
  if seconds.is_nan() || seconds.is_inf() || seconds.floor() != seconds {
    raise Unsupported("XML date requires finite whole seconds")
  }
  let absolute = seconds + days_before(2001).to_double() * 86400.0
  if absolute < 0.0 || absolute >= days_before(10000).to_double() * 86400.0 {
    raise Unsupported("XML date year must be 0001..9999")
  }
  let days = (absolute / 86400.0).floor().to_int()
  let within = (absolute - days.to_double() * 86400.0).to_int()
  let mut lo = 1
  let mut hi = 10000
  while lo + 1 < hi {
    let mid = (lo + hi) / 2
    if days_before(mid) <= days {
      lo = mid
    } else {
      hi = mid
    }
  }
  let mut remaining = days - days_before(lo)
  let mut month = 1
  while remaining >= month_days(lo, month) {
    remaining -= month_days(lo, month)
    month += 1
  }
  padded(lo, 4) +
  "-" +
  padded(month, 2) +
  "-" +
  padded(remaining + 1, 2) +
  "T" +
  padded(within / 3600, 2) +
  ":" +
  padded(within / 60 % 60, 2) +
  ":" +
  padded(within % 60, 2) +
  "Z"
}
