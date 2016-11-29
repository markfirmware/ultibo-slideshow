### Latest versions

|Component | Version
|---|---
| Core | 1.3.015 (Cucumber release)
| FPC | 3.1.1 revision 32846
| Lazarus | 1.6RC1

### RTL support

|Slide Show|Unit|Status|Priority|Effort|Notes
|---|---|---|---|---|---
|        | System | Complete | | | Some non relevant features not implemented
|        | SysUtils | Complete | | | Some non relevant features not implemented
|        | Classes | Complete | | | 
|        | Crt | Complete | | | 
|        | Dos | Complete | | | 
|        | Objpas | Complete | | | 
|        | Iso7185 | Complete | | | Not tested 
|        | Extpas | Complete | | | Not tested 
|        | Strings | Complete | | | 
|        | Math | Complete | | | Many functions not tested
|        | Fgl | Complete | | | 
|        | Macpas | Complete | | | Not tested 
|        | Typinfo | Complete | | |
|        | Types | Complete | | | 
|        | RtlConsts | Complete | | | 
|        | Getopts | Complete | | | Not tested
|        | Lineinfo | Complete | | | Not tested
|        | Ctypes | Complete | | | 
|        | Charset | Complete | | | Not tested
|        | Character | Complete | | | Not tested 
|        | Fpwidestring | Complete | | | Not tested
|        | Unicodedata | Complete | | | Limited testing
|        | Unicodenumtable | Complete | | | Limited testing
|        | Uuchar | Complete | | | 
|        | Softfpu | Incomplete | Low | Moderate | 
|        | Ufloat128 | Incomplete | Low | Minor | 
|        | Heaptrc | Incomplete | Medium | Unknown | Unknown if this can be made to work with HeapManager
|        | Exeinfo | Complete | | | Not tested

|Slide Show| Package | Status | Priority | Effort | Notes
|---|---|---|---|---|---
|        | Bzip2 | Complete | | | Limited testing 
|        | Chm | Complete | | | Limited testing 
|        | Fastcgi | Complete | | | Limited testing
|        | Fcl-base | Complete | | | Limited testing
|        | Fcl-db | Complete | | | Limited testing
|        | Fcl-extra | Complete | | | Limited testing 
|        | Fcl-fpcunit | Complete | | | Limited testing 
|        | Fcl-image | Complete | | | Limited testing
|        | Fcl-js | Complete | | | Limited testing 
|        | Fcl-json | Complete | | | Limited testing
|        | Fcl-net | Complete | | | Limited testing
|        | Fcl-passrc | Complete | | | Limited testing
|        | Fcl-process | Complete | | | Dummy only
|        | Fcl-registry | Complete | | | Limited testing
|        | Fcl-res | Complete | | | Limited testing 
|        | Fcl-sdo | Complete | | | Limited testing 
|        | Fcl-sound | Complete | | | Limited testing
|        | Fcl-stl | Complete | | | Limited testing 
|        | Fcl-web | Complete | | | Limited testing 
|        | Fcl-xml | Complete | | | Limited testing 
|        | Fpmkunit | Complete | | | Limited testing 
|        | FV (FreeVision) | Complete | | | 
|        | Hash | Complete | | | Limited testing
|        | Hermes | Complete | | | Not tested
|        | Libtar | Complete | | | Limited testing 
|        | Pasjpeg | Complete | | | Limited testing
|        | Paszlib | Complete | | | Limited testing
|        | Regexpr | Complete | | | Limited testing
|        | Rtl-console | Complete | | | 
|        | Rtl-extra | Complete | | | Limited testing
|        | Rtl-objpas | Complete | | | Limited testing
|        | Rtl-unicode | Complete | | | Limited testing
|        | Symbolic | Complete | | | Not tested 
|        | Unzip | Complete | | | Limited testing 
|        | All others | Incomplete | Unknown | Unknown | Most require libraries or platform specific features

### Feature support

|Slide Show | Feature | Status | Priority | Effort | Notes
|---|---|---|---|---|---
|        | Heap | Complete | | | 
|        | Threads | Complete | | | 
|        | Spin locks | Complete | | | 
|        | Mutexes | Complete | | | 
|        | Semaphores | Complete | | | 
|        | Critical sections | Complete | | | 
|        | Events | Complete | | | 
|        | Synchronizers | Complete | | | Synchronizer is a multi reader single writer lock
|        | Thread messages | Complete | | | 
|        | Messageslots | Complete | | | 
|        | Mailslots | Complete | | | 
|        | Buffers | Complete | | | 
|        | Thread variables | Complete | | | 
|        | Thread lists | Complete | | | 
|        | Thread queues | Complete | | | 
|        | TLS indexes | Complete | | | 
|        | Exceptions | Complete | | | 
|        | Timers | Complete | | | 
|        | Workers | Complete | | | 
|        | Clock | Complete | | | 
|        | Timezones | Complete | | | 
|        | Interrupt IRQ | Complete | | | 
|        | Interrupt FIQ | Complete | | | 
|        | System calls | Complete | | | Requires update of handler to support new model
|        | Page tables | Complete | | | 
|        | Vector tables | Complete | | | 
|        | Shutdown restart | Complete | | | Requires an interface to register shutdown handlers
|        | Devices | Complete | | | 
|        | Console | Complete | | | 
|        | Fonts | Complete | | 
|        | Selection of fonts available plus font tools
|        | Keyboard | Complete | | | 
|        | Mouse | Complete | | | 
|        | Touch | Complete | | | Needs correct handling of scaling and calibration
|        | Keymaps | Complete | | | Keymaps included for US English, German, Spanish, French, UK English and US International
|        | Code Pages | Implemented | Medium | Moderate | Functional but requires additional work 
|        | Unicode | Implemented | Medium | Moderate | Functional but requires additional work 
|        | Locales | Incomplete | Medium | Moderate | Some initial support APIs completed
|        | Cryptography | In progress | High | Moderate | 

### Hardware support

|Slide Show | Device | Status | Priority | Effort | Notes 
|---|---|---|---|---|---
|        | DMA | Complete | | | 
|        | Framebuffer | Complete | | | 
|        | GPIO | Complete | | | 
|        | HDMI CEC | Incomplete | Medium | Unknown | CEC (Consumer Electronics Control) over HDMI. Seems to require support of the VideoCore IV GPU.
|        | I2C | Complete | | | 
|        | I2S | Incomplete | Medium | Moderate | 
|        | MMC/SD | Complete | | | Requires support for eMMC and SDIO
|        | PWM | Complete | | | 
|        | RTC | Complete | | 
|        | Driver available for DS1307 chip
|        | Serial | Complete | | | 
|        | SPI | Complete | | | 
|        | Counters (Timers) | Complete | | | Driver included for ARM timer on all Raspberry Pi models
|        | TFT LCD | Complete | | | Drivers included for HX8357D and ILI9340 based SPI displays
|        | UART | Complete | | | 
|        | USB | Complete | | | Isochronous transfers not supported yet
|        | USB Hubs | Complete | | | 
|        | USB Keyboard | Complete | | | 
|        | USB Mouse | Complete | | | 
|        | USB Storage | Complete | | | 
|        | USB CDC (Serial) | Complete | | | 
|        | USB Firmware (DFU) | Incomplete | Medium | Moderate | 
|        | USB Audio | Incomplete | Medium | Moderate | 
|        | USB Video | Incomplete | Medium | Moderate | 
