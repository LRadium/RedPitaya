==============
Identification
==============

-----------
Description
-----------



------------
Register set
------------

+---------+----------------+
| address | register name  |
+=========+================+
| 0x00    | ID constant    |
+---------+----------------+
| 0x04    | DNA [32-1: 0]  |
+---------+----------------+
| 0x08    | DNA [57-1:32]  |
+---------+----------------+
| 0x0c    | reserved       |
+---------+----------------+
| 0x10    | efuse          |
+---------+----------------+
| 0x14    | reserved       |
+---------+----------------+
| 0x18    | reserved       |
+---------+----------------+
| 0x1c    | reserved       |
+---------+----------------+
| 0x20    | GITH[32*0+:32] |
+---------+----------------+
| 0x24    | GITH[32*1+:32] |
+---------+----------------+
| 0x28    | GITH[32*2+:32] |
+---------+----------------+
| 0x2c    | GITH[32*3+:32] |
+---------+----------------+
| 0x3c    | GITH[32*4+:32] |
+---------+----------------+

~~~~~~~~~~~~~~~~~~~~~~
**0x00** *ID* register
~~~~~~~~~~~~~~~~~~~~~~

+---------+----------+---------+
| bit     | 31:4     | 3:0     |
+=========+==========+=========+
| name    | reserved | release |
+---------+----------+---------+
| R/W     | RO       | RO      |
+---------+----------+---------+
| reset   | 0x0      | 0x1     |
+---------+----------+---------+

~~~~~~~~~~~~~~~~~~~~~~~~~~~~
**0x04:0x08** *DNA* register
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~
**0x10** *efuse* register
~~~~~~~~~~~~~~~~~~~~~~~~~

+---------+----------+
| bit     | 31:0     |
+=========+==========+
| name    | efuse    |
+---------+----------+
| R/W     | RO       |
+---------+----------+
| reset   |          |
+---------+----------+

