#include "ruby.h"

VALUE consistent_hash(VALUE string) {
  uint32_t h = 0;
  int i;

  for (i = 0; i < RSTRING_LEN(string); i++) {
    uint32_t c = RSTRING_PTR(string)[i];
    h = h * 31 + c;
  }

  return INT2NUM(h);
}

void Init_consistent_hash() {
  rb_define_method(rb_cString, "consistent_hash", consistent_hash, 0);
}
