Description
===========

A simple crc32 utility similar to the perl one but written in D because I
don't like perl much (and because D is fun :p).

Usage
=====

::

    Usage: crc32 [options] [FILE...]

    Arguments:
        FILE  The file to compute the checksum of
              If FILE is a directory all files within it will be taken
              If FILE is missing the standard input is taken

    Options:
        -h, --help      Print this help and exit
        -v, --version   Print version and exit
        -r, --recursive Traverse subdirectories recursively


Dependencies
============

None

License
=======

This program is under the GPLv3 License.

You should have received a copy of the GNU General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.

Author
======

Main developper: Cédric Picard
Email:           cedric.picard@efrei.net
