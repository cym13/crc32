#!/usr/bin/env rdmd

import std.uni;
import std.file;
import std.stdio;
import std.digest.crc;

string crc32(string file) {
    try {
        return file.read.crc32Of.reverse.toHexString.toLower;
    }
    catch (FileException ex) {
        stderr.writeln(ex.msg);
        return null;
    }
}

int main(string[] args) {
    if (args.length == 1) {
        stderr.writeln("Usage: crc32 FILE...");
        return 1;
    }

    if (args.length == 2) {
        auto crc = crc32(args[1]);
        if (crc)
            writeln(crc);
        return 0;
    }

    foreach (file ; args[1..$]) {
        auto crc = crc32(file);
        if (crc)
            writeln(crc, "\t", file);
    }

    return 0;
}
