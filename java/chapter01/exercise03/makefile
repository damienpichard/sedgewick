### makefile ---                                   -*- mode: makefile-gmake; -*-

## Copyright (C) 2025 Damien Pichard

## Author: damienpichard <damienpichard@tuta.com>
## Keywords:

## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.

## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.

## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

### Commentary:

#

### Code:


# See: https://stackoverflow.com/a/18137056
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(patsubst %/,%,$(dir $(mkfile_path)))


.PHONY: all
all: builda buildb buildc buildd


builda: maina.java
	@echo "=== Omitting 'public' ==="
	javac $<
	java $(basename $<)
	@echo "\n\n"

buildb: mainb.java
	@echo "=== Omitting 'static' ==="
	javac $<
	java $(basename $<)
	@echo "\n\n"

buildc: mainc.java
	@echo "=== Omitting 'void' ==="
	javac $<

buildd: maind.java
	@echo "=== Omitting 'args' ==="
	javac $<
	java $(basename $<)


