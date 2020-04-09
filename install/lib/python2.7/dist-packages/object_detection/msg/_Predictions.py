# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from object_detection/Predictions.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import object_detection.msg

class Predictions(genpy.Message):
  _md5sum = "8fe2bd78bcfaea922c71ab27bc03ae4c"
  _type = "object_detection/Predictions"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """Prediction[] predictions

================================================================================
MSG: object_detection/Prediction
string[] classes
float64[] probabilities
int64 xmin
int64 ymin
int64 xmax
int64 ymax
float64 distance
float64 angle
float64 xcoord
float64 ycoord
"""
  __slots__ = ['predictions']
  _slot_types = ['object_detection/Prediction[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       predictions

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(Predictions, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.predictions is None:
        self.predictions = []
    else:
      self.predictions = []

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      length = len(self.predictions)
      buff.write(_struct_I.pack(length))
      for val1 in self.predictions:
        length = len(val1.classes)
        buff.write(_struct_I.pack(length))
        for val2 in val1.classes:
          length = len(val2)
          if python3 or type(val2) == unicode:
            val2 = val2.encode('utf-8')
            length = len(val2)
          buff.write(struct.pack('<I%ss'%length, length, val2))
        length = len(val1.probabilities)
        buff.write(_struct_I.pack(length))
        pattern = '<%sd'%length
        buff.write(struct.pack(pattern, *val1.probabilities))
        _x = val1
        buff.write(_get_struct_4q4d().pack(_x.xmin, _x.ymin, _x.xmax, _x.ymax, _x.distance, _x.angle, _x.xcoord, _x.ycoord))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.predictions is None:
        self.predictions = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.predictions = []
      for i in range(0, length):
        val1 = object_detection.msg.Prediction()
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        val1.classes = []
        for i in range(0, length):
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          start = end
          end += length
          if python3:
            val2 = str[start:end].decode('utf-8')
          else:
            val2 = str[start:end]
          val1.classes.append(val2)
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        pattern = '<%sd'%length
        start = end
        end += struct.calcsize(pattern)
        val1.probabilities = struct.unpack(pattern, str[start:end])
        _x = val1
        start = end
        end += 64
        (_x.xmin, _x.ymin, _x.xmax, _x.ymax, _x.distance, _x.angle, _x.xcoord, _x.ycoord,) = _get_struct_4q4d().unpack(str[start:end])
        self.predictions.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      length = len(self.predictions)
      buff.write(_struct_I.pack(length))
      for val1 in self.predictions:
        length = len(val1.classes)
        buff.write(_struct_I.pack(length))
        for val2 in val1.classes:
          length = len(val2)
          if python3 or type(val2) == unicode:
            val2 = val2.encode('utf-8')
            length = len(val2)
          buff.write(struct.pack('<I%ss'%length, length, val2))
        length = len(val1.probabilities)
        buff.write(_struct_I.pack(length))
        pattern = '<%sd'%length
        buff.write(val1.probabilities.tostring())
        _x = val1
        buff.write(_get_struct_4q4d().pack(_x.xmin, _x.ymin, _x.xmax, _x.ymax, _x.distance, _x.angle, _x.xcoord, _x.ycoord))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.predictions is None:
        self.predictions = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.predictions = []
      for i in range(0, length):
        val1 = object_detection.msg.Prediction()
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        val1.classes = []
        for i in range(0, length):
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          start = end
          end += length
          if python3:
            val2 = str[start:end].decode('utf-8')
          else:
            val2 = str[start:end]
          val1.classes.append(val2)
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        pattern = '<%sd'%length
        start = end
        end += struct.calcsize(pattern)
        val1.probabilities = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
        _x = val1
        start = end
        end += 64
        (_x.xmin, _x.ymin, _x.xmax, _x.ymax, _x.distance, _x.angle, _x.xcoord, _x.ycoord,) = _get_struct_4q4d().unpack(str[start:end])
        self.predictions.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_4q4d = None
def _get_struct_4q4d():
    global _struct_4q4d
    if _struct_4q4d is None:
        _struct_4q4d = struct.Struct("<4q4d")
    return _struct_4q4d
