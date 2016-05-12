import Formsy from 'formsy-react';

Formsy.addValidationRule('isMoreThan', function (values, value, minValue) {
  return Number(value) > Number(minValue);
});