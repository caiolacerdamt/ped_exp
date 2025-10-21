# Definição das chaves (Switches) como entradas
# p0 é o de maior prioridade, vamos associá-lo a SW0
set_property PACKAGE_PIN V17 [get_ports p0]
set_property IOSTANDARD LVCMOS33 [get_ports p0]
set_property PACKAGE_PIN V16 [get_ports p1]
set_property IOSTANDARD LVCMOS33 [get_ports p1]
set_property PACKAGE_PIN W16 [get_ports p2]
set_property IOSTANDARD LVCMOS33 [get_ports p2]
set_property PACKAGE_PIN W17 [get_ports p3]
set_property IOSTANDARD LVCMOS33 [get_ports p3]

# Definição dos LEDs como saídas
# Saída 'int' em LED0, 'x0' em LED1 e 'x1' em LED2
set_property PACKAGE_PIN U16 [get_ports int]
set_property IOSTANDARD LVCMOS33 [get_ports int]
set_property PACKAGE_PIN E19 [get_ports x0]
set_property IOSTANDARD LVCMOS33 [get_ports x0]
set_property PACKAGE_PIN U19 [get_ports x1]
set_property IOSTANDARD LVCMOS33 [get_ports x1]