import Formsy from 'formsy-react';

Formsy.addValidationRule('isMoreThan', function (values, value, minValue) {
  return Number(value) > Number(minValue);
});

Formsy.addValidationRule('isLessThan', function (values, value, maxValue) {
  return Number(value) < Number(maxValue);
});