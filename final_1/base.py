from migen import *

from migen.genlib.io import CRG

from litex.build.generic_platform import *
from litex.build.xilinx import XilinxPlatform

from litex.soc.integration.soc_core import *
from litex.soc.integration.builder import *
from litex.soc.cores.spi import SPIMaster


from ios import Led, RGBLed, Button, Switch
from btn_itrupt import*


#salidas para nexys 4 ddr
_io = [
    ("user_led",  0, Pins("H17"), IOStandard("LVCMOS33")),
    ("user_led",  1, Pins("K15"), IOStandard("LVCMOS33")),
    ("user_led",  2, Pins("J13"), IOStandard("LVCMOS33")),
    ("user_led",  3, Pins("N14"), IOStandard("LVCMOS33")),


    ("btnint",  0, Pins("G16"), IOStandard("LVCMOS33")),

    ("accion",  0, Pins("F16"), IOStandard("LVCMOS33")),
    ("accion",  1, Pins("D14"), IOStandard("LVCMOS33")),
    ("accion",  2, Pins("H14"), IOStandard("LVCMOS33")),

    ("direccion",  0, Pins("g13"), IOStandard("LVCMOS33")),#E16  /M18
    ("direccion",  1, Pins("F13"), IOStandard("LVCMOS33")), #F13  / M17
    ("direccion",  2, Pins("E16"), IOStandard("LVCMOS33")),#G13 /P17
    ("direccion",  3, Pins("H16 "), IOStandard("LVCMOS33")),#H16      /P18

    ("lcd_spi", 0,
        Subsignal("cs_n", Pins("C17")),
        Subsignal("mosi", Pins("G17")),
        Subsignal("miso", Pins("E17")),
        Subsignal("clk", Pins("D17")),
        IOStandard("LVCMOS33")
    ),
    ("rst_lcd",  0, Pins("D18"), IOStandard("LVCMOS33")),#rst
    ("rs_lcd",  0, Pins("E18"), IOStandard("LVCMOS33")),

    ("clk100", 0, Pins("E3"), IOStandard("LVCMOS33")),

    ("cpu_reset", 0, Pins("C12"), IOStandard("LVCMOS33")),

    ("serial", 0,
        Subsignal("tx", Pins("D4")),
        Subsignal("rx", Pins("C4")),
        IOStandard("LVCMOS33"),
    ),
]


class Platform(XilinxPlatform):
    default_clk_name = "clk100"
    default_clk_period = 10.0

    def __init__(self):
        XilinxPlatform.__init__(self, "xc7a100t-CSG324-1", _io, toolchain="ise")

    def do_finalize(self, fragment):
        XilinxPlatform.do_finalize(self, fragment)


def csr_map_update(csr_map, csr_peripherals):
    csr_map.update(dict((n, v)
        for v, n in enumerate(csr_peripherals, start=max(csr_map.values()) + 1)))


# create our platform (fpga interface)
platform = Platform()

# create our soc (fpga description)
class BaseSoC(SoCCore):
    # Peripherals CSR declaration
    csr_peripherals = [

        "leds",
        "buttoniner",
        "direcciones",
        "acciones",
        "lcd",
        "rs",
        "rst"
    ]
    csr_map_update(SoCCore.csr_map, csr_peripherals)

    def __init__(self, platform):
        sys_clk_freq = int(100e6)
        # SoC with CPU
        interrupt_map = {
            "buttoniner" : 4,
        }
        SoCCore.interrupt_map.update(interrupt_map)

        SoCCore.__init__(self, platform,
            cpu_type="lm32",
            clk_freq=100e6,
            ident="CPU Test SoC", ident_version=True,
            integrated_rom_size=0x8000,
            integrated_main_ram_size=16*1024)

        # Clock Reset Generation
        self.submodules.crg = CRG(platform.request("clk100"), ~platform.request("cpu_reset"))

        # Led
        user_leds = Cat(*[platform.request("user_led", i) for i in range(4)])
        self.submodules.leds = Led(user_leds)
        # Buttons interrupcion
        self.submodules.buttoniner = btnintrupt(platform.request("btnint"))
        #direcciones
        direccioness = Cat(*[platform.request("direccion", i) for i in range(4)])
        self.submodules.direcciones = Button(direccioness)
        #acciones
        accioness = Cat(*[platform.request("accion", i) for i in range(3)])
        self.submodules.acciones = Button(accioness)
        # lcd
        self.submodules.lcd = SPIMaster(platform.request("lcd_spi"))
        self.submodules.rs = Led(platform.request("rs_lcd"))
        self.submodules.rst = Led(platform.request("rst_lcd"))



soc = BaseSoC(platform)

#
# build
#
builder = Builder(soc, output_dir="build", csr_csv="test/csr.csv")
builder.build()
