#!/usr/bin/env python
# encoding: utf-8
# origin: https://github.com/jszakmeister/markdown2ctags
# https://github.com/lisongmin/markdown2ctags/blob/master/markdown2ctags.py
# Copyright (C) 2013 John Szakmeister <john@szakmeister.net>
# All rights reserved.
#
# This software is licensed as described in the file LICENSE.txt, which
# you should have received as part of this distribution.

from __future__ import absolute_import, division, print_function
import sys
import re


__version__ = '0.1.2'


class ScriptError(Exception):
    pass


def ctagNameEscape(str):
    return re.sub(b'[\t\r\n]+', b' ', str)


def ctagSearchEscape(str):
    str = str.replace(b'\t', br'\t')
    str = str.replace(b'\r', br'\r')
    str = str.replace(b'\n', br'\n')
    str = str.replace(b'\\', br'\\')
    return str


class Tag(object):
    def __init__(self, tagName, tagFile, tagAddress):
        self.tagName = tagName
        self.tagFile = tagFile
        self.tagAddress = tagAddress
        self.fields = []

    def addField(self, type, value=None):
        if type == b'kind':
            type = None
        self.fields.append((type, value))

    def _formatFields(self):
        formattedFields = []
        for name, value in self.fields:
            if isinstance(value, int):
                value = str(value).encode()
            elif not value:
                value = b''

            if name:
                s = b':'.join([name, value])
            else:
                s = value

            formattedFields.append(s)
        return b'\t'.join(formattedFields)

    def __str__(self):
        return '%s\t%s\t%s;"\t%s' % (
            self.tagName, self.tagFile, self.tagAddress,
            self._formatFields())

    def __bytes__(self):
        return b'\t'.join([
            self.tagName, self.tagFile, self.tagAddress + b';"',
            self._formatFields()])

    def __lt__(self, other):
        return bytes(self) < bytes(other)

    @staticmethod
    def section(section):
        tagName = ctagNameEscape(section.name)
        tagAddress = b'/^' + ctagSearchEscape(section.line) + b'$/'
        t = Tag(tagName, section.filename, tagAddress)
        t.addField(b'kind', b's')
        t.addField(b'line', section.lineNumber)

        parents = []
        p = section.parent
        while p is not None:
            parents.append(ctagNameEscape(p.name))
            p = p.parent
        parents.reverse()

        if parents:
            t.addField(b'section', b'|'.join(parents))

        return t


class Section(object):
    def __init__(self, level, name, line, lineNumber, filename, parent=None):
        self.level = level
        self.name = name
        self.line = line
        self.lineNumber = lineNumber
        self.filename = filename
        self.parent = parent

    def __repr__(self):
        return '<Section %s %d %d>' % (self.name, self.level, self.lineNumber)


atxHeadingRe = re.compile(br'^(#+)\s+(.*?)(?:\s+#+)?\s*$')
settextHeadingRe = re.compile(br'^[-=]+$')
settextSubjectRe = re.compile(br'^[^\s]+.*$')


def findSections(filename, lines):
    sections = []
    previousSections = []
    inCodeBlock = False

    for i, line in enumerate(lines):
        # Skip GitHub Markdown style code blocks.
        if line.startswith(b"```"):
            inCodeBlock = not inCodeBlock
            continue

        if inCodeBlock:
            continue

        m = atxHeadingRe.match(line)
        if m:
            level = len(m.group(1))
            name = m.group(2)

            previousSections = previousSections[:level-1]
            if previousSections:
                parent = previousSections[-1]
            else:
                parent = None
            lineNumber = i + 1

            s = Section(level, name, line, lineNumber, filename, parent)
            previousSections.append(s)
            sections.append(s)
        else:
            m = settextHeadingRe.match(line)
            if i and m:
                if not settextSubjectRe.match(lines[i - 1]):
                    continue

                name = lines[i-1].strip()

                if line[0] == '=':
                    level = 1
                else:
                    level = 2

                previousSections = previousSections[:level-1]
                if previousSections:
                    parent = previousSections[-1]
                else:
                    parent = None
                lineNumber = i

                s = Section(level, name, lines[i-1], lineNumber,
                            filename, parent)
                previousSections.append(s)
                sections.append(s)

    return sections


def sectionsToTags(sections):
    tags = []

    for section in sections:
        tags.append(Tag.section(section))

    return tags


def genTagsFile(output, tags, sort):
    if sort == "yes":
        tags = sorted(tags)
        sortedLine = b'!_TAG_FILE_SORTED\t1\n'
    elif sort == "foldcase":
        tags = sorted(tags, key=lambda x: str(x).lower())
        sortedLine = b'!_TAG_FILE_SORTED\t2\n'
    else:
        sortedLine = b'!_TAG_FILE_SORTED\t0\n'

    output.write(b'!_TAG_FILE_FORMAT\t2\n')
    output.write(sortedLine)

    for t in tags:
        output.write(bytes(t))
        output.write(b'\n')


def main():
    from optparse import OptionParser

    parser = OptionParser(usage="usage: %prog [options] file(s)",
                          version=__version__)
    parser.add_option(
        "-f", "--file", metavar="FILE", dest="tagfile",
        default="tags",
        help='Write tags into FILE (default: "tags").  Use "-" to write '
        'tags to stdout.')
    parser.add_option(
        "--sort", metavar="[yes|foldcase|no]", dest="sort",
        choices=["yes", "no", "foldcase"],
        default="yes",
        help='Produce sorted output.  Acceptable values are "yes", '
        '"no", and "foldcase".  Default is "yes".')

    options, args = parser.parse_args()

    if options.tagfile == '-':
        try:
            output = sys.stdout.buffer
        except:
            output = sys.stdout
    else:
        output = open(options.tagfile, 'wb')

    for filename in args:
        f = open(filename, 'rb')
        lines = f.read().splitlines()
        f.close()
        sections = findSections(filename.encode(sys.getfilesystemencoding()), lines)

        genTagsFile(output, sectionsToTags(sections), sort=options.sort)

    output.flush()
    output.close()

if __name__ == '__main__':
    try:
        main()
    except IOError as e:
        import errno
        if e.errno == errno.EPIPE:
            # Exit saying we got SIGPIPE.
            sys.exit(141)
        raise
    except ScriptError as e:
        print("ERROR: {0}".format(str(e)), file=sys.stderr)
        sys.exit(1)
