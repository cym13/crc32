#!/usr/bin/env rdmd

import std.uni;
import std.file;
import std.stdio;
import std.getopt;
import std.digest.crc;

import core.stdc.stdlib: exit;

enum vernum = "2.0.0";

enum help = q"EOF
Compute CRC32 checksum of streams and files

Usage: crc32 [options] [FILE...]

Arguments:
    FILE  The file to compute the checksum of
          If FILE is a directory all files within it will be taken
          If FILE is missing the standard input is taken

Options:
    -h, --help      Print this help and exit
    -v, --version   Print version and copyright info and exit
    -r, --recursive Traverse subdirectories recursively
    -q, --quiet     Suppress warnings
EOF";

string crc32(File chunks) {
       return chunks.byChunk(8192)
                    .crc32Of
                    .reverse
                    .toHexString
                    .toLower;
}

string fileCrc32(string path) {
    try {
        return File(file, "rb").crc32;
    }
    catch (FileException ex) {
        stderr.writeln(ex.msg);
        return null;
    }
}

string dirCrc32(string path) {
}

int main(string[] args) {
    bool quiet;
    bool recursive;

    getopt(args,
        "quiet|q",     &quiet,
        "recursive|r", &recursive,
        "version|v",   { vernum.writeln; exit(0); },
        "help|h",      {   help.writeln; exit(0); },
    );

    if (args[1..$].length == 0) {
        writeln(stdin.crc32);
        return 0;
    }

    foreach (file ; args[1..$]) {
        immutable crc = file.fileCrc32;
        if (crc || quiet)
            writefln("%s\t%s", crc, file);
    }

    return 0;
}
