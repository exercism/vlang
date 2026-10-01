from lib import assert_eq, v_array, v_int, v_string


def gen_case(case):
    if case["property"] == "colors":
        return assert_eq("colors", v_array(case["expected"]))
    color = v_string(case["input"]["color"])
    return assert_eq(f"color_code({color})", v_int(case["expected"]))
