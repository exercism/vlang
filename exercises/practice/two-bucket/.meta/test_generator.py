from lib import INDENT, assert_error, assert_some, dashed_test_name, is_error, v_int


def test_name(case):
    return dashed_test_name(case)


def bucket(name):
    return f"BucketId.{name}"


def gen_case(case):
    inputs = case["input"]
    arguments = [
        v_int(inputs["bucketOne"]),
        v_int(inputs["bucketTwo"]),
        v_int(inputs["goal"]),
        bucket(inputs["startBucket"]),
    ]
    call = f"measure({', '.join(arguments)})"
    expected = case["expected"]
    if is_error(expected):
        return assert_error(call, case)
    return [
        "expected := Solution{",
        f"{INDENT}moves:        {v_int(expected['moves'])}",
        f"{INDENT}goal_bucket:  {bucket(expected['goalBucket'])}",
        f"{INDENT}other_bucket: {v_int(expected['otherBucket'])}",
        "}",
        assert_some(call, "expected", f"{call} should not return an error"),
    ]
