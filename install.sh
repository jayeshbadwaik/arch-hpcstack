#!/bin/bash
pacman -S $(pacman -Ssq hpcstack | tr '\n' ' ' )
