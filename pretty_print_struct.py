# Run 'source pretty.py' in gdb

# (1) - create a pretty printer class

# implement one pretty printer per object type we want to pretty print
class MatrixObjectTypePrinter:
    def __init__(self, val):
        self.val = val

    # Perform the pretty printing
    def to_string(self):
        text = f"\n\tid    : {self.val["id"]}"
        text += f"\n\tmName : {self.val["mName"]}"
        text += f"\n\tmData : {self.val["mData"]["SomeField"]}"
        return text


# (2) -- add pretty printer to lookup
# This function will return the correct type of object -- i.e. construct the right pretty printer.
def MatrixTypeLookup(val):
    if str(val.type) == "MatrixObjectType":
        return MatrixObjectTypePrinter(val)
    return None  # If we find nothing, then return 'None'. (Effectively this is 'null')


# (3) -- Finally we append our lookup function to gdb's lookup function list
gdb.pretty_printers.append(MatrixTypeLookup)
