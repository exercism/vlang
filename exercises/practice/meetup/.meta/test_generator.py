import calendar

from lib import assert_eq, v_string


def gen_case(case):
    year, month, week, weekday = case["input"].values()
    if week == "teenth":
        description = weekday.lower().removesuffix("day") + "teenth"
    else:
        description = f"{week} {weekday}"
    phrase = f"The {description} of {calendar.month_name[month]} {year}"
    expected = "/".join(str(int(part)) for part in case["expected"].split("-"))
    return assert_eq(f"date({v_string(phrase)})", v_string(expected))
