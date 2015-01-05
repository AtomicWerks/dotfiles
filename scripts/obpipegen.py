#!/usr/bin/python3
# 0.1 - just basic desktopfile reading and basic icon parsing
# 0.2 - 17.02.13 disabled icon parsing, more robust error checks,
#                 accept extra directories when called
# 0.3 - 04.03.13 store changeable defaults in ~/.config/obmenugen/defaults
# 0.4 - 16.03.13 include icons with explicit paths in openbox menu
#                 but ignore name only entries
# 0.5 - 16.03.13 rename to obpipegen, handle icons properly with cache
#                 clean up code

import os, string, sys, glob

globallist = []
globaldirs = ['/usr/share/applications']
globalhold = []
iconcache = []


def cacheicons():
    """read icon filenames into a list we can lookup later """
    iconcache = glob.glob('/usr/share/icons/*/*/apps/*.png')
    for i in glob.glob('/usr/share/pixmaps/*.png'):
        iconcache.append(i)
    return iconcache


def generate():
    """ Get desktop entries from directories, parse them,
    store in holders,   sort, then print to stdout """
    for i in globaldirs:
        globallist.extend(getnames(i))
    
    for i in globallist:
        globalhold.append(getentries(i))

    globalhold.sort(lambda x, y: cmp(x[0].lower(), y[0].lower()))
    
    audstore = [i for i in globalhold if i[3] == 1 and i[4] == 0]
    devstore = [i for i in globalhold if i[3] == 2 and i[4] == 0]
    edustore = [i for i in globalhold if i[3] == 3 and i[4] == 0]
    gamstore = [i for i in globalhold if i[3] == 4 and i[4] == 0]
    grastore = [i for i in globalhold if i[3] == 5 and i[4] == 0]
    netstore = [i for i in globalhold if i[3] == 6 and i[4] == 0]
    offstore = [i for i in globalhold if i[3] == 7 and i[4] == 0]
    setstore = [i for i in globalhold if i[3] == 8 and i[4] == 0]
    sysstore = [i for i in globalhold if i[3] == 9 and i[4] == 0]
    utstore = [i for i in globalhold if i[3] == 10 and i[4] == 0]
    
    print "<openbox_pipe_menu>"
    printentries("AudioVideo",  audstore)
    printentries("Development",  devstore)
    printentries("Education",  edustore)
    printentries("Games",  gamstore)
    printentries("Graphics",  grastore)
    printentries("Network",  netstore)
    printentries("Office",  offstore)
    printentries("Settings",  setstore)
    printentries("System",  sysstore)
    printentries("Utilities",  utstore)
    print "</openbox_pipe_menu>"


def getentries(desktopfile):
    """ For a desktop file, parse out the name, exec and icon entries """
    try:
        filein = open(desktopfile)
    except IOError as e:
        print "Error {0}: {1}".format(e.errno, e.strerror)
        return
    
    entryname = ''; entryexec = ''; entryicon = ''; entrycat = 0; nodisp = 0;
    
    for lines in filein:
        if lines[:5] == 'Name=':
            entryname = lines[5:].strip()
        elif lines[:5] == 'Exec=':
            entryexec = lines[5:].strip().split()[0]
        elif lines[:5] == 'Icon=':
            entryicon = lines[5:].strip()
        elif lines[:11] == 'Categories=':
            if string.find(lines, 'AudioVideo', 11) > 0:
                entrycat = 1
            elif string.find(lines, 'Development', 11) > 0:
                entrycat = 2
            elif string.find(lines, 'Education', 11) > 0:
                entrycat = 3
            elif string.find(lines, 'Game', 11) > 0:
                entrycat = 4
            elif string.find(lines, 'Graphics', 11) > 0:
                entrycat = 5
            elif string.find(lines, 'Network', 11) > 0:
                entrycat = 6
            elif string.find(lines, 'Office') > 0:
                entrycat = 7
            elif string.find(lines, 'Settings', 11) > 0:
                entrycat = 8
            elif string.find(lines, 'System', 11) > 0:
                entrycat = 9
            elif string.find(lines, 'Utility', 11) > 0:
                entrycat = 10
        elif lines[:9] == "NoDisplay":
            nodisp = 1
    filein.close()
    
    if entryicon != '' and entryicon[0] == '/' and os.path.exists(entryicon):
      pass
    else:
      entryicon = lookupcachedicon(entryicon)
    
    return entryname, entryexec,  entryicon, entrycat, nodisp


def getnames(direc):
    """ Given a directory, return a list of .desktop files """
    if direc[-1] != '/':
        direc = direc + '/'
    try:
        desktoplist = [files for root, dirs, files in os.walk(direc, True, None, False)]
    except IOError as e:
        print "Error {0}: {1}".format(e.rrno, e.strerror)
    
    desktopfile = [direc + q for q in desktoplist[0] if q[-8:] == ".desktop"]
    return desktopfile


def lookupcachedicon(iconname):
    """look for icon in cache. if not found return empty string """
    for i in iconcache:
        if iconname in i:
            return i
    return ""


def printentries(menu, entries):
    """ Write out the submenu for openbox """
    print "  <menu id=\"pipe{0}\" icon=\"/usr/share/icons/gnome/24x24/status/folder-open.png\" label=\"{0}\">".format(menu)
    for i in entries:
        print "    <item label=\"{0}\" icon=\"{2}\"><action name=\"Execute\"><execute>{1}</execute></action></item>"\
              .format(i[0], i[1], i[2])
    print "  </menu>"


def validate(l):
    """ Check that the directories given actually exist """
    if not os.path.isdir(l):
        print "{0} :- Invalid path. I won't continue\n".format(l)
        sys.exit(1)
    
    return True


if __name__ == '__main__':
    
    for l in sys.argv[1:]:
        if l == '-h' or l =='--help':
            print "{0} <directories> where directories is a space separated list of desktop directories\n"\
                  .format(sys.argv[0])
            sys.exit(0)
            
        if validate(l):
            globaldirs.append(l)
            
    iconcache = cacheicons()
    generate()
