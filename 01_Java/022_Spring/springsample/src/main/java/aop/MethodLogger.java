package aop;

import org.apache.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class MethodLogger {

	private static final Logger logger = Logger.getLogger(MethodLogger.class);

	public Object around(ProceedingJoinPoint pjp) throws Throwable {
		logger.info("start");
		try {
			return pjp.proceed();
		} finally {
			logger.info("end");
		}
	}
}