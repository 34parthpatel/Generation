package com.sttl.hibernate.custom.validation;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

@Constraint(validatedBy = ValueValidationValidatorBaseOnType.class)
@Target({ java.lang.annotation.ElementType.TYPE, java.lang.annotation.ElementType.ANNOTATION_TYPE })
@Retention(java.lang.annotation.RetentionPolicy.RUNTIME)
/*@ReportAsSingleViolation*/
@Documented
public @interface ValueValidationBaseOnType {
	String message() default "Value not match with type.";

	Class<?>[] groups() default {};

	Class<? extends Payload>[] payload() default {};

	String controller();
	String dataType();
	String value();
	
}
