#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <dlfcn.h>

static NSString * const kKeyActiveCode = @"ActiveAuthCode";
static NSString * const kKeyActiveDevice = @"ActiveAuthDevice";
static NSString * const kKeyActivationTime = @"ActiveAuthTime";
static NSString * const kKeyCodeType = @"ActiveCodeType";

static NSArray *getAuthDatabase() {
    static NSArray *database = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        database = @[
            // ===== 魔女之夜 日卡 (100) =====
            @{@"code": @"DAY-0CVZ3-D0HTJ", @"type": @"日卡"}, @{@"code": @"DAY-0KRJ3-TZTKH", @"type": @"日卡"}, @{@"code": @"DAY-13MRT-OT65E", @"type": @"日卡"}, @{@"code": @"DAY-14KVG-VJACJ", @"type": @"日卡"}, @{@"code": @"DAY-1DBLX-TQ6WH", @"type": @"日卡"}, @{@"code": @"DAY-1N7NB-5GNSH", @"type": @"日卡"}, @{@"code": @"DAY-1T7PX-UK80C", @"type": @"日卡"}, @{@"code": @"DAY-2E7V8-ASU92", @"type": @"日卡"}, @{@"code": @"DAY-36JMB-BBMJA", @"type": @"日卡"}, @{@"code": @"DAY-3DWN9-C8BHU", @"type": @"日卡"},
            @{@"code": @"DAY-46C2G-OSLVU", @"type": @"日卡"}, @{@"code": @"DAY-4FMJS-K0PQP", @"type": @"日卡"}, @{@"code": @"DAY-4KZ68-NQQ3H", @"type": @"日卡"}, @{@"code": @"DAY-4UVQ0-19WI3", @"type": @"日卡"}, @{@"code": @"DAY-4VW9G-T2WFP", @"type": @"日卡"}, @{@"code": @"DAY-6DGRQ-3OE24", @"type": @"日卡"}, @{@"code": @"DAY-6RRY9-IM7X4", @"type": @"日卡"}, @{@"code": @"DAY-6ZGGU-ORLKV", @"type": @"日卡"}, @{@"code": @"DAY-75WSR-41QGI", @"type": @"日卡"}, @{@"code": @"DAY-77W4B-9ONCN", @"type": @"日卡"},
            @{@"code": @"DAY-7JSOG-51KBY", @"type": @"日卡"}, @{@"code": @"DAY-7OIMR-HTX3C", @"type": @"日卡"}, @{@"code": @"DAY-87DG1-87TJ2", @"type": @"日卡"}, @{@"code": @"DAY-89CL8-JV7HC", @"type": @"日卡"}, @{@"code": @"DAY-8DZ7K-PMPL2", @"type": @"日卡"}, @{@"code": @"DAY-8HEIX-4PZ7H", @"type": @"日卡"}, @{@"code": @"DAY-8RF6Z-I94VA", @"type": @"日卡"}, @{@"code": @"DAY-9Z0PZ-I2X5D", @"type": @"日卡"}, @{@"code": @"DAY-AFCCT-7S9TT", @"type": @"日卡"}, @{@"code": @"DAY-AM6MF-IIU8Y", @"type": @"日卡"},
            @{@"code": @"DAY-ANQEN-ZN9SD", @"type": @"日卡"}, @{@"code": @"DAY-AOHKD-4ZDKE", @"type": @"日卡"}, @{@"code": @"DAY-B9FJA-XXOPY", @"type": @"日卡"}, @{@"code": @"DAY-BYNBR-WESUX", @"type": @"日卡"}, @{@"code": @"DAY-CDY3Q-9NYZJ", @"type": @"日卡"}, @{@"code": @"DAY-DC5A0-PNJ3Y", @"type": @"日卡"}, @{@"code": @"DAY-EJDV8-44ACV", @"type": @"日卡"}, @{@"code": @"DAY-EO7KW-P2TR0", @"type": @"日卡"}, @{@"code": @"DAY-EPXBP-4RIEX", @"type": @"日卡"}, @{@"code": @"DAY-ESQF3-RCY1Q", @"type": @"日卡"},
            @{@"code": @"DAY-EY1OX-LFRR8", @"type": @"日卡"}, @{@"code": @"DAY-F4QQ6-NX8ZW", @"type": @"日卡"}, @{@"code": @"DAY-FR83R-500BN", @"type": @"日卡"}, @{@"code": @"DAY-FU666-QKZ7W", @"type": @"日卡"}, @{@"code": @"DAY-GEERI-OCORG", @"type": @"日卡"}, @{@"code": @"DAY-GFNLQ-0NL5W", @"type": @"日卡"}, @{@"code": @"DAY-GH3R4-5UASB", @"type": @"日卡"}, @{@"code": @"DAY-GOTM8-QY3OU", @"type": @"日卡"}, @{@"code": @"DAY-GSLX8-DY94K", @"type": @"日卡"}, @{@"code": @"DAY-HD174-VC0EF", @"type": @"日卡"},
            @{@"code": @"DAY-HL35K-6G9IP", @"type": @"日卡"}, @{@"code": @"DAY-II013-237DS", @"type": @"日卡"}, @{@"code": @"DAY-IT9EJ-A3UIY", @"type": @"日卡"}, @{@"code": @"DAY-ITHOE-WWQCV", @"type": @"日卡"}, @{@"code": @"DAY-K7F7G-HCH71", @"type": @"日卡"}, @{@"code": @"DAY-KHID4-XFF1V", @"type": @"日卡"}, @{@"code": @"DAY-KJV7A-ILWWL", @"type": @"日卡"}, @{@"code": @"DAY-KQMF9-4BTI8", @"type": @"日卡"}, @{@"code": @"DAY-LD3XS-WR0GD", @"type": @"日卡"}, @{@"code": @"DAY-MCSR3-RWV0H", @"type": @"日卡"},
            @{@"code": @"DAY-NBYS2-4W7FU", @"type": @"日卡"}, @{@"code": @"DAY-O0IIG-W2LSQ", @"type": @"日卡"}, @{@"code": @"DAY-O0K7I-MF5VN", @"type": @"日卡"}, @{@"code": @"DAY-O6YWY-MPLOG", @"type": @"日卡"}, @{@"code": @"DAY-OEYJK-4T8HY", @"type": @"日卡"}, @{@"code": @"DAY-OHKUZ-4346Q", @"type": @"日卡"}, @{@"code": @"DAY-OLIL6-XOIK9", @"type": @"日卡"}, @{@"code": @"DAY-PF44B-B7TRD", @"type": @"日卡"}, @{@"code": @"DAY-PKD62-AVXFG", @"type": @"日卡"}, @{@"code": @"DAY-Q5LS6-UMHCC", @"type": @"日卡"},
            @{@"code": @"DAY-QGIU7-1M786", @"type": @"日卡"}, @{@"code": @"DAY-QJC2L-8FM2Q", @"type": @"日卡"}, @{@"code": @"DAY-R1C26-I7H9L", @"type": @"日卡"}, @{@"code": @"DAY-RTRFC-DUBQ5", @"type": @"日卡"}, @{@"code": @"DAY-RX13O-DGD0M", @"type": @"日卡"}, @{@"code": @"DAY-S93IA-YDI9Z", @"type": @"日卡"}, @{@"code": @"DAY-SI26H-LBJ3F", @"type": @"日卡"}, @{@"code": @"DAY-STHH8-NMWT1", @"type": @"日卡"}, @{@"code": @"DAY-T6ST3-DRSV9", @"type": @"日卡"}, @{@"code": @"DAY-TFFIK-TWXL1", @"type": @"日卡"},
            @{@"code": @"DAY-TT23J-QHRW1", @"type": @"日卡"}, @{@"code": @"DAY-TX4FL-WVHSW", @"type": @"日卡"}, @{@"code": @"DAY-UKP58-NM4O6", @"type": @"日卡"}, @{@"code": @"DAY-UOB0D-7OTVD", @"type": @"日卡"}, @{@"code": @"DAY-UXFXE-DEGIJ", @"type": @"日卡"}, @{@"code": @"DAY-UZN20-F79OK", @"type": @"日卡"}, @{@"code": @"DAY-V5BEC-FQ3TK", @"type": @"日卡"}, @{@"code": @"DAY-VD6VQ-4147W", @"type": @"日卡"}, @{@"code": @"DAY-VI0QW-Y0YOQ", @"type": @"日卡"}, @{@"code": @"DAY-VPYEJ-SPD0I", @"type": @"日卡"},
            @{@"code": @"DAY-WKDF8-H1C4O", @"type": @"日卡"}, @{@"code": @"DAY-WPEZD-VNIOZ", @"type": @"日卡"}, @{@"code": @"DAY-WTMJ9-4VQF1", @"type": @"日卡"}, @{@"code": @"DAY-WW6T4-0YKDI", @"type": @"日卡"}, @{@"code": @"DAY-X8X8F-GJ3TM", @"type": @"日卡"}, @{@"code": @"DAY-XAAP8-NSQJX", @"type": @"日卡"}, @{@"code": @"DAY-Y39DJ-OAIKN", @"type": @"日卡"}, @{@"code": @"DAY-YPHII-NHQP7", @"type": @"日卡"}, @{@"code": @"DAY-YUJ9J-97RO1", @"type": @"日卡"}, @{@"code": @"DAY-ZHDY2-MNPG4", @"type": @"日卡"},

            // ===== 魔女之夜 月卡 (100) =====
            @{@"code": @"MON-07E5G-9OPS2", @"type": @"月卡"}, @{@"code": @"MON-0I5TS-1BEIM", @"type": @"月卡"}, @{@"code": @"MON-0ZDZR-NGYUO", @"type": @"月卡"}, @{@"code": @"MON-2M00T-NHY4Z", @"type": @"月卡"}, @{@"code": @"MON-2UCPQ-MFJUT", @"type": @"月卡"}, @{@"code": @"MON-37NLL-FP46X", @"type": @"月卡"}, @{@"code": @"MON-3X2O8-VBTJO", @"type": @"月卡"}, @{@"code": @"MON-4YH0G-C5QVO", @"type": @"月卡"}, @{@"code": @"MON-5VGFI-BSMN9", @"type": @"月卡"}, @{@"code": @"MON-68UX7-E3LL4", @"type": @"月卡"},
            @{@"code": @"MON-78J0U-WKGLJ", @"type": @"月卡"}, @{@"code": @"MON-7MEJL-052LD", @"type": @"月卡"}, @{@"code": @"MON-7YXCR-YUH74", @"type": @"月卡"}, @{@"code": @"MON-82JQ6-VR1WF", @"type": @"月卡"}, @{@"code": @"MON-876NR-KT9A2", @"type": @"月卡"}, @{@"code": @"MON-8854J-8HQ3C", @"type": @"月卡"}, @{@"code": @"MON-949HK-462UI", @"type": @"月卡"}, @{@"code": @"MON-9PC0J-J4ZON", @"type": @"月卡"}, @{@"code": @"MON-9SI9O-KHQUH", @"type": @"月卡"}, @{@"code": @"MON-AR4DP-470VD", @"type": @"月卡"},
            @{@"code": @"MON-BAMSH-IZ51P", @"type": @"月卡"}, @{@"code": @"MON-C18OG-Z8SYW", @"type": @"月卡"}, @{@"code": @"MON-CD2K5-6BVVZ", @"type": @"月卡"}, @{@"code": @"MON-CHADB-3QGR4", @"type": @"月卡"}, @{@"code": @"MON-D86ES-2F4MG", @"type": @"月卡"}, @{@"code": @"MON-D9422-6232H", @"type": @"月卡"}, @{@"code": @"MON-DF6U5-4VY60", @"type": @"月卡"}, @{@"code": @"MON-DHES0-YLHVB", @"type": @"月卡"}, @{@"code": @"MON-DVFZ5-9SWBA", @"type": @"月卡"}, @{@"code": @"MON-DW9QA-GK7RC", @"type": @"月卡"},
            @{@"code": @"MON-EI7D9-JB0H4", @"type": @"月卡"}, @{@"code": @"MON-ENPO9-IHX5F", @"type": @"月卡"}, @{@"code": @"MON-EQ93G-K3SX5", @"type": @"月卡"}, @{@"code": @"MON-F1AH1-J8TU3", @"type": @"月卡"}, @{@"code": @"MON-G73EY-MT24S", @"type": @"月卡"}, @{@"code": @"MON-G8U9S-2SPID", @"type": @"月卡"}, @{@"code": @"MON-GG6KJ-K7Z38", @"type": @"月卡"}, @{@"code": @"MON-H9AP7-M85LX", @"type": @"月卡"}, @{@"code": @"MON-I2QHJ-DSJFH", @"type": @"月卡"}, @{@"code": @"MON-ILR28-QGKAW", @"type": @"月卡"},
            @{@"code": @"MON-J4G7N-8X22C", @"type": @"月卡"}, @{@"code": @"MON-JNXWY-SL8JJ", @"type": @"月卡"}, @{@"code": @"MON-JQ0SK-7NIOS", @"type": @"月卡"}, @{@"code": @"MON-K445E-40WIM", @"type": @"月卡"}, @{@"code": @"MON-K51UK-GJ1AG", @"type": @"月卡"}, @{@"code": @"MON-K7L98-C1NO7", @"type": @"月卡"}, @{@"code": @"MON-KDB5P-OULRC", @"type": @"月卡"}, @{@"code": @"MON-KLGZL-YTAOL", @"type": @"月卡"}, @{@"code": @"MON-KUGQ3-YNHHT", @"type": @"月卡"}, @{@"code": @"MON-LZHGD-4DYV6", @"type": @"月卡"},
            @{@"code": @"MON-M8F0T-2R7OZ", @"type": @"月卡"}, @{@"code": @"MON-MJ1VX-N2KJM", @"type": @"月卡"}, @{@"code": @"MON-MKIRL-0FJRO", @"type": @"月卡"}, @{@"code": @"MON-MVUVE-M6013", @"type": @"月卡"}, @{@"code": @"MON-N6URD-EBH7G", @"type": @"月卡"}, @{@"code": @"MON-NH2HD-GOJQI", @"type": @"月卡"}, @{@"code": @"MON-NLDOE-3SWW9", @"type": @"月卡"}, @{@"code": @"MON-NLRFV-V2IK7", @"type": @"月卡"}, @{@"code": @"MON-NWC05-0DGEG", @"type": @"月卡"}, @{@"code": @"MON-ONHK3-CPEUK", @"type": @"月卡"},
            @{@"code": @"MON-OSM8F-I9O0X", @"type": @"月卡"}, @{@"code": @"MON-OWAWI-UK675", @"type": @"月卡"}, @{@"code": @"MON-P1SUM-7GARM", @"type": @"月卡"}, @{@"code": @"MON-PC2CX-RBV21", @"type": @"月卡"}, @{@"code": @"MON-PJAOQ-HSL34", @"type": @"月卡"}, @{@"code": @"MON-Q0V4F-JQIJC", @"type": @"月卡"}, @{@"code": @"MON-QONFF-OGQJF", @"type": @"月卡"}, @{@"code": @"MON-QPAXH-2BMSO", @"type": @"月卡"}, @{@"code": @"MON-R2W0B-OJP62", @"type": @"月卡"}, @{@"code": @"MON-R3YR3-ZHRYL", @"type": @"月卡"},
            @{@"code": @"MON-RBK3E-459V0", @"type": @"月卡"}, @{@"code": @"MON-RDOR9-VP4SE", @"type": @"月卡"}, @{@"code": @"MON-REGOV-YGC7M", @"type": @"月卡"}, @{@"code": @"MON-SD3QY-XYFBA", @"type": @"月卡"}, @{@"code": @"MON-SJ98H-U3PZX", @"type": @"月卡"}, @{@"code": @"MON-SS55L-MQNJW", @"type": @"月卡"}, @{@"code": @"MON-T3OJE-LUNI8", @"type": @"月卡"}, @{@"code": @"MON-TGCKW-AXD9Q", @"type": @"月卡"}, @{@"code": @"MON-UI3GH-FQ0IL", @"type": @"月卡"}, @{@"code": @"MON-UMBAU-UKKLH", @"type": @"月卡"},
            @{@"code": @"MON-UMHYW-6RI49", @"type": @"月卡"}, @{@"code": @"MON-V95JQ-2MPL6", @"type": @"月卡"}, @{@"code": @"MON-VGS68-HZAQN", @"type": @"月卡"}, @{@"code": @"MON-VTBIA-STMZN", @"type": @"月卡"}, @{@"code": @"MON-W822Y-7FJ5V", @"type": @"月卡"}, @{@"code": @"MON-WAG8R-9ZWHE", @"type": @"月卡"}, @{@"code": @"MON-WH5O8-L538K", @"type": @"月卡"}, @{@"code": @"MON-WISU1-I543A", @"type": @"月卡"}, @{@"code": @"MON-WWE5M-QBIX4", @"type": @"月卡"}, @{@"code": @"MON-XAAVB-JBJA6", @"type": @"月卡"},
            @{@"code": @"MON-XK876-JEFNT", @"type": @"月卡"}, @{@"code": @"MON-YB5XS-JYCF6", @"type": @"月卡"}, @{@"code": @"MON-YD8IT-OTTIY", @"type": @"月卡"}, @{@"code": @"MON-YM9OX-YF41L", @"type": @"月卡"}, @{@"code": @"MON-YN1C2-QKIN9", @"type": @"月卡"}, @{@"code": @"MON-YXLT0-NIM2G", @"type": @"月卡"}, @{@"code": @"MON-YZWAK-ZUDY2", @"type": @"月卡"}, @{@"code": @"MON-Z4RZ3-2JAK7", @"type": @"月卡"}, @{@"code": @"MON-ZFD2B-2WOP9", @"type": @"月卡"}, @{@"code": @"MON-ZP81X-ZIPHE", @"type": @"月卡"},

            // ===== 魔女之夜 永久卡 (100) =====
            @{@"code": @"PER-09U2H-SQFU2", @"type": @"永久卡"}, @{@"code": @"PER-0C8B8-AOOHP", @"type": @"永久卡"}, @{@"code": @"PER-0NQOA-KFYHI", @"type": @"永久卡"}, @{@"code": @"PER-0OXJJ-887SZ", @"type": @"永久卡"}, @{@"code": @"PER-1PUSA-4VNMG", @"type": @"永久卡"}, @{@"code": @"PER-1RM97-CC086", @"type": @"永久卡"}, @{@"code": @"PER-22JKV-7GQDE", @"type": @"永久卡"}, @{@"code": @"PER-25CZW-JKDTW", @"type": @"永久卡"}, @{@"code": @"PER-2ALUH-GJCTT", @"type": @"永久卡"}, @{@"code": @"PER-2QNSC-06SET", @"type": @"永久卡"},
            @{@"code": @"PER-2X7UN-394R9", @"type": @"永久卡"}, @{@"code": @"PER-30Y5B-JVPNS", @"type": @"永久卡"}, @{@"code": @"PER-3CWGF-3EH2S", @"type": @"永久卡"}, @{@"code": @"PER-3XBP3-W0Q8C", @"type": @"永久卡"}, @{@"code": @"PER-43NBZ-79GXR", @"type": @"永久卡"}, @{@"code": @"PER-44RD3-KNT0U", @"type": @"永久卡"}, @{@"code": @"PER-4SIQD-YJDJX", @"type": @"永久卡"}, @{@"code": @"PER-4ZHXN-0B6GF", @"type": @"永久卡"}, @{@"code": @"PER-5E0EJ-BE1N3", @"type": @"永久卡"}, @{@"code": @"PER-5PJZ1-ST3FG", @"type": @"永久卡"},
            @{@"code": @"PER-5THD0-K5RIV", @"type": @"永久卡"}, @{@"code": @"PER-7URHW-M0W08", @"type": @"永久卡"}, @{@"code": @"PER-8AR0X-GEKR9", @"type": @"永久卡"}, @{@"code": @"PER-8E086-VHM41", @"type": @"永久卡"}, @{@"code": @"PER-8PMWA-C5EGM", @"type": @"永久卡"}, @{@"code": @"PER-97MB5-1TSWG", @"type": @"永久卡"}, @{@"code": @"PER-9LSIA-COCE7", @"type": @"永久卡"}, @{@"code": @"PER-A34TV-AD6X9", @"type": @"永久卡"}, @{@"code": @"PER-A56V1-G6JKU", @"type": @"永久卡"}, @{@"code": @"PER-BGF8G-ZZX06", @"type": @"永久卡"},
            @{@"code": @"PER-CO2WH-1MLX9", @"type": @"永久卡"}, @{@"code": @"PER-D3ZON-7AAWB", @"type": @"永久卡"}, @{@"code": @"PER-DPOUU-DDXYZ", @"type": @"永久卡"}, @{@"code": @"PER-E5GBI-NOLOO", @"type": @"永久卡"}, @{@"code": @"PER-ELMOD-AX525", @"type": @"永久卡"}, @{@"code": @"PER-EVJON-DZUKR", @"type": @"永久卡"}, @{@"code": @"PER-F4LQK-AA3WU", @"type": @"永久卡"}, @{@"code": @"PER-F63UW-QJYOX", @"type": @"永久卡"}, @{@"code": @"PER-FRIIP-FNCMV", @"type": @"永久卡"}, @{@"code": @"PER-FT3VP-AC373", @"type": @"永久卡"},
            @{@"code": @"PER-FYA57-WNKTK", @"type": @"永久卡"}, @{@"code": @"PER-GI1XJ-BALKL", @"type": @"永久卡"}, @{@"code": @"PER-GP0UQ-WGCFZ", @"type": @"永久卡"}, @{@"code": @"PER-HB3CN-LU4JI", @"type": @"永久卡"}, @{@"code": @"PER-HCPAF-K6OJJ", @"type": @"永久卡"}, @{@"code": @"PER-HL1VZ-92L4R", @"type": @"永久卡"}, @{@"code": @"PER-HLIKN-DP057", @"type": @"永久卡"}, @{@"code": @"PER-HP9XF-BTHTL", @"type": @"永久卡"}, @{@"code": @"PER-HZSKM-YVKRT", @"type": @"永久卡"}, @{@"code": @"PER-I2H5C-4K0H4", @"type": @"永久卡"},
            @{@"code": @"PER-I366F-IQ36B", @"type": @"永久卡"}, @{@"code": @"PER-I3BRB-6HP0M", @"type": @"永久卡"}, @{@"code": @"PER-IBWXP-3CRV2", @"type": @"永久卡"}, @{@"code": @"PER-IERIS-OLXGR", @"type": @"永久卡"}, @{@"code": @"PER-J2NK3-W7673", @"type": @"永久卡"}, @{@"code": @"PER-JCHNU-ATU2T", @"type": @"永久卡"}, @{@"code": @"PER-JHDFR-VJWN8", @"type": @"永久卡"}, @{@"code": @"PER-LQYXG-JP161", @"type": @"永久卡"}, @{@"code": @"PER-LZK95-VUH7D", @"type": @"永久卡"}, @{@"code": @"PER-M748C-SUTRS", @"type": @"永久卡"},
            @{@"code": @"PER-MI7EH-3VVPU", @"type": @"永久卡"}, @{@"code": @"PER-MS1RV-5XNW8", @"type": @"永久卡"}, @{@"code": @"PER-N82H4-LKK09", @"type": @"永久卡"}, @{@"code": @"PER-NPX91-04VQT", @"type": @"永久卡"}, @{@"code": @"PER-NRKOL-YHHM6", @"type": @"永久卡"}, @{@"code": @"PER-OW0PJ-IKKQA", @"type": @"永久卡"}, @{@"code": @"PER-QA6IJ-J0F8L", @"type": @"永久卡"}, @{@"code": @"PER-R673C-0FBHH", @"type": @"永久卡"}, @{@"code": @"PER-R6XL0-Z23WQ", @"type": @"永久卡"}, @{@"code": @"PER-RE2WB-9IPLQ", @"type": @"永久卡"},
            @{@"code": @"PER-RMY1Q-SG2AO", @"type": @"永久卡"}, @{@"code": @"PER-RN7W9-25IW9", @"type": @"永久卡"}, @{@"code": @"PER-RUEF3-MA3JS", @"type": @"永久卡"}, @{@"code": @"PER-RVCMY-S8HHT", @"type": @"永久卡"}, @{@"code": @"PER-SDCMG-KMH82", @"type": @"永久卡"}, @{@"code": @"PER-SVG63-YSSRW", @"type": @"永久卡"}, @{@"code": @"PER-SWUAT-QUK3I", @"type": @"永久卡"}, @{@"code": @"PER-T84LG-J7MNC", @"type": @"永久卡"}, @{@"code": @"PER-U0O3P-KI7L5", @"type": @"永久卡"}, @{@"code": @"PER-U6DXB-95PDH", @"type": @"永久卡"},
            @{@"code": @"PER-U9IX4-M9192", @"type": @"永久卡"}, @{@"code": @"PER-UTM0N-8UTYG", @"type": @"永久卡"}, @{@"code": @"PER-V4B4Z-2JH42", @"type": @"永久卡"}, @{@"code": @"PER-VK3WI-ILU6O", @"type": @"永久卡"}, @{@"code": @"PER-VQIGY-9WXWI", @"type": @"永久卡"}, @{@"code": @"PER-VTJ75-LIE2L", @"type": @"永久卡"}, @{@"code": @"PER-VTRYZ-R0JEI", @"type": @"永久卡"}, @{@"code": @"PER-WK9DJ-WRZ8L", @"type": @"永久卡"}, @{@"code": @"PER-WYBDN-PZZHS", @"type": @"永久卡"}, @{@"code": @"PER-X1VX5-CQEVW", @"type": @"永久卡"},
            @{@"code": @"PER-XME2M-8O8H7", @"type": @"永久卡"}, @{@"code": @"PER-XU024-1Z5NK", @"type": @"永久卡"}, @{@"code": @"PER-XW64S-W10ZL", @"type": @"永久卡"}, @{@"code": @"PER-Y00I4-IB84Z", @"type": @"永久卡"}, @{@"code": @"PER-YFSJX-0KV1P", @"type": @"永久卡"}, @{@"code": @"PER-Z971S-3O8D8", @"type": @"永久卡"}, @{@"code": @"PER-ZL44M-QH5HP", @"type": @"永久卡"}, @{@"code": @"PER-ZQW27-UMP8N", @"type": @"永久卡"}, @{@"code": @"PER-ZRYRG-DYUH2", @"type": @"永久卡"}, @{@"code": @"PER-ZZW8G-1XEFA", @"type": @"永久卡"}
        ];
    });
    return database;
}

@interface AuthManager : NSObject
+ (instancetype)sharedInstance;
- (void)checkAndLoad;
@end

@implementation AuthManager
+ (instancetype)sharedInstance {
    static AuthManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{ instance = [[AuthManager alloc] init]; });
    return instance;
}
- (void)checkAndLoad {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *activeCode = [defaults objectForKey:kKeyActiveCode];
    NSString *activeDevice = [defaults objectForKey:kKeyActiveDevice];
    NSTimeInterval activationTime = [defaults doubleForKey:kKeyActivationTime];
    NSString *codeType = [defaults objectForKey:kKeyCodeType];
    
    NSString *currentDevice = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    BOOL isValid = NO;
    
    if (activeCode && [activeDevice isEqualToString:currentDevice]) {
        NSTimeInterval now = [[NSDate date] timeIntervalSince1970];
        NSTimeInterval elapsed = now - activationTime;
        if ([codeType isEqualToString:@"永久卡"]) isValid = YES;
        else if ([codeType isEqualToString:@"日卡"]) isValid = (elapsed < 24 * 3600);
        else if ([codeType isEqualToString:@"月卡"]) isValid = (elapsed < 30 * 24 * 3600);
    }
    
    if (isValid) {
        [self loadTargetDylib];
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{ [self showAuthUI]; });
    }
}

- (void)loadTargetDylib {
    // 针对魔女之夜：加载 libmajowitchesnight.dylib
    NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
    NSString *dylibPath = [bundlePath stringByAppendingPathComponent:@"Frameworks/libmajowitchesnight.dylib"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:dylibPath]) { 
        NSLog(@"[Auth] 找不到目标: %@", dylibPath);
        return; 
    }
    dlopen([dylibPath UTF8String], RTLD_NOW);
}

- (void)showAuthUI {
    UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    if (!rootVC) return;
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"授权验证" message:@"请输入您的激活码以启动游戏" preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) { textField.placeholder = @"粘贴或输入激活码"; }];
    
    UIAlertAction *activateAction = [UIAlertAction actionWithTitle:@"激活" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) { 
        [self verifyCode:alert.textFields.firstObject.text]; 
    }];
    
    UIAlertAction *exitAction = [UIAlertAction actionWithTitle:@"退出游戏" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) { 
        exit(0); 
    }];
    
    [alert addAction:activateAction];
    [alert addAction:exitAction];
    [rootVC presentViewController:alert animated:YES completion:nil];
}

- (void)verifyCode:(NSString *)code {
    NSArray *codesArray = getAuthDatabase();
    BOOL codeFound = NO;
    NSString *cardType = nil;
    NSString *cleanCode = [[code stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    for (NSDictionary *dict in codesArray) {
        if ([dict[@"code"] isEqualToString:cleanCode]) { codeFound = YES; cardType = dict[@"type"]; break; }
    }
    
    if (!codeFound) { 
        [self showErrorAndKill:@"激活码无效，请检查输入"]; 
        return; 
    }
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *savedDevice = [defaults objectForKey:[NSString stringWithFormat:@"Device_%@", cleanCode]];
    NSString *currentDevice = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    if (savedDevice && ![savedDevice isEqualToString:currentDevice]) { 
        [self showErrorAndKill:@"该激活码已在其他设备绑定，无法跨设备使用"]; 
        return; 
    }
    
    [defaults setObject:cleanCode forKey:kKeyActiveCode];
    [defaults setObject:currentDevice forKey:kKeyActiveDevice];
    [defaults setObject:@([[NSDate date] timeIntervalSince1970]) forKey:kKeyActivationTime];
    [defaults setObject:cardType forKey:kKeyCodeType];
    [defaults setObject:currentDevice forKey:[NSString stringWithFormat:@"Device_%@", cleanCode]];
    [defaults synchronize];
    
    [self loadTargetDylib];
    
    UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    [rootVC dismissViewControllerAnimated:YES completion:^{ 
        UIAlertController *successAlert = [UIAlertController alertControllerWithTitle:@"成功" message:@"授权成功，祝您游戏愉快！" preferredStyle:UIAlertControllerStyleAlert];
        [successAlert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [rootVC presentViewController:successAlert animated:YES completion:nil];
    }];
}

- (void)showErrorAndKill:(NSString *)message {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
        [rootVC dismissViewControllerAnimated:YES completion:nil]; 
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"错误" message:message preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"退出" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) { 
            exit(0); 
        }]];
        [rootVC presentViewController:alert animated:YES completion:nil];
    });
}

@end

__attribute__((constructor)) static void initPlugin() {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[AuthManager sharedInstance] checkAndLoad];
    });
}
