module main

fn test_1_is_i() {
	assert roman(1) == 'I'
}

fn test_2_is_ii() {
	assert roman(2) == 'II'
}

fn test_3_is_iii() {
	assert roman(3) == 'III'
}

fn test_4_is_iv() {
	assert roman(4) == 'IV'
}

fn test_5_is_v() {
	assert roman(5) == 'V'
}

fn test_6_is_vi() {
	assert roman(6) == 'VI'
}

fn test_9_is_ix() {
	assert roman(9) == 'IX'
}

fn test_16_is_xvi() {
	assert roman(16) == 'XVI'
}

fn test_27_is_xxvii() {
	assert roman(27) == 'XXVII'
}

fn test_48_is_xlviii() {
	assert roman(48) == 'XLVIII'
}

fn test_49_is_xlix() {
	assert roman(49) == 'XLIX'
}

fn test_59_is_lix() {
	assert roman(59) == 'LIX'
}

fn test_66_is_lxvi() {
	assert roman(66) == 'LXVI'
}

fn test_93_is_xciii() {
	assert roman(93) == 'XCIII'
}

fn test_141_is_cxli() {
	assert roman(141) == 'CXLI'
}

fn test_163_is_clxiii() {
	assert roman(163) == 'CLXIII'
}

fn test_166_is_clxvi() {
	assert roman(166) == 'CLXVI'
}

fn test_402_is_cdii() {
	assert roman(402) == 'CDII'
}

fn test_575_is_dlxxv() {
	assert roman(575) == 'DLXXV'
}

fn test_666_is_dclxvi() {
	assert roman(666) == 'DCLXVI'
}

fn test_911_is_cmxi() {
	assert roman(911) == 'CMXI'
}

fn test_1024_is_mxxiv() {
	assert roman(1024) == 'MXXIV'
}

fn test_1666_is_mdclxvi() {
	assert roman(1666) == 'MDCLXVI'
}

fn test_3000_is_mmm() {
	assert roman(3000) == 'MMM'
}

fn test_3001_is_mmmi() {
	assert roman(3001) == 'MMMI'
}

fn test_3888_is_mmmdccclxxxviii() {
	assert roman(3888) == 'MMMDCCCLXXXVIII'
}

fn test_3999_is_mmmcmxcix() {
	assert roman(3999) == 'MMMCMXCIX'
}
